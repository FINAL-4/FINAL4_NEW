package com.kh.FIFAOFFLINE.match.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.FIFAOFFLINE.match.model.vo.AppMatch;
import com.kh.FIFAOFFLINE.match.model.vo.Match;
import com.kh.FIFAOFFLINE.match.model.vo.MatchFilter;
import com.kh.FIFAOFFLINE.match.model.vo.ScoreInfo;
import com.kh.FIFAOFFLINE.match.model.vo.SmsInfo;
import com.kh.FIFAOFFLINE.member.model.vo.Member;
import com.kh.FIFAOFFLINE.team.model.vo.Team;

@Repository("maDao")
public class MatchDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertMatching(Match m) {
		
		return sqlSession.insert("matchMapper.insertMatching", m);
	}

	public ArrayList<Match> getAllMatchList() {
		
		return (ArrayList)sqlSession.selectList("matchMapper.selectAllList");
	}

	public Match getMatch(int mId) {
		
		return (Match)sqlSession.selectOne("matchMapper.selectMatch", mId);
	}

	public ArrayList<AppMatch> getAppMatchList(int mId) {
		
		return (ArrayList)sqlSession.selectList("matchMapper.selectAppMatch", mId);
	}

	public int appMatch(HashMap<String, Integer> hm) {
		
		return sqlSession.insert("matchMapper.insertAppMatching", hm);
	}

	public ArrayList<Match> getNewMatchList(MatchFilter mf) {
		
		return (ArrayList)sqlSession.selectList("matchMapper.selectNewList", mf);
	}

	public int checkAppMatch(HashMap<String, Integer> hm) {
		
		return sqlSession.selectOne("matchMapper.selectAppMatching", hm);
	}

	public int cancleAm(HashMap<String, Integer> hm) {
		
		return sqlSession.delete("matchMapper.cancleAppMatch", hm);
	}

	public int updateMatch(Match m) {

		return sqlSession.update("matchMapper.updateMatch", m);
	}

	public int deleteMatch(int mId) {

		return sqlSession.update("matchMapper.deleteMatch", mId);
	}

	public Match getMyMatchList(int tId) {
		
		return sqlSession.selectOne("matchMapper.selectMyList", tId);
	}

	public int checkSelectTeam(int tId) {
		
		return sqlSession.selectOne("matchMapper.selectCheckTeam", tId);
	}

	public int confirmMatch(HashMap<String, Integer> hm) {

		return sqlSession.update("matchMapper.confirmMatch", hm);
	}

	public ArrayList<SmsInfo> getSmsInfo(int teamNo) {
		
		return (ArrayList)sqlSession.selectList("matchMapper.selectSmsInfo", teamNo);
	}

	public Team selectTeam(int tId) {
		
		return (Team)sqlSession.selectOne("teamMapper.selectTeam", tId);
	}

	public int selectMemberCount(int tId) {
		
		return sqlSession.selectOne("teamMapper.selectMemberCount", tId);
	}

	public ArrayList<Member> selectTeamMember(int tId) {
		
		return (ArrayList)sqlSession.selectList("teamMapper.selectTeamMember", tId);
	}

	public int endMatch(int mId) {
		
		return sqlSession.update("matchMapper.endMatch", mId);
	}

	public int insertScore(ScoreInfo si) {
		
		return sqlSession.insert("matchMapper.insertScore", si);
	}

	public ArrayList<ScoreInfo> selectTeamScore(int tId) {
		
		return (ArrayList)sqlSession.selectList("matchMapper.selectTeamScore", tId);
	}

	public ArrayList<ScoreInfo> getPvp(HashMap<String, Integer> hm) {
		
		return (ArrayList)sqlSession.selectList("matchMapper.getPvp", hm);
	}

	public SmsInfo selectManager(int tId) {
		
		return (SmsInfo)sqlSession.selectOne("matchMapper.selectManager", tId);
	}



}
