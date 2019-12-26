package com.kh.FIFAOFFLINE.team.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.FIFAOFFLINE.common.Pagination;
import com.kh.FIFAOFFLINE.match.model.service.MatchService;
import com.kh.FIFAOFFLINE.match.model.vo.ScoreInfo;
import com.kh.FIFAOFFLINE.match.model.vo.SmsInfo;
import com.kh.FIFAOFFLINE.member.model.exception.MemberException;
import com.kh.FIFAOFFLINE.member.model.service.MemberService;
import com.kh.FIFAOFFLINE.member.model.vo.Member;
import com.kh.FIFAOFFLINE.team.model.exception.TeamException;
import com.kh.FIFAOFFLINE.team.model.service.TeamService;
import com.kh.FIFAOFFLINE.team.model.vo.PageInfo;
import com.kh.FIFAOFFLINE.team.model.vo.Team;
import com.kh.FIFAOFFLINE.team.model.vo.TeamAD;
import com.kh.FIFAOFFLINE.team.model.vo.TeamFilter;
import com.kh.FIFAOFFLINE.team.model.vo.TeamJoinedMember;
import com.kh.FIFAOFFLINE.team.model.vo.TeamMember;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class TeamController {

	@Autowired
	private TeamService tService;

	@Autowired
	private MemberService mService;

	@Autowired
	private MatchService maService;

	@RequestMapping("tlist.tm")
	public ModelAndView teamList(ModelAndView mv, HttpSession session, TeamFilter tf,
			@RequestParam(value = "page", required = false) Integer page) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = tService.getListCount();
//		System.out.println(listCount);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<Team> list = tService.selectList(pi);

		Member loginUser = (Member) session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();

		ArrayList<Team> teamLeader = tService.selectTeamLeader(userNo);

		System.out.println("리더인 팀 : " + teamLeader);

		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.addObject("teamLeader", teamLeader);
		mv.setViewName("team/teamListView");

		return mv;
	}

	@RequestMapping("moreList.tm")
	public void moreList(HttpServletResponse response, HttpServletRequest request, TeamFilter tf,
			@RequestParam(value = "page", required = false) Integer page) throws IOException, ServletException {
		response.setContentType("application/json;charset=utf-8");

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		int listCount = tService.getSearchListCount(tf);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<Team> list = tService.selectSearchList(pi, tf);

		JSONArray jArr = new JSONArray();
		JSONArray jArr2 = new JSONArray();

		JSONObject jObj2 = new JSONObject();

		jObj2.put("currentPage", pi.getCurrentPage());
		jObj2.put("listCount", pi.getListCount());
		jObj2.put("pageLimit", pi.getPageLimit());
		jObj2.put("maxPage", pi.getMaxPage());
		jObj2.put("startPage", pi.getStartPage());
		jObj2.put("endpage", pi.getEndPage());
		jObj2.put("boardLimit", pi.getBoardLimit());

		jArr2.add(jObj2);

		for (Team t : list) {
			JSONObject jObj = new JSONObject();

			jObj.put("teamNo", t.getTeamNo());
			jObj.put("userNo", t.getUserNo());
			jObj.put("userName", t.getUserName());
			jObj.put("teamName", t.getTeamName());
			jObj.put("teamImage", t.getTeamImage());
			jObj.put("teamArea", t.getTeamArea());
			jObj.put("teamIntro", t.getTeamIntro());
			jObj.put("teamAdver", t.getTeamAdver());
			jObj.put("resisterDay", t.getResisterDay());
			jObj.put("ad_status", t.getAd_status());
			jObj.put("recruitCount", t.getRecruitCount());

			jArr.add(jObj);
		}

		JSONObject sendJson = new JSONObject();

		sendJson.put("list", jArr);
		sendJson.put("pi", jArr2);

		System.out.println("more sendJson : " + sendJson);
		System.out.println("listCount: " + listCount);

		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();

	}

	@RequestMapping("tdetail.tm")
	public ModelAndView teamDetail(ModelAndView mv, @RequestParam(value = "teamNo", required = false) Integer teamNo) {

		// 값이 개같이 나오니깐 그냥 쿼리문하나하나 왔다리갔다리하면서 받아오자 줮같네 ㅡㅡ
		int tNo = teamNo;

		Team t = tService.teamDetail(tNo);
		ArrayList<TeamJoinedMember> joinList = tService.selectJoinList(tNo);
		ArrayList<TeamMember> memberList = tService.selectMemberList(tNo);

		String scoreStr = "";

		int winCnt = 0;
		int loseCnt = 0;
		int drawCnt = 0;

		ArrayList<ScoreInfo> score = maService.selectTeamScore(teamNo);

		int allScore = score.size();

		if (score.isEmpty()) {
			scoreStr = "전적이 없습니다.";
		} else {
			for (int i = 0; i < score.size(); i++) {
				if (score.get(i).getResult().equals("승")) {
					winCnt++;
				} else if (score.get(i).getResult().equals("무")) {
					drawCnt++;
				} else {
					loseCnt++;
				}
			}
			scoreStr = "전적 : " + allScore + "전" + winCnt + "승" + drawCnt + "무" + loseCnt + "패";
		}

		System.out.println("전적 : " + scoreStr);

		System.out.println("t : " + t);

		mv.addObject("scoreStr", scoreStr);

		if (t != null) {
			mv.addObject("t", t);
			mv.addObject("joinList", joinList);
			mv.addObject("memberList", memberList);
			mv.setViewName("team/teamDetailView");

			System.out.println(t);

		} else {
			throw new TeamException("팀 자세히보기 실패");
		}

		return mv;
	}

	@RequestMapping("modal.tm")
	public void getModalUser(HttpServletResponse response, int userNo) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		Member m = tService.getModalUser(userNo);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(m, response.getWriter());
	}

	@RequestMapping("cancel.tm")
	public void joinedCancel(HttpServletResponse response, TeamJoinedMember tjm) throws JsonIOException, IOException {

		System.out.println(tjm);

		int teamNo = tjm.getTeamNo();

		Team t = tService.teamDetail(teamNo);

		String teamName = t.getTeamName();

		String text = "";
		int count = 0;

		ArrayList<SmsInfo> amSi = tService.getSmsInfo(tjm.getUserNo());
		for (int i = 0; i < amSi.size(); i++) {
			amSi.get(i).setPhone(amSi.get(i).getPhone().replace("-", ""));
			text = "안녕하세요 :) FIFAOFFLINE 입니다. \n" + "신청하신 " + teamName + "팀에서 가입을 \n" + "거절 하셨습니다.";

			count = sendMSG(amSi.get(i).getUserName(), amSi.get(i).getPhone(), text, count);
			
		}

		int result = tService.joinedCancel(tjm);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(result, response.getWriter());
	}

	@RequestMapping("agree.tm")
	public void joinedAgree(HttpServletResponse response, TeamJoinedMember tjm) throws JsonIOException, IOException {

		System.out.println(tjm);
		int teamNo = tjm.getTeamNo();
		
		int userNo = tjm.getUserNo();
		
		int teamCount = tService.selectTeamMember(userNo);
		
		if(teamCount < 3) {

			Team t = tService.teamDetail(teamNo);
	
			String teamName = t.getTeamName();
	
			String text = "";
			int count = 0;
	
			ArrayList<SmsInfo> amSi = tService.getSmsInfo(tjm.getUserNo());
			for (int i = 0; i < amSi.size(); i++) {
				amSi.get(i).setPhone(amSi.get(i).getPhone().replace("-", ""));
				text = "안녕하세요 :) FIFAOFFLINE 입니다. \n" + "신청하신 " + teamName + "팀에서 가입을 \n" + "승인 하셨습니다.";
	
				count = sendMSG(amSi.get(i).getUserName(), amSi.get(i).getPhone(), text, count);
				
			}
	
			int updateCount = 0;
			int result = 0;	//	팀 조인
			int deleteAD = 0;
			int deleteTJM = 0;
	
			int deleteResult = tService.joinedAgree(tjm); // <- 팀원 신청 리스트에서 해당 사람 없어지는거
			if (deleteResult > 0) {
	
				result = tService.teamJoin(tjm);
				updateCount = tService.updateCount(teamNo);
				deleteAD = tService.deleteAD();
				if (deleteAD > 0) {
					deleteTJM = tService.deleteTJM(teamNo);
				}
				
				Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
				gson.toJson(result, response.getWriter());
				
			}
		}else {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(teamCount, response.getWriter());
		}

		
	}

	@RequestMapping("applyTeam.tm")
	public String applyTeam(TeamJoinedMember tjm, HttpServletRequest request) {

		int result = tService.applyTeam(tjm);

		System.out.println(result);

		return "redirect:tlist.tm";
	}

	@RequestMapping("deleteTeamAD.tm")
	public ModelAndView deleteTeamAD(ModelAndView mv,
			@RequestParam(value = "teamNo", required = false) Integer teamNo) {

		int result = tService.deleteTeamAD(teamNo);

		mv.setViewName("redirect:tlist.tm");

		return mv;
	}

	@RequestMapping("updateTeamView.tm")
	public ModelAndView updateTeamView(ModelAndView mv,
			@RequestParam(value = "teamNo", required = false) Integer teamNo) {

		// 값이 개같이 나오니깐 그냥 쿼리문하나하나 왔다리갔다리하면서 받아오자 줮같네 ㅡㅡ
		int tNo = teamNo;

		Team t = tService.teamDetail(tNo);
		ArrayList<TeamJoinedMember> joinList = tService.selectJoinList(tNo);
		ArrayList<TeamMember> memberList = tService.selectMemberList(tNo);

		if (t != null) {
			mv.addObject("t", t);
			mv.addObject("joinList", joinList);
			mv.addObject("memberList", memberList);
			mv.setViewName("team/teamUpdateView");

			System.out.println(t);

		} else {
			throw new TeamException("팀 수정하기 실패");
		}

		return mv;
	}

	@RequestMapping("updateTeamAD.tm")
	public String updateTeamAD(Team t) {

		int result = tService.updateTeamAD(t);

		return "redirect:tlist.tm";
	}

	@RequestMapping("ADinsert.tm")
	public ModelAndView ADinsertView(ModelAndView mv, TeamAD ta, HttpSession session) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		ta.setUserNo(userNo);

		int result = tService.ADinsert(ta);

		mv.setViewName("redirect:tlist.tm");

		return mv;
	}

	@RequestMapping("createTeamView.tm")
	public ModelAndView createTeam(ModelAndView mv) {

		mv.setViewName("team/createTeamView");

		return mv;
	}

	@RequestMapping(value = "createTeam.tm", method = RequestMethod.POST)
	public String memberInsert(HttpServletRequest request, Team t, TeamMember tm, Model model, HttpSession session,
			@RequestParam(value = "uploadFile", required = false) MultipartFile file) {

		System.out.println("파일명 : " + file);

		Member loginUser = (Member) session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		t.setUserNo(userNo);
		tm.setUserNo(userNo);

		if (!file.getOriginalFilename().contentEquals("")) {
			String teamImage = saveFile(file, request);

			if (teamImage != null) { // 파일이 잘 저장된 경우
				t.setTeamImage(file.getOriginalFilename());
			}
		}
		System.out.println("tm :" + tm);
		System.out.println(t);
		int result = tService.insertTeam(t);

		if (result > 0) {
			String createdTeamName = t.getTeamName();
			Team createdTeam = tService.selectCreatedTeam(createdTeamName);
			int createdTeamNo = createdTeam.getTeamNo();

			tm.setTeamNo(createdTeamNo);

			int result2 = tService.insertCreatedTeamMember(tm);
			session.removeAttribute("myTeam");

			ArrayList<Team> myTeam = tService.selectMyTeam(userNo);
			session.setAttribute("myTeam", myTeam);

			return "redirect:managedTeam.tm";
		}

		return "redirect:managedTeam.tm";

	}

	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일이 저장될 경로를 설정하는 메소드

		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\images\\team";

		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdirs();
		}

		String teamImage = folder + "\\" + file.getOriginalFilename(); // 실제 저장될 파일 경로 + 파일명

		try {
			file.transferTo(new File(teamImage)); // 이 때 파일이 저장된다.
			// 이게 실행되서 파일이 경로에 저장될려면 pom.xml에서 파일 업로드 관련 라이브러리 두개를 추가하고
			// root-context.xml에서 파일 크기 지정을 해줘야지만 파일이 저장된다!!!!!!!!!!!

		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}

		return teamImage;
	}

	@RequestMapping("Du.tm")
	public ModelAndView idDuplicateCheck(String teamName, ModelAndView mv) {
		Map map = new HashMap();
		boolean Usable = tService.checkTeamNameDup(teamName) == 0 ? true : false;
		map.put("Usable", Usable);
		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		return mv;
	}

	@RequestMapping("DupAD.tm")
	public void isDuplicateAD(int teamNo, HttpServletResponse response) throws JsonIOException, IOException {
		int dup = tService.selectDupAD(teamNo);
		System.out.println(dup);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(dup, response.getWriter());
	}

	@RequestMapping("dupApply.tm")
	public void isDuplicateApply(TeamJoinedMember tjm, HttpServletResponse response)
			throws JsonIOException, IOException {

		int dup = tService.selectDupApply(tjm);

		System.out.println("신청했냐? : " + dup);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(dup, response.getWriter());

	}

	@RequestMapping("teamFilter.tm")
	public void teamFilter(HttpServletResponse response, HttpServletRequest request, TeamFilter tf,
			@RequestParam(value = "page", required = false) Integer page) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");

		System.out.println(tf);

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

//		int listCount = tService.getListCount();

		int searchListCount = tService.getSearchListCount(tf);

		PageInfo pi = Pagination.getPageInfo(currentPage, searchListCount);

		System.out.println(searchListCount);

		ArrayList<Team> list = tService.selectSearchList(pi, tf);

		// 여기까지가 리스트 받아온거임 ( 검색한거 )

		JSONArray jArr = new JSONArray();
		JSONArray jArr2 = new JSONArray();

		JSONObject jObj2 = new JSONObject();

		jObj2.put("currentPage", pi.getCurrentPage());
		jObj2.put("listCount", pi.getListCount());
		jObj2.put("pageLimit", pi.getPageLimit());
		jObj2.put("maxPage", pi.getMaxPage());
		jObj2.put("startPage", pi.getStartPage());
		jObj2.put("endpage", pi.getEndPage());
		jObj2.put("boardLimit", pi.getBoardLimit());

		jArr2.add(jObj2); // 페이지 정보 Jobj로 만들어서 jArr에 하나 담고

		for (Team t : list) {
			JSONObject jObj = new JSONObject();

			jObj.put("teamNo", t.getTeamNo());
			jObj.put("userNo", t.getUserNo());
			jObj.put("userName", t.getUserName());
			jObj.put("teamName", t.getTeamName());
			jObj.put("teamImage", t.getTeamImage());
			jObj.put("teamArea", t.getTeamArea());
			jObj.put("teamIntro", t.getTeamIntro());
			jObj.put("teamAdver", t.getTeamAdver());
			jObj.put("resisterDay", t.getResisterDay());
			jObj.put("ad_status", t.getAd_status());
			jObj.put("recruitCount", t.getRecruitCount());

			jArr.add(jObj); // 리스트 jobj로 만들어서 jArr에 하나 더 담고
		}

		JSONObject sendJson = new JSONObject();

		sendJson.put("list", jArr);
		sendJson.put("pi", jArr2);

		System.out.println("sendJson : " + sendJson);

		// jArr 2개를 보낼 jObj에 담고

		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();

		// 보내고

	}

	@RequestMapping("searchTeamName.tm")
	public void searchTeamName(String teamName, HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		
		ArrayList<Team> tList = tService.searchTeamName(teamName);

		System.out.println("검색된 팀 : " + tList);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(tList, response.getWriter());
	}

	@RequestMapping("managedTeam.tm")
	public ModelAndView managedTeam(ModelAndView mv, HttpSession session) {

		ArrayList<Member> mList = mService.selectAllMember();
		ArrayList<Team> tList = tService.selectAllTeam();

		Member loginUser = (Member) session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();

		ArrayList<Team> inviteMeTeam = tService.selectInviteMe(userNo);
		ArrayList<Team> teamLeader = tService.selectTeamLeader(userNo);

		mv.addObject("inviteMeTeam", inviteMeTeam);
		mv.addObject("tList", tList);
		mv.addObject("teamLeader", teamLeader);
		mv.addObject("mList", mList);
		mv.setViewName("team/teamManageView");

		return mv;
	}

	@RequestMapping("drawMember.tm")
	public void drawMember(int userNo, HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		Member m = mService.drawMember(userNo);

		System.out.println(m);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(m, response.getWriter());
	}

	@RequestMapping("moreTeamMember.tm")
	public void moreTeamMember(int teamNo, HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");

		ArrayList<TeamMember> tMember = tService.moreTeamMember(teamNo);

		JSONArray jArr = new JSONArray();
		JSONArray jArr2 = new JSONArray();

		JSONObject jObj2 = new JSONObject();

		JSONObject sendJson = new JSONObject();

		String scoreStr = "";

		int winCnt = 0;
		int loseCnt = 0;
		int drawCnt = 0;

		ArrayList<ScoreInfo> score = maService.selectTeamScore(teamNo);

		int allScore = score.size();

		if (score.isEmpty()) {
			scoreStr = "전적이 없습니다.";
		} else {
			for (int i = 0; i < score.size(); i++) {
				if (score.get(i).getResult().equals("승")) {
					winCnt++;
				} else if (score.get(i).getResult().equals("무")) {
					drawCnt++;
				} else {
					loseCnt++;
				}
			}
			scoreStr = allScore + "전" + winCnt + "승" + drawCnt + "무" + loseCnt + "패";
		}

		for (TeamMember t : tMember) {
			JSONObject jObj = new JSONObject();

			jObj.put("teamNo", t.getTeamNo());
			jObj.put("userNo", t.getUserNo());
			jObj.put("userName", t.getUserName());
			jObj.put("position", t.getPosition());
			jObj.put("profile", t.getProfile());
			jObj.put("t_grade", t.getT_Grade());

			jArr.add(jObj); // 리스트 jobj로 만들어서 jArr에 하나 더 담고
		}

		jObj2.put("scoreStr", scoreStr);
		jArr2.add(jObj2);

		sendJson.put("tMember", jArr);
		sendJson.put("scoreStr", jArr2);

		System.out.println("sendJson : " + sendJson);

		// jArr 2개를 보낼 jObj에 담고

		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();

	}

	@RequestMapping("choiceTeamMember.tm")
	public void choiceTeamMember(int teamNo, HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		ArrayList<TeamMember> tMember = tService.moreTeamMember(teamNo);

		int[] tNo = new int[tMember.size()];

		for (int i = 0; i < tMember.size(); i++) {
			tNo[i] = tMember.get(i).getUserNo();
		}

		System.out.println("tNo : " + Arrays.toString(tNo));

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(tNo, response.getWriter());

	}

	@RequestMapping("inviteTeam.tm")
	public void inviteTeam(int[] sendArr, int teamNo, HttpServletResponse response)
			throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");

		System.out.println("sendArr : " + Arrays.toString(sendArr));
		System.out.println("teamNo : " + teamNo);
		int inviteResult = 0;
		TeamJoinedMember tjm = new TeamJoinedMember();

		tjm.setTeamNo(teamNo);

		for (int i = 0; i < sendArr.length; i++) {

			tjm.setUserNo(sendArr[i]);
			inviteResult += tService.inviteTeam(tjm);
		}

		System.out.println("inviteResult : " + inviteResult);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(inviteResult, response.getWriter());

	}

	@RequestMapping("modalTeam.tm")
	public void modalTeam(int teamNo, HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");

		Team t = tService.getModalTeam(teamNo);

		String scoreStr = "";

		int winCnt = 0;
		int loseCnt = 0;
		int drawCnt = 0;

		ArrayList<ScoreInfo> score = maService.selectTeamScore(teamNo);

		int allScore = score.size();

		if (score.isEmpty()) {
			scoreStr = "전적이 없습니다.";
		} else {
			for (int i = 0; i < score.size(); i++) {
				if (score.get(i).getResult().equals("승")) {
					winCnt++;
				} else if (score.get(i).getResult().equals("무")) {
					drawCnt++;
				} else {
					loseCnt++;
				}
			}
			scoreStr = allScore + "전" + winCnt + "승" + drawCnt + "무" + loseCnt + "패";
		}

		System.out.println("전적 : " + scoreStr);

		JSONArray jArr2 = new JSONArray();

		JSONObject jObj2 = new JSONObject();

		jObj2.put("teamName", t.getTeamName());
		jObj2.put("teamArea", t.getTeamArea());
		jObj2.put("teamImage", t.getTeamImage());
		jObj2.put("userName", t.getUserName());
		jObj2.put("scoreStr", scoreStr);

		PrintWriter out = response.getWriter();
		out.print(jObj2);
		out.flush();
		out.close();

	}

	@RequestMapping("inviteAgree.tm")
	public void inviteAgree(int teamNo, HttpServletResponse response, HttpSession session)
			throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");

		TeamJoinedMember tjm = new TeamJoinedMember();

		Member loginUser = (Member) session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();

		tjm.setUserNo(userNo);
		tjm.setTeamNo(teamNo);

		Team t = tService.teamDetail2(teamNo);

		int teamJoin = 0;
		int deleteInvite = tService.inviteAgree(tjm);

		if (deleteInvite > 0) {
			teamJoin = tService.teamJoin(tjm);
		}

		if (teamJoin > 0) {
			session.removeAttribute("myTeam");

			ArrayList<Team> myTeam = tService.selectMyTeam(userNo);
			session.setAttribute("myTeam", myTeam);

		}

		System.out.println("t : " + t);
		
		 String userName = loginUser.getUserName(); String teamName = t.getTeamName();
		  
		 System.out.println(teamName); System.out.println(userName);
		 
		 
		 
		 String text = ""; int count = 0;
		 
		 ArrayList<SmsInfo> amSi = tService.getSmsInfo(t.getUserNo()); for(int i = 0 ;
		 i<amSi.size() ; i++) {
		 amSi.get(i).setPhone(amSi.get(i).getPhone().replace("-", "")); text =
		 "안녕하세요 :) FIFAOFFLINE 입니다. \n" +teamName+ "팀에서 보냈던 초대를 \n" +userName+
		 "님이 승인 하셨습니다.";
		 
		 count = sendMSG(amSi.get(i).getUserName(), amSi.get(i).getPhone(), text, count); 
		 
		 }
		 

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(teamJoin, response.getWriter());

	}

	@RequestMapping("updateTeamInfo.tm")
	public ModelAndView updateTeamInfo(ModelAndView mv, HttpSession session, int teamNo) {

		Team t = tService.teamDetail2(teamNo);

		String scoreStr = "";

		int winCnt = 0;
		int loseCnt = 0;
		int drawCnt = 0;

		ArrayList<ScoreInfo> score = maService.selectTeamScore(teamNo);

		int allScore = score.size();

		if (score.isEmpty()) {
			scoreStr = "전적이 없습니다.";
		} else {
			for (int i = 0; i < score.size(); i++) {
				if (score.get(i).getResult().equals("승")) {
					winCnt++;
				} else if (score.get(i).getResult().equals("무")) {
					drawCnt++;
				} else {
					loseCnt++;
				}
			}
			scoreStr = "전적 : " + allScore + "전" + winCnt + "승" + drawCnt + "무" + loseCnt + "패";
		}

		System.out.println("전적 : " + scoreStr);

		System.out.println("t : " + t);

		mv.addObject("scoreStr", scoreStr);
		mv.addObject("t", t);
		mv.setViewName("team/updateTeamInfoView");

		return mv;
	}

	@RequestMapping("updateTeam.tm")
	public String updateTeam(HttpServletRequest request, Team t, String ImgStr, HttpSession session,
			@RequestParam(value = "uploadFile", required = false) MultipartFile file) {

		System.out.println("파일명 : " + file);

		Member loginUser = (Member) session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		t.setUserNo(userNo);

		String teamImage = saveFile(file, request);

		if (file.getOriginalFilename().equals("")) {
			t.setTeamImage(ImgStr);
		} else {
			if (teamImage != null) { // 파일이 잘 저장된 경우
				t.setTeamImage(file.getOriginalFilename());
			}

		}

		int updateInfo = tService.updateTeamInfo(t);

		if (updateInfo > 0) {
			session.removeAttribute("myTeam");

			ArrayList<Team> myTeam = tService.selectMyTeam(userNo);
			session.setAttribute("myTeam", myTeam);
		}

		System.out.println("지금 수정한놈  :" + t);

		return "redirect:managedTeam.tm";
	}

	@RequestMapping("breakUpTeam.tm")
	public void breakUpTeam(int teamNo, HttpServletResponse response, HttpSession session)
			throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");

		Member loginUser = (Member) session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();

		// 1. 팀 지우기
		int deleteTeam = tService.deleteTeam(teamNo);
		// 2. 팀 모집글 지우고
		int deleteTeamAD = tService.deleteTeamAD(teamNo);
		// 3. 팀 멤버 다 지우고
		int deleteTeamM = tService.deleteTeamM(teamNo);
		// 4. 팀에 신청한 사람 지우고
		int deleteTJM = tService.deleteTJM(teamNo);

		if (deleteTeam > 0) {
			session.removeAttribute("myTeam");

			ArrayList<Team> myTeam = tService.selectMyTeam(userNo);
			session.setAttribute("myTeam", myTeam);
		}

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(deleteTeam, response.getWriter());
	}

	@RequestMapping("withdrawal.tm")
	public void withdrawal(int teamNo, HttpServletResponse response, HttpSession session)
			throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");

		Member loginUser = (Member) session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();

		TeamMember tm = new TeamMember();

		tm.setUserNo(userNo);
		tm.setTeamNo(teamNo);

		int withdrawal = tService.withdrawal(tm);

		if (withdrawal > 0) {
			session.removeAttribute("myTeam");

			ArrayList<Team> myTeam = tService.selectMyTeam(userNo);
			session.setAttribute("myTeam", myTeam);
		}

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(withdrawal, response.getWriter());
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
		params.put("type", "LMS");
		params.put("text", text);
		/* params.put("app_version", "test app 1.2"); */

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println("전송 성공");
			// System.out.println(obj.toString());
			return ++count;
		} catch (CoolsmsException e) {
			System.out.println("전송 실패");
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
			return count;
		}

		// ===========================================
	}
	
	@RequestMapping("inviteDeny.tm")
	public void inviteDeny(int teamNo, HttpServletResponse response, HttpSession session)
			throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		
		
		TeamJoinedMember tjm = new TeamJoinedMember();

		Member loginUser = (Member) session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();

		tjm.setUserNo(userNo);
		tjm.setTeamNo(teamNo);

		Team t = tService.teamDetail2(teamNo);

		
		int deleteInvite = tService.inviteAgree(tjm);

		


		 System.out.println("t : " + t);
		
		 String userName = loginUser.getUserName(); String teamName = t.getTeamName();
		  
		 System.out.println(teamName); System.out.println(userName);
		 
		 
		 
		 String text = ""; int count = 0;
		 
		 ArrayList<SmsInfo> amSi = tService.getSmsInfo(t.getUserNo()); for(int i = 0 ;
		 i<amSi.size() ; i++) {
		 amSi.get(i).setPhone(amSi.get(i).getPhone().replace("-", "")); text =
		 "안녕하세요 :) FIFAOFFLINE 입니다. \n" +teamName+ "팀에서 보냈던 초대를 \n" +userName+
		 "님이 거절 하셨습니다.";
		 
		 count = sendMSG(amSi.get(i).getUserName(), amSi.get(i).getPhone(), text, count); 
		
		 }
		 

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(deleteInvite, response.getWriter());
	}
	
	@RequestMapping("banishment.tm")
	public void banishmentTeam(TeamMember tm, HttpServletResponse response, HttpSession session)
			throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		
		int banishmentTeam = tService.banishmentTeam(tm);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(banishmentTeam, response.getWriter());
	}
	

}
