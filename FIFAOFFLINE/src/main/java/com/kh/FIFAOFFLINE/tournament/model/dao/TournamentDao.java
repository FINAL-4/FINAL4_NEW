package com.kh.FIFAOFFLINE.tournament.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.FIFAOFFLINE.tournament.model.vo.Tournament;
import com.kh.FIFAOFFLINE.tournament.model.vo.TournamentInfo;
import com.kh.FIFAOFFLINE.tournament.model.vo.TournamentSche;

@Repository("toDao")
public class TournamentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<TournamentInfo> getAllTournament() {
		
		return (ArrayList)sqlSession.selectList("tournamentMapper.selectAllList");
	}

	public int insertToInfo() {
		
		return sqlSession.insert("tournamentMapper.insertToInfo");
	}

	public int selectCreateTo() {
		
		return sqlSession.selectOne("tournamentMapper.selectCreateTo");
	}

	public int insertToSche(HashMap<String, Integer> hs) {
		
		return sqlSession.insert("tournamentMapper.insertToSche", hs);
	}

	public int insertToResult(HashMap<String, Integer> hs) {
		
		return sqlSession.insert("tournamentMapper.insertToResult", hs);
	}

	public ArrayList<Tournament> getToResultList(int toNo) {
		
		return (ArrayList)sqlSession.selectList("tournamentMapper.selectResultList", toNo);
	}

	public ArrayList<TournamentSche> getToScheList(int toNo) {
		
		return (ArrayList)sqlSession.selectList("tournamentMapper.selectScheList", toNo);
	}

	public TournamentInfo getTournament(int toNo) {
		
		return sqlSession.selectOne("tournamentMapper.selectToInfo", toNo);
	}

	public int saveResult(Tournament tr) {
		
		return sqlSession.update("tournamentMapper.updateResult", tr);
	}
}
