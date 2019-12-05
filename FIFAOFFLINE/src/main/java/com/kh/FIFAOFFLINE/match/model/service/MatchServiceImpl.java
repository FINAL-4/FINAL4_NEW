package com.kh.FIFAOFFLINE.match.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.FIFAOFFLINE.match.model.dao.MatchDao;
import com.kh.FIFAOFFLINE.match.model.vo.AppMatch;
import com.kh.FIFAOFFLINE.match.model.vo.Match;
import com.kh.FIFAOFFLINE.match.model.vo.MatchFilter;
import com.kh.FIFAOFFLINE.match.model.vo.SmsInfo;

@Service("maService")
public class MatchServiceImpl implements MatchService{

	@Autowired
	MatchDao maDao;

	@Override
	public int insertMatching(Match m) {
		
		return maDao.insertMatching(m);
	}

	@Override
	public ArrayList<Match> getAllMatchList() {
		
		return maDao.getAllMatchList();
	}

	@Override
	public Match getMatch(int mId) {
		
		return maDao.getMatch(mId);
	}

	@Override
	public ArrayList<AppMatch> getAppMatchList(int mId) {
		
		return maDao.getAppMatchList(mId);
	}


	@Override
	public int appMatch(HashMap<String, Integer> hm) {
		
		return maDao.appMatch(hm);
	}

	@Override
	public ArrayList<Match> getNewMatchList(MatchFilter mf) {
		
		return maDao.getNewMatchList(mf);
	}

	@Override
	public int checkAppMatch(HashMap<String, Integer> hm) {
		
		return maDao.checkAppMatch(hm);
	}

	@Override
	public int cancleAm(HashMap<String, Integer> hm) {
		
		return maDao.cancleAm(hm);
	}

	@Override
	public int updateMatch(Match m) {
		
		return maDao.updateMatch(m);
	}

	@Override
	public int deleteMatch(int mId) {
		
		return maDao.deleteMatch(mId);
	}

	@Override
	public Match getMyMatchList(int tId) {
		
		return maDao.getMyMatchList(tId);
	}

	@Override
	public int checkSelectTeam(int tId) {
		
		return maDao.checkSelectTeam(tId);
	}

	@Override
	public int confirmMatch(HashMap<String, Integer> hm) {
		
		return maDao.confirmMatch(hm);
	}

	@Override
	public ArrayList<SmsInfo> getSmsInfo(int teamNo) {
		
		return maDao.getSmsInfo(teamNo);
	}




}
