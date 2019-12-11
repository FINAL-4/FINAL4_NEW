package com.kh.FIFAOFFLINE.tournament.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.FIFAOFFLINE.tournament.model.dao.TournamentDao;
import com.kh.FIFAOFFLINE.tournament.model.vo.Tournament;
import com.kh.FIFAOFFLINE.tournament.model.vo.TournamentInfo;

@Service("toService")
public class TournamentServiceImpl implements TournamentService{

	@Autowired
	private TournamentDao toDao;

	@Override
	public ArrayList<TournamentInfo> getAllTournament() {
		
		return toDao.getAllTournament();
	}
}
