package com.kh.FIFAOFFLINE.tournament.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.FIFAOFFLINE.tournament.model.dao.TournamentDao;
import com.kh.FIFAOFFLINE.tournament.model.vo.Tournament;
import com.kh.FIFAOFFLINE.tournament.model.vo.TournamentInfo;
import com.kh.FIFAOFFLINE.tournament.model.vo.TournamentSche;

@Service("toService")
public class TournamentServiceImpl implements TournamentService{

	@Autowired
	private TournamentDao toDao;

	@Override
	public ArrayList<TournamentInfo> getAllTournament() {
		
		return toDao.getAllTournament();
	}

	@Override
	public int insertToInfo() {
		
		return toDao.insertToInfo();
	}

	@Override
	public int selectCreateTo() {
		
		return toDao.selectCreateTo();
	}

	@Override
	public int insertToSche(HashMap<String, Integer> hs) {
		
		return toDao.insertToSche(hs);
	}

	@Override
	public int insertToResult(HashMap<String, Integer> hs) {
		
		return toDao.insertToResult(hs);
	}

	@Override
	public ArrayList<Tournament> getToResultList(int toNo) {
		
		return toDao.getToResultList(toNo);
	}

	@Override
	public ArrayList<TournamentSche> getToScheList(int toNo) {
		
		return toDao.getToScheList(toNo);
	}

	@Override
	public TournamentInfo getTournament(int toNo) {
		
		return toDao.getTournament(toNo);
	}

	@Override
	public int saveResult(Tournament tr) {
		
		return toDao.saveResult(tr);
	}

	@Override
	public int updateInfo(TournamentInfo ti) {
		
		return toDao.updateInfo(ti);
	}

	@Override
	public int updateSche(TournamentSche ts) {
		
		return toDao.updateSche(ts);
	}

	@Override
	public int endTo(int toNo) {
		
		return toDao.endTo(toNo);
	}
}
