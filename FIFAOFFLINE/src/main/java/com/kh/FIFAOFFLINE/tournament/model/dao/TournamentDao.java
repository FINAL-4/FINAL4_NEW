package com.kh.FIFAOFFLINE.tournament.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.FIFAOFFLINE.tournament.model.vo.Tournament;
import com.kh.FIFAOFFLINE.tournament.model.vo.TournamentInfo;

@Repository("toDao")
public class TournamentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<TournamentInfo> getAllTournament() {
		
		return (ArrayList)sqlSession.selectList("tournamentMapper.selectAllList");
	}
}
