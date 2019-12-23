package com.kh.FIFAOFFLINE.player.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.FIFAOFFLINE.match.model.vo.SmsInfo;
import com.kh.FIFAOFFLINE.member.model.vo.Member;
import com.kh.FIFAOFFLINE.player.model.exception.PlayerException;
import com.kh.FIFAOFFLINE.player.model.service.PlayerService;
import com.kh.FIFAOFFLINE.player.model.vo.P_ENROLL;
import com.kh.FIFAOFFLINE.player.model.vo.P_EN_LIST;
import com.kh.FIFAOFFLINE.player.model.vo.P_LIST;
import com.kh.FIFAOFFLINE.player.model.vo.P_RECRUIT;
import com.kh.FIFAOFFLINE.team.model.service.TeamService;
import com.kh.FIFAOFFLINE.team.model.vo.Team;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class PlayerController {

	@Autowired
	private PlayerService pService;
	@Autowired
	private TeamService tService;
	
	// 용병 메인페이지 (개인용병리스트 + 팀용병리스트)
	@RequestMapping("playMain.pl")
	public ModelAndView playMain(ModelAndView mv) {
		ArrayList<P_RECRUIT> team = pService.teamPlayList();
		ArrayList<P_ENROLL> person = pService.personPlayList();
		
		// System.out.println("team : " + team );
		// System.out.println("person : " + person);
		
		mv.addObject("team", team);
		mv.addObject("person", person);
		mv.setViewName("player/listPlayer");
	
		return mv;
	}
	
	// 용병 등록 리스트 글 누르면 상세보기 페이지
	@RequestMapping("playPersonDetail.pl")
	public ModelAndView playPersonDetail(ModelAndView mv, int eNum) {
		P_ENROLL pEnroll = pService.playPersonDetail(eNum);
		
		// System.out.println("컨트롤러 상세 뷰 테스트  : " + eNum);
		
		if(pEnroll != null) {
			mv.addObject("pEnroll", pEnroll);
			mv.setViewName("player/applyDetailPerson");
		//	System.out.println("컨트롤러 test : " + pEnroll);
		} else {
			throw new PlayerException("용병 등록 글 상세보기 실패");
		}
		return mv;
	}
	
	// 용병 모집 리스트 글 누르면 상세보기 페이지
	@RequestMapping("playTeamDetail.pl")
	public ModelAndView playTeamDetail(ModelAndView mv, int rNum) {
		P_RECRUIT pRecruit = pService.playTeamDetail(rNum);
		ArrayList<P_LIST> pList = pService.applyList(rNum);
		
		// System.out.println("controller test rNum : " + rNum);
		if(pRecruit != null) {
			// System.out.println("컨트롤러 신청 리스트 : " + pList);
			mv.addObject("pRecruit", pRecruit);
			mv.addObject("pList",pList);
			mv.setViewName("player/applyDetailPlayer");
		} else {
			throw new PlayerException("용병 모집 글 디테일 보기 실패");
		}
		return mv;
	}
	
	// 용병 모집 글 작성 페이지(팀)
	@RequestMapping("playTeamCreate.pl")
	public ModelAndView playTeamCreate(ModelAndView mv, HttpSession session) { 
		/* 로그인한 번호를 team 테이블에서 찾아오면 됨 */
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		// System.out.println("컨트롤러 용병 로그인 유저 : " + userNo);
		
		ArrayList<Team> tArr = tService.selectTeamLeader(userNo);
		// System.out.println("컨트롤러 팀 테스트 : " + tArr);
		mv.addObject("tArr", tArr);
		mv.setViewName("player/createTeamPlayer");
		
		return mv;
		
	}
	
	// 용병 등록 글 작성 페이지(개인)  
	@RequestMapping("playPersonCreate.pl")
	public String playPersonCreate() {
		return "player/createPersonPlayer";
	}
	
	// 용병 등록 
	@RequestMapping(value = "playEnroll.pl", method = RequestMethod.POST)
	public String playPersonEnroll(HttpServletRequest request, P_ENROLL pe, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		pe.setUserNo(userNo);
		
		int result = pService.playPersonEnroll(pe);
		
		
		if(result > 0) {
			return "redirect:playMain.pl";
		} else {
			throw new PlayerException("용병 등록 실패");
		}
	}
	
	// 용병 모집  
	@RequestMapping(value = "playCreate.pl", method = RequestMethod.POST)
	public String playTeamCreate(HttpServletRequest request, P_RECRUIT pr, HttpSession session) {				
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		int result = pService.playTeamCreate(pr);
		// System.out.println("Controller test : " + result);
		if(result > 0) {
			return "redirect:playMain.pl";			
		} else {
			throw new PlayerException("용병 모집 등록 실패");
		}
	}
	
	// 용병 모집 글 수정뷰로 보냄
	@RequestMapping("teamPlayListModifyView.pl")
	public ModelAndView playTeamModifyView(ModelAndView mv, int rNum, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		ArrayList<Team> tArr = tService.selectTeamLeader(userNo);
		// System.out.println("컨트롤러 팀 테스트 : " + tArr);
		mv.addObject("tArr", tArr);
		mv.addObject("pr", pService.playTeamDetail(rNum));
		mv.setViewName("player/modifyTeamPlayer");
		return mv;
	}
	
	// 용병 등록 글 수정뷰로 보냄
	@RequestMapping("personPlayListModifyView.pl")
	public ModelAndView playPersonModifyView(ModelAndView mv, int eNum) {
		mv.addObject("pe", pService.playPersonDetail(eNum));
		mv.setViewName("player/modifyPersonPlayer");
		return mv;
	}
	
	// 용병 모집 글 수정
	@RequestMapping("teamPlayListModify.pl")
	public ModelAndView playTeamModify(ModelAndView mv, P_RECRUIT pr, HttpServletRequest request) {
		int result = pService.playTeamModify(pr);
		System.out.println("컨트롤러 테스트 수정 : " + result);
		if(result > 0) {
			mv.setViewName("redirect:playMain.pl");
		} else {
			throw new PlayerException("모집글 수정 실패");
		}
		return mv;
	}
	
	// 용병 등록 글 수정
	@RequestMapping("personPlayListModify.pl")
	public ModelAndView playPersonModify(ModelAndView mv, P_ENROLL pe, HttpServletRequest request) {
		int result = pService.playPersonModify(pe);
	//	System.out.println("컨트롤러 테스트 수정 : " + result);
		if(result > 0) {
			mv.setViewName("redirect:playMain.pl");
		} else {
			throw new PlayerException("등록글 수정 실패");
		}
		return mv;
	}
	
	// 용병 모집 글 삭제
	@RequestMapping("teamPlayListDelete.pl")
	public String teamPlayListDelete(HttpServletRequest request, int rNum) {
		P_RECRUIT pRecruit = pService.playTeamDetail(rNum);
		
		int result = pService.teamPlayListDelete(rNum);
		// System.out.println("삭제 테스트 : " + result);
		if(result > 0) {
			return "redirect:playMain.pl";
		} else {
			throw new PlayerException("용병 모집 글 삭제 실패");
		}
	}
	
	// 용병 등록 글 삭제
	@RequestMapping("personPlayListDelete.pl")
	public String personPlayListDelete(HttpServletRequest request, int eNum) {
		P_ENROLL pEnroll = pService.playPersonDetail(eNum);
		
		int result = pService.personPlayListDelete(eNum);
		
		if(result > 0) {
			return "redirect:playMain.pl";
		} else {
			throw new PlayerException("용병 등록 글 삭제 실패");
		}
 	} 
	
	// 개인 용병 신청 승인
	@RequestMapping("personApply.pl")
	public ModelAndView personApply(ModelAndView mv, HttpServletRequest request, P_ENROLL pe, P_EN_LIST pel, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
	//	int result = pService.personApply(pe);
		int result1 = pService.checkPersonApply(pel);  // <- 신청 하면 리스트에 insert
		if(result1 > 0 ) {
			int result = pService.personApply(pe); // <- 신청한 사람 member 테이블에 count + 1 추가
		}
		mv.addObject("pe", pe);
		mv.setViewName("redirect:playMain.pl");
		return mv;
	} 
	
	// 팀 모집글에 신청하기
	@RequestMapping("teamPlayApply.pl") 
	public ModelAndView teamPlayApply(ModelAndView mv, HttpServletRequest request, P_LIST pl, HttpSession session) { 
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		int result = pService.teamPlayApply(pl);
	 
		mv.addObject("pl", pl); 
		mv.setViewName("redirect:playMain.pl");
		return mv;
	}
	
	// 팀 모집글에 신청하기 
	@RequestMapping("ajaxApplyPlayer.pl")
	public void ajaxApplyPlayer(P_LIST pl, HttpServletResponse response) throws JsonIOException, IOException {
		int aap = pService.ajaxApplyPlayer(pl);
		
	//	System.out.println("컨트롤러 신청 테스트 : " + pl);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(aap,response.getWriter());
	}

	// 개인 용병 글에 신청하기
	@RequestMapping("ajaxApplyPerson.pl")
	public void ajaxApplyPerson(P_EN_LIST pe, int userNo1, HttpServletResponse response) throws JsonIOException, IOException {
		String text = "";
		int count = 0;
		
		int aap = pService.ajaxApplyPerson(pe);
		ArrayList<SmsInfo> smsInfo = pService.SMSservice1(userNo1);
		System.out.println("글쓴이 : " + userNo1);
		System.out.println("개인 용병 문자 1 : " + smsInfo);
		System.out.println("개인 용병 문자 1 : " + aap);
		System.out.println("개인 용병 문자 1 : " + pe);
		
		if(smsInfo.size() > 0 && aap == 0) {
			for(int i = 0; i < smsInfo.size(); i++) {
				smsInfo.get(i).setPhone(smsInfo.get(i).getPhone().replace("-", ""));
				text = "안녕하세요. FIFA OFFLINE 입니다. \n용병이 신청 되었습니다. \n답장을 보내주시면 경기에 대한 자세한 내용을 보내드리겠습니다.";
				
				System.out.println(smsInfo.get(i).getPhone());
				count = sendMSG(smsInfo.get(i).getUserName(), smsInfo.get(i).getPhone(), text, count);
				
			}
			new Gson().toJson(2, response.getWriter());
		} else { 
		new Gson().toJson(aap,response.getWriter());
		}
	}
	
	// 팀 용병 등록 글 중복 확인
	@RequestMapping("checkTeamSelect.pl")
	public void checkTeamSelect(HttpServletResponse response, int mt) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		int result = pService.checkTeamSelect(mt);
		System.out.println(mt);
		
		new Gson().toJson(result, response.getWriter());
	}
	
	// 팀 용병 신청 수락
	@RequestMapping("agreePlay.pl")
	public void agreePlay(HttpServletResponse response, P_LIST pl, P_RECRUIT pr, Member m) throws JsonIOException, IOException {
		//System.out.println("컨트롤러 수락 테스트 : " + pl);
		
		int userNo = pl.getUserNo();
		int rNum = pr.getrNum();
		String text = "";
		int count = 0;
		
		ArrayList<SmsInfo> smsInfo = pService.SMSservice(pl.getUserNo());
		// System.out.println("문자 테스트 : " + smsInfo);
		
		//System.out.println("컨트롤러 수락 테스트 유저 넘버 : " + userNo);
		//System.out.println("컨트롤러 수락 테스트 글 넘버 : " + rNum);
		int applyListdelete = pService.ald(pl);  // <- 신청 리스트에 신청 한 사람 없어지는 거
		//System.out.println("컨트롤러 수락 테스트 : " + applyListdelete);
		
		System.out.println(smsInfo);
		if(applyListdelete > 0 && smsInfo.size() > 0) {
			int agreeResult = pService.agreeResult(m);  // <- 신청 수락 되면 member 에 count 올려 주는 거
			int deadelineUpdate = pService.deadlineUpdate(rNum);  // <- 모집인원 -1
			int deletePlay = pService.deletePlay();  // <- 모집 인원이 0 이 되면 글이 없어짐
			
			//System.out.println(smsInfo);
			for(int i = 0; i < smsInfo.size(); i++) {
				smsInfo.get(i).setPhone(smsInfo.get(i).getPhone().replace("-", ""));
				text = "안녕하세요. FIFA OFFLINE 입니다. \n용병이 수락 되었습니다.";
				
				System.out.println(smsInfo.get(i).getPhone());
				count = sendMSG(smsInfo.get(i).getUserName(), smsInfo.get(i).getPhone(), text, count);
				
			}
			new Gson().toJson(count, response.getWriter());
		} else { 
		new Gson().toJson(applyListdelete,response.getWriter());
		}
	}
	
	// 팀 용병 신청 거절
	@RequestMapping("cancelPlay.pl")
	public void cancelPlay(HttpServletResponse response, P_LIST pl) throws JsonIOException, IOException {		
		String text = "";
		int count = 0;
		
		ArrayList<SmsInfo> smsInfo = pService.SMSservice(pl.getUserNo());
		int result = pService.cancelPlay(pl);  // <- 신청 거절한 사람 리스트에서 없어짐
		
		if(smsInfo.size() > 0 && result > 0) {
			for(int i = 0; i < smsInfo.size(); i++) {
				smsInfo.get(i).setPhone(smsInfo.get(i).getPhone().replace("-", ""));
				text = "안녕하세요. FIFA OFFLINE 입니다. \n죄송하지만 용병이 거절 되었습니다.";
				
				System.out.println(smsInfo.get(i).getPhone());
				count = sendMSG(smsInfo.get(i).getUserName(), smsInfo.get(i).getPhone(), text, count);
				
			}
			new Gson().toJson(count, response.getWriter());
		} else { 
		new Gson().toJson(result,response.getWriter());
		}
	}
	
	// 문자 보내기 
	public int sendMSG(String name, String phone, String text, int count) {
		String api_key = "NCSI7A3WWC9BDVZZ"; 
		String api_secret = "WVXLL6QKHJXWZXQHZBJYHGRHUW06A9HL";
  
		Message coolsms = new Message(api_key, api_secret);
  
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phone); 
		params.put("from", "01033406861");
		params.put("type", "LMS"); params.put("text", text);
  
		try { 
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println("전송 성공"); 
			

			return ++count;
		} catch(CoolsmsException e) { 
			System.out.println("전송 실패");
			System.out.println(e.getMessage()); 
			System.out.println(e.getCode());
			return count;
		}
	}
}
