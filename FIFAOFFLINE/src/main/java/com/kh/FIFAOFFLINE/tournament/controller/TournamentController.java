package com.kh.FIFAOFFLINE.tournament.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.FIFAOFFLINE.tournament.model.service.TournamentService;

@Controller
public class TournamentController {
	
	@Autowired
	private TournamentService toService;
	
	@RequestMapping("goTournament.to")
	public String goTournament() {
		
		return "tournament/tournamentView";
	}
}
