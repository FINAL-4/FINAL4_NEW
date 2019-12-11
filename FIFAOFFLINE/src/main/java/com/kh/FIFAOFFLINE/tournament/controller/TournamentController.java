package com.kh.FIFAOFFLINE.tournament.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.FIFAOFFLINE.match.model.vo.Match;
import com.kh.FIFAOFFLINE.tournament.model.service.TournamentService;
import com.kh.FIFAOFFLINE.tournament.model.vo.Tournament;

@Controller
public class TournamentController {
	
	@Autowired
	private TournamentService toService;
	
	@RequestMapping("goTournament.to")
	public String goTournament() {
		
		return "tournament/tournamentView";
	}
	
	@RequestMapping("saveResult.to")
	public void saveResult(HttpServletResponse response, String teamNo, String teamName, String score, String slotNum) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");

		Tournament to = new Tournament();
		to.setSlotNum(Integer.valueOf(slotNum));
		
		if(teamNo.equals("null") || teamNo.equals("")) {
			to.setTeamNo(-1);
		}else {
			to.setTeamNo(Integer.valueOf(teamNo));
		}
		
		if(teamName.equals("null") || teamName.equals("진행전")) {
			to.setTeamName(null);
		}else {
			to.setTeamName(teamName);
		}
		
		if(score == null || score.equals("--")) {
			to.setScore(-1);
		}else {
			to.setScore(Integer.valueOf(score));
		}
		
		System.out.println(to);
		new Gson().toJson(1, response.getWriter());
	}
}
