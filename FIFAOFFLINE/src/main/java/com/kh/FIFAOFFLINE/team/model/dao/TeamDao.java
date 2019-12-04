package com.kh.FIFAOFFLINE.team.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.FIFAOFFLINE.member.model.vo.Member;
import com.kh.FIFAOFFLINE.team.model.vo.PageInfo;
import com.kh.FIFAOFFLINE.team.model.vo.Team;
import com.kh.FIFAOFFLINE.team.model.vo.TeamJoinedMember;
import com.kh.FIFAOFFLINE.team.model.vo.TeamMember;

@Repository("tDao")
public class TeamDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("teamMapper.getListCount");
	}

	public ArrayList<Team> selectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("teamMapper.selectList", null, rowBounds);
	}

	public Team teamDetail(int tNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("teamMapper.teamDetail",tNo);
	}

	public ArrayList<TeamJoinedMember> selectJoinList(int tNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("teamMapper.selectJoinList",tNo);
	}

	public ArrayList<TeamMember> selectMemberList(int tNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("teamMapper.selectMemberList",tNo);
	}

	public ArrayList<Team> selectMyTeam(int userNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("teamMapper.selectMyTeam",userNo);
	}

	public Member getModalUser(int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("teamMapper.getModalUser",userNo);
	}

	public int joinedCancel(TeamJoinedMember tjm) {
		// TODO Auto-generated method stub
		return sqlSession.delete("teamMapper.joinedCancel", tjm);
	}

	public int joinedAgree(TeamJoinedMember tjm) {
		// TODO Auto-generated method stub
		return sqlSession.delete("teamMapper.joinedCancel", tjm);
	}

	public int teamJoin(TeamJoinedMember tjm) {
		// TODO Auto-generated method stub
		return sqlSession.insert("teamMapper.teamJoin", tjm);
	}

	public int applyTeam(TeamJoinedMember tjm) {
		// TODO Auto-generated method stub
		return sqlSession.insert("teamMapper.applyTeam",tjm);
	}

	public int deleteTeamAD(Integer teamNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("teamMapper.deleteTeamAD",teamNo);
	}

	public int updateTeamAD(Team t) {
		// TODO Auto-generated method stub
		return sqlSession.update("teamMapper.updateTeamAD", t);
	}
}
