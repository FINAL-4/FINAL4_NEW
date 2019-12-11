package com.kh.FIFAOFFLINE.tournament.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.FIFAOFFLINE.tournament.model.dao.TournamentDao;

@Service("toService")
public class TournamentServiceImpl implements TournamentService{

	@Autowired
	private TournamentDao toDao;
}
