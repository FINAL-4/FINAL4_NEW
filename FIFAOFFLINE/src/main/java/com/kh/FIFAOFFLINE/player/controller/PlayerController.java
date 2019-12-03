package com.kh.FIFAOFFLINE.player.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.FIFAOFFLINE.player.model.exception.PlayerException;
import com.kh.FIFAOFFLINE.player.model.service.PlayerService;
import com.kh.FIFAOFFLINE.player.model.vo.P_RECRUIT;

@Controller
public class PlayerController {

	@Autowired
	private PlayerService pService;
	
	// 용병 메인페이지 (개인용병리스트 + 팀용병리스트)
	@RequestMapping("playMain.pl")
	public ModelAndView playMain(ModelAndView mv) {
		ArrayList<P_RECRUIT> list = pService.teamPlayList();
		
		if(list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.setViewName("player/listPlayer");
		} else {
			throw new PlayerException("팀용병 리스트 조회 실패");
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
	
	// 용병 모집 등록 
	@RequestMapping(value = "playCreate.pl", method = RequestMethod.POST)
	public String playTeamCreate(HttpServletRequest request, P_RECRUIT pr) {
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
	
	// 용병 모집 등록글 수정뷰로 보냄
	@RequestMapping("teamPlayListModifyView.pl")
	public ModelAndView playTeamModifyView(ModelAndView mv, int rNum) {
		mv.addObject("pr", pService.playTeamDetail(rNum));
		mv.setViewName("player/modifyTeamPlayer");
		return mv;
	}
	
	// 용병 모집 등록글 수정
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
	
	// 용병 모집 등록글 삭제
	@RequestMapping("teamPlayListDelete.pl")
	public String teamPlayListDelete(HttpServletRequest request, int rNum) {
		P_RECRUIT pRecruit = pService.playTeamDetail(rNum);
		
		int result = pService.teamPlayListDelete(rNum);
		// System.out.println("삭제 테스트 : " + result);
		if(result > 0) {
			return "redirect:playMain.pl";
		} else {
			throw new PlayerException("용병 모집 등록글 삭제 실패");
		}
	}
	
	
}
