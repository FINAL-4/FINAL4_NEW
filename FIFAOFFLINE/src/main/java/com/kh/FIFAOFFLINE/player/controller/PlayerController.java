package com.kh.FIFAOFFLINE.player.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.FIFAOFFLINE.member.model.service.MemberService;
import com.kh.FIFAOFFLINE.member.model.vo.Member;
import com.kh.FIFAOFFLINE.player.model.exception.PlayerException;
import com.kh.FIFAOFFLINE.player.model.service.PlayerService;
import com.kh.FIFAOFFLINE.player.model.vo.P_ENROLL;
import com.kh.FIFAOFFLINE.player.model.vo.P_RECRUIT;

@Controller
public class PlayerController {

	@Autowired
	private PlayerService pService;
	
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
		
		// System.out.println("controller test rNum : " + rNum);
		if(pRecruit != null) {
			mv.addObject("pRecruit", pRecruit);
			mv.setViewName("player/applyDetailPlayer");
		} else {
			throw new PlayerException("용병 모집 글 디테일 보기 실패");
		}
		return mv;
	}
	
	// 용병 모집 글 작성 페이지(팀)
	@RequestMapping("playTeamCreate.pl")
	public String playTeamCreate() {
		return "player/createTeamPlayer";
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
		/* 
		System.out.println("마감 인원 : "+request.getParameter("deadline"));
		System.out.println("참가비 : "+request.getParameter("rMoney"));
		System.out.println("========================================");
		System.out.println("장소 : "+request.getParameter("rPlace"));
		System.out.println("X좌표 : "+request.getParameter("rPlaceX"));
		System.out.println("Y좌표 : "+request.getParameter("rPlaceY"));
		System.out.println("========================================");
		System.out.println("날짜 : "+request.getParameter("rDay"));
		System.out.println("시작시간 : "+request.getParameter("rsHour"));
		System.out.println("시작분 : "+request.getParameter("rsMin"));
		System.out.println("종료시각 : "+request.getParameter("rfHour"));
		System.out.println("종료분 : "+request.getParameter("rfMin"));
		System.out.println("========================================");
		System.out.println("남기는말 : "+request.getParameter("rContent"));
		*/
		
		
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
	public ModelAndView playTeamModifyView(ModelAndView mv, int rNum) {
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
	public ModelAndView personApply(ModelAndView mv, int userNo, HttpServletRequest request) {
		//System.out.println("컨트롤러 신청 " + userNo);
		int result = pService.personApply(userNo);
		
		if(result > 0 ) {
			//System.out.println("컨트롤러 신청 : " + result);
			mv.setViewName("redirect:playMain.pl");
		} else {
			throw new PlayerException("개인 용병 신청 실패");
		}
		return mv;
	}
	
}
