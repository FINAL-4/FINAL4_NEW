package com.kh.FIFAOFFLINE.match.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.FIFAOFFLINE.match.model.exception.MatchException;
import com.kh.FIFAOFFLINE.match.model.service.MatchService;
import com.kh.FIFAOFFLINE.match.model.vo.AppMatch;
import com.kh.FIFAOFFLINE.match.model.vo.Match;
import com.kh.FIFAOFFLINE.match.model.vo.MatchFilter;
import com.kh.FIFAOFFLINE.match.model.vo.ScoreInfo;
import com.kh.FIFAOFFLINE.match.model.vo.SmsInfo;
import com.kh.FIFAOFFLINE.member.model.exception.MemberException;
import com.kh.FIFAOFFLINE.member.model.vo.Member;
import com.kh.FIFAOFFLINE.player.model.service.PlayerService;
import com.kh.FIFAOFFLINE.player.model.vo.P_RECRUIT;
import com.kh.FIFAOFFLINE.team.model.service.TeamService;
import com.kh.FIFAOFFLINE.team.model.vo.Team;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class MatchController {

	@Autowired
	private MatchService maService;

	@Autowired
	private PlayerService pService;
	
	@Autowired
	private TeamService tService;
	
	@RequestMapping("goMatch.ma")
	public ModelAndView goMatching(ModelAndView mv) {

		ArrayList<Match> mList = maService.getAllMatchList();

		mv.addObject("mList", mList);
		mv.setViewName("match/matchListView");


		return mv;
	}

	@RequestMapping("goCreateMatch.ma")
	public String goCreateMatching() {

		return "match/createMatch";
	}

	@RequestMapping("createMatch.ma")
	public String createMatching(HttpServletRequest request, Match m) {
		int result = maService.insertMatching(m);

		if (result == 1) {
			return "redirect:goMatch.ma";
		} else {
			throw new MatchException("매치 등록 실패 !");
		}
	}

	@RequestMapping("goMatchDetail.ma")
	public ModelAndView goMatchDetail(ModelAndView mv, int mId) {
		Match ma = maService.getMatch(mId);

		ArrayList<AppMatch> amList = maService.getAppMatchList(mId);


		mv.addObject("amList", amList);
		mv.addObject("match", ma);
		mv.setViewName("match/applyDetailMatching");

		return mv;
	}

	@RequestMapping("appMatch.ma")
	public void appMatch(HttpServletResponse response, int mId, int tId, int userNo)
			throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");

		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("mId", mId);
		hm.put("tId", tId);
		hm.put("userNo", userNo);

		int result = maService.appMatch(hm);


		if (result == 1) {
			new Gson().toJson(result, response.getWriter());
		} else {
			new Gson().toJson(0, response.getWriter());
		}
	}

	@RequestMapping("showNewList.ma")
	public void showNewList(HttpServletResponse response, MatchFilter mf, String startDate, String endDate)
			throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");

		if (startDate != "" && endDate != "") {
			mf.setsDate(Date.valueOf(startDate));
			mf.seteDate(Date.valueOf(endDate));
		}

		ArrayList<Match> mList = maService.getNewMatchList(mf);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		if (mList != null) {
			gson.toJson(mList, response.getWriter());
		} else {
			gson.toJson("none", response.getWriter());
		}
	}

	@RequestMapping("showMyList.ma")
	public void showMyList(HttpServletResponse response, String tidArr) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");

		String[] array = tidArr.split(",");

		ArrayList<Match> mList = new ArrayList<Match>();
		for (int i = 0; i < array.length; i++) {
			Match m = maService.getMyMatchList(Integer.valueOf(array[i]));
			if (m != null) {
				mList.add(m);
			}
		}


		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		if (mList != null) {
			gson.toJson(mList, response.getWriter());
		} else {
			gson.toJson("none", response.getWriter());
		}

	}

	@RequestMapping("checkAppMatch.ma")
	public void checkAppMatch(HttpServletResponse response, int mId, int tId) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");

		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("mId", mId);
		hm.put("tId", tId);

		int result = maService.checkAppMatch(hm);

		new Gson().toJson(result, response.getWriter());

	}

	@RequestMapping("cancleAm.ma")
	public void cancleAppMatch(HttpServletResponse response, int mId, int tId) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");

		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("mId", mId);
		hm.put("tId", tId);

		int result = maService.cancleAm(hm);

		if (result == 1) {
			new Gson().toJson(result, response.getWriter());
		} else {
			new Gson().toJson(0, response.getWriter());
		}
	}

	@RequestMapping("goUpdateMatch.ma")
	public ModelAndView goUpdateMatch(Match m) {

		ModelAndView mv = new ModelAndView();

		mv.addObject("match", m);
		mv.setViewName("match/updateMatch");

		return mv;
	}

	@RequestMapping("updateMatch.ma")
	public String updateMatch(Match m) {

		int result = maService.updateMatch(m);

		ModelAndView mv = new ModelAndView();

		if (result == 1) {
			return "redirect:goMatch.ma";
			/* goMatchDetail(mv, m.getmId()); */
		} else {
			throw new MatchException("매치 수정 실패 !");
		}
	}

	@RequestMapping("deleteMatch.ma")
	public String deleteMatch(ModelAndView mv, int mId) {

		int result = maService.deleteMatch(mId);

		if (result == 1) {
			return "redirect:goMatch.ma";
		} else {
			throw new MatchException("매치 수정 실패 !");
		}
	}

	@RequestMapping("checkSelectTeam.ma")
	public void checkSelectTeam(HttpServletResponse response, int tId) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");

		int result = maService.checkSelectTeam(tId);

		new Gson().toJson(result, response.getWriter());

	}

	@RequestMapping("confirmMatching.ma")
	public void confirmMatching(HttpServletResponse response, Match m, AppMatch am, String amTeamName,
			String amUserName, String mTeamName, String mUserName, int amTeamNo, int mTeamNo) throws JsonIOException, IOException {

		am.setTeamNo(amTeamNo);
		am.setTeamName(amTeamName);
		am.setUserName(amUserName);
		m.setTeamName(mTeamName);
		m.setUserName(mUserName);
		m.setTeamNo(mTeamNo);
		m.setMtId(amTeamNo);
		
		
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("mId", m.getmId());
		hm.put("mtId", m.getMtId());

		
		int result = maService.confirmMatch(hm);
		
		String text = "";
		int count = 0;
		
		if(result == 1) {
			SmsInfo tMng = maService.selectManager(mTeamNo);
			SmsInfo atMng = maService.selectManager(amTeamNo);
			ArrayList<SmsInfo> amSi = maService.getSmsInfo(am.getTeamNo());
			for(int i = 0 ; i<amSi.size() ; i++) {
				amSi.get(i).setPhone(amSi.get(i).getPhone().replace("-", ""));
				text = "안녕하세요. FIFAOFFLINE입니다.\n"
						+ "성사된 매치에 대한 정보입니다.\n"
						+ "매칭된 팀 : "+mTeamName+"VS"+amTeamName+"\n"
						+ "장소 : "+m.getmLocationName()+"\n"
						+ "일시 : "+m.getmDay()+"\n"
						+ "시간 : "+m.getsHour()+":"+m.getsMinute()+"~"+m.geteHour()+":"+m.geteMinute()+"\n"
						+ "참가비 : "+m.getDues()+"\n"
						+ "팀장 : "+tMng.getUserName()+"("+tMng.getPhone()+")"+"\n"
						+ "상대팀장 : "+atMng.getUserName()+"("+atMng.getPhone()+")"+"\n"
						+ "항상 이용해주셔서 감사합니다. ";
				
				
				count = sendMSG(amSi.get(i).getUserName(), amSi.get(i).getPhone(), text, count);
				
			}
			ArrayList<SmsInfo> mSi = maService.getSmsInfo(m.getTeamNo());
			for(int i = 0 ; i<mSi.size() ; i++) {
				mSi.get(i).setPhone(mSi.get(i).getPhone().replace("-", ""));
				text = "안녕하세요. FIFAOFFLINE입니다.\n"
						+ "성사된 매치에 대한 정보입니다.\n"
						+ "매칭된 팀 : "+amTeamName+"VS"+mTeamName+"\n"
						+ "장소 : "+m.getmLocationName()+"\n"
						+ "일시 : "+m.getmDay()+"\n"
						+ "시간 : "+m.getsHour()+":"+m.getsMinute()+"~"+m.geteHour()+":"+m.geteMinute()+"\n"
						+ "참가비 : "+m.getDues()+"\n"
						+ "팀장 : "+atMng.getUserName()+"("+atMng.getPhone()+")"+"\n"
						+ "상대팀장 : "+tMng.getUserName()+"("+tMng.getPhone()+")"+"\n"
						+ "항상 이용해주셔서 감사합니다. ";
				
				
				count = sendMSG(mSi.get(i).getUserName(), mSi.get(i).getPhone(), text, count);
				
			}
		
			new Gson().toJson(count, response.getWriter());
		}else {
			new Gson().toJson("failed", response.getWriter());
		}
	}
	
	
	public int sendMSG(String name, String phone, String text, int count) {
		// ==============문자 보내기===================

		
		  String api_key = "NCSI7A3WWC9BDVZZ"; 
		  String api_secret = "WVXLL6QKHJXWZXQHZBJYHGRHUW06A9HL";
		  
		 
		  Message coolsms = new Message(api_key, api_secret);
		  

		  // 4 params(to, from, type, text) are mandatory. must be filled
		  HashMap<String, String> params = new HashMap<String, String>();
		  params.put("to", phone); 
		  params.put("from", "01033406861");
		  params.put("type", "LMS"); params.put("text", text);
			/* params.put("app_version", "test app 1.2"); */
		  
		  try { 
			  JSONObject obj = (JSONObject) coolsms.send(params);
			  System.out.println("전송 성공"); 
			  //System.out.println(obj.toString());
			  return ++count;
			  } catch(CoolsmsException e) { 
			  System.out.println("전송 실패");
			  System.out.println(e.getMessage()); 
			  System.out.println(e.getCode());
			  return count;
			}
		
		  
		// ===========================================
	}
	
	@RequestMapping("showTeamInfo.ma")
	public void showTeamInfo(HttpServletResponse response, int tId) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		Team m = maService.selectTeam(tId);
		
		int mc = maService.selectMemberCount(tId);
		m.setMemberCount(mc);
		
		ArrayList<ScoreInfo> sList = maService.selectTeamScore(tId);
		
		int sCount = 0, dCount = 0, lCount = 0;
		for(int i = 0; i<sList.size() ; i++) {
			if(sList.get(i).getResult().equals("승")) {
				sCount++;
			}else if(sList.get(i).getResult().equals("패")) {
				lCount++;
			}else {
				dCount++;
			}
		}
		
		m.setTeamRecord(sList.size()+"전   "+sCount+"승 "+dCount+"무 "+lCount+"패 ");
		
		if(m != null) {
			new Gson().toJson(m, response.getWriter());
		}else {
			throw new MemberException("팀 조회 실패");
		}
	}
	
	@RequestMapping("showMemberInfo.ma")
	public void showMemberInfo(HttpServletResponse response, int tId) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		ArrayList<Member> mList = maService.selectTeamMember(tId);
		
		System.out.println(mList);
		
		if(mList != null) {
			new Gson().toJson(mList, response.getWriter());
		}else {
			throw new MemberException("멤버 조회 실패");
		}
	}

	@RequestMapping("insertResult.ma")
	public String insertResult(int myScore, int yourScore, int tId, int otId, int mId) {
		
		ScoreInfo mySi = new ScoreInfo();
		ScoreInfo oppSi = new ScoreInfo();
				
		mySi.setScore(myScore+" : "+yourScore);
		mySi.settId(tId);
		mySi.setOtId(otId);
		oppSi.setScore(yourScore+" : "+myScore);
		oppSi.settId(otId);
		oppSi.setOtId(tId);
		
		if(myScore > yourScore) {
			mySi.setResult("승");
			oppSi.setResult("패");
		}else if(myScore == yourScore) {
			mySi.setResult("무");
			oppSi.setResult("무");
		}else {
			mySi.setResult("패");
			oppSi.setResult("승");
		}
		
		int cResult = maService.endMatch(mId);
		
		int myResult = maService.insertScore(mySi);
		int oppResult = maService.insertScore(oppSi);
		
		if(cResult == 1 && myResult == 1 && oppResult ==1) {
			return "redirect:goMatch.ma";
		}else {
			throw new MatchException("점수 등록 실패");
		}
	}
	
	
	
	@RequestMapping("showCal.ma")
	public void showCal(HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		ArrayList<P_RECRUIT> team = pService.teamPlayList();
		ArrayList<Match> mList = maService.getAllMatchList();
		
		HashMap resultHM = null;
		ArrayList<HashMap> result = new ArrayList<HashMap>();
		
	
		
		for(int i = 0 ; i< team.size() ; i++) {
			resultHM = new HashMap();
			
			String id = "-"+String.valueOf(team.get(i).getrNum());
			String start = String.valueOf(team.get(i).getrDay());
			String end = String.valueOf(team.get(i).getrDay());
			String title = String.valueOf(team.get(i).getrTitle());
			
			resultHM.put("id", id);
			resultHM.put("start", start);
			resultHM.put("end", end);
			resultHM.put("title", title);
			resultHM.put("color", "#E9CBD1");
			resultHM.put("textColor", "black");
			
			result.add(resultHM);
		}
		
		
		for(int i = 0 ; i < mList.size() ; i++) {
			resultHM = new HashMap();
			String id = String.valueOf(mList.get(i).getmId());
			String start = String.valueOf(mList.get(i).getmDay());
			String end = String.valueOf(mList.get(i).getmDay());
			
			resultHM.put("id", id);
			resultHM.put("start", start);
			resultHM.put("end", end);
			resultHM.put("title", mList.get(i).getmTitle());
			resultHM.put("color", "#798F8C");
			resultHM.put("textColor", "white");
			
			result.add(resultHM);
		}
		
		
		
		new Gson().toJson(result, response.getWriter());
	}
	
	
	
	@RequestMapping("showPvp.ma")
	public void showPvp(HttpServletResponse response, int amtId, int mtId) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		
		hm.put("mtId", mtId);
		hm.put("amtId", amtId);
		
		ArrayList<ScoreInfo> si = maService.getPvp(hm);
		
		String score = "";
		int w = 0, d = 0, l = 0;
		for(int i = 0 ; i < si.size() ; i++) {
			if(si.get(i).getResult().equals("승")) {
				w++;
			}else if(si.get(i).getResult().equals("패")) {
				l++;
			}else {
				d++;
			}
		}
		
		score = si.size()+"전"+w+"승"+d+"무"+l+"패";
				
		
		new Gson().toJson(score, response.getWriter());
	}
	
	
	@RequestMapping("getMyScore.ma")
	public void getMyScore(HttpServletResponse response, int teamNo) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		
		ArrayList<ScoreInfo> si = maService.selectTeamScore(teamNo);
		
				
		
		new Gson().toJson(si, response.getWriter());
	}
	
	@RequestMapping("getTeamInfo.ma")
	public void getTeamInfo(HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		
		ArrayList<Team> tl = tService.selectAllTeam();
		
		Team t = tl.get((int)(Math.random()*tl.size()));
		
		
		new Gson().toJson(t, response.getWriter());
	}
}
