package com.kh.FIFAOFFLINE.team.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.FIFAOFFLINE.team.model.dao.TeamDao;
import com.kh.FIFAOFFLINE.team.model.vo.PageInfo;
import com.kh.FIFAOFFLINE.team.model.vo.Team;

@Service("tService")
public class TeamServiceImpl implements TeamService{

	@Autowired
	private TeamDao tDao;

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return tDao.getListCount();
	}

	@Override
	public ArrayList<Team> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return tDao.selectList(pi);
	}
}
