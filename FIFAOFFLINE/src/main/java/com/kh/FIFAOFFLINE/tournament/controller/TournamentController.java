package com.kh.FIFAOFFLINE.tournament.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.FIFAOFFLINE.match.model.vo.Match;
import com.kh.FIFAOFFLINE.tournament.model.service.TournamentService;
import com.kh.FIFAOFFLINE.tournament.model.vo.Tournament;
import com.kh.FIFAOFFLINE.tournament.model.vo.TournamentInfo;
import com.kh.FIFAOFFLINE.tournament.model.vo.TournamentSche;

@Controller
public class TournamentController {
	
	@Autowired
	private TournamentService toService;
	
	@RequestMapping("showTournament.to")
	public void getTournament(HttpServletResponse response, HttpSession session) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		ArrayList<TournamentInfo> toList = toService.getAllTournament();
		
		session.setAttribute("toList", toList);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		gson.toJson(toList, response.getWriter());
	}
	
	
	@RequestMapping("goTournament.to")
	public String goTournament(HttpSession session, @RequestParam("toNo") int toNo) {
		
		ArrayList<Tournament> trList = toService.getToResultList(toNo);
		ArrayList<TournamentSche> tsList = toService.getToScheList(toNo);
		TournamentInfo to = toService.getTournament(toNo);
		

		session.setAttribute("trList", trList);
		session.setAttribute("tsList", tsList);
		session.setAttribute("to", to);
		
		
		return "tournament/tournamentView";
	}
	
	
	// 대회 만들기
	@RequestMapping("createTo.to")
	public String createTo(RedirectAttributes redirect) {
		
		int result = toService.insertToInfo();
		int toNo = 0;
		
		if(result == 1) {
			toNo = toService.selectCreateTo();
			
			HashMap<String, Integer> hs = new HashMap<String, Integer>();
			hs.put("toNo", toNo);
			
			for(int i = 0 ; i < 15 ; i++) {
				hs.put("sSlotNum", i);
				int sResult = toService.insertToSche(hs);
			}
			
			for(int i = 0 ; i < 30 ; i++) {
				hs.put("rSlotNum", i);
				int sResult = toService.insertToResult(hs);
			}
		}
		
		redirect.addAttribute("toNo", toNo);
		
		return "redirect:goTournament.to";
	}
	
	
	
	@RequestMapping("saveResult.to")
	public void saveResult(HttpServletResponse response, String teamName, String score, String teamLogo, int rSlotNum) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");

		Tournament tr = new Tournament();

		tr.setrSlotNum(rSlotNum);
		
		if(teamName.equals(" 0") || teamName.equals("")) {
			tr.setTeamName(null);
		}else {
			tr.setTeamName(teamName);
		}
		
		
		tr.setTeamLogo(teamLogo);
		
		
		if(score.equals("0") || score.equals("--")) {
			tr.setScore(0);
		}else {
			tr.setScore(Integer.valueOf(score));
		}
		
		int result = toService.saveResult(tr);
		

		new Gson().toJson(result, response.getWriter());
	}
}
