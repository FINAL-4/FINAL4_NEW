package com.kh.FIFAOFFLINE.player.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.FIFAOFFLINE.player.model.dao.PlayerDao;
import com.kh.FIFAOFFLINE.player.model.vo.P_ENROLL;
import com.kh.FIFAOFFLINE.player.model.vo.P_RECRUIT;

@Service("pService")
public class PlayerServiceImpl implements PlayerService{

	@Autowired
	private PlayerDao pDao;

	@Override
	public int playTeamCreate(P_RECRUIT pr) {
		return pDao.playTeamCreate(pr);
	}

	@Override
	public ArrayList<P_RECRUIT> teamPlayList() {
		return pDao.teamPlayList();
	}

	@Override
	public P_RECRUIT playTeamDetail(int rNum) {
		return pDao.playTeamDetail(rNum);
	}

	@Override
	public int teamPlayListDelete(int rNum) {
		// System.out.println("써비스 test : " + rNum);
		return pDao.teamPlayListDelete(rNum);
	}

	@Override
	public int playTeamModify(P_RECRUIT pr) {
		// System.out.println("써비스 수정 test : " + pr);
		return pDao.playTeamModify(pr);
	}

	@Override
	public int playPersonEnroll(P_ENROLL pe) {
		// System.out.println("써삐쓰 등록 test : " + pe);
		return pDao.playPersonEnroll(pe);
	}

	@Override
	public ArrayList<P_ENROLL> personPlayList() {
		return pDao.personPlayList();
	}

	
}
