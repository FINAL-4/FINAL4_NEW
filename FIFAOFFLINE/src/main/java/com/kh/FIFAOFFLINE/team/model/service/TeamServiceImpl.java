package com.kh.FIFAOFFLINE.team.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.FIFAOFFLINE.match.model.vo.ScoreInfo;
import com.kh.FIFAOFFLINE.member.model.vo.Member;
import com.kh.FIFAOFFLINE.team.model.dao.TeamDao;
import com.kh.FIFAOFFLINE.team.model.vo.PageInfo;
import com.kh.FIFAOFFLINE.team.model.vo.Team;
import com.kh.FIFAOFFLINE.team.model.vo.TeamAD;
import com.kh.FIFAOFFLINE.team.model.vo.TeamFilter;
import com.kh.FIFAOFFLINE.team.model.vo.TeamJoinedMember;
import com.kh.FIFAOFFLINE.team.model.vo.TeamMember;

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

	@Override
	public Team teamDetail(int tNo) {
		// TODO Auto-generated method stub
		return tDao.teamDetail(tNo);
	}

	@Override
	public ArrayList<TeamJoinedMember> selectJoinList(int tNo) {
		// TODO Auto-generated method stub
		return tDao.selectJoinList(tNo);
	}

	@Override
	public ArrayList<TeamMember> selectMemberList(int tNo) {
		// TODO Auto-generated method stub
		return tDao.selectMemberList(tNo);
	}

	@Override
	public ArrayList<Team> selectMyTeam(int userNo) {
		
		return tDao.selectMyTeam(userNo);
	}

	@Override
	public Member getModalUser(int userNo) {
		// TODO Auto-generated method stub
		return tDao.getModalUser(userNo);
	}

	@Override
	public int joinedCancel(TeamJoinedMember tjm) {
		// TODO Auto-generated method stub
		return tDao.joinedCancel(tjm);
	}

	@Override
	public int joinedAgree(TeamJoinedMember tjm) {
		// TODO Auto-generated method stub
		return tDao.joinedAgree(tjm);
	}

	@Override
	public int teamJoin(TeamJoinedMember tjm) {
		// TODO Auto-generated method stub
		return tDao.teamJoin(tjm);
	}

	@Override
	public int applyTeam(TeamJoinedMember tjm) {
		// TODO Auto-generated method stub
		return tDao.applyTeam(tjm);
	}

	@Override
	public int deleteTeamAD(Integer teamNo) {
		// TODO Auto-generated method stub
		return tDao.deleteTeamAD(teamNo);
	}

	@Override
	public int updateTeamAD(Team t) {
		// TODO Auto-generated method stub
		return tDao.updateTeamAD(t);
	}

	@Override
	public ArrayList<Team> selectTeamLeader(int userNo) {
		System.out.println("서비스 테스트 : " + userNo);
		return tDao.selectTeamLeader(userNo);
	}

	@Override
	public int ADinsert(TeamAD ta) {
		// TODO Auto-generated method stub
		return tDao.ADinsert(ta);
	}

	@Override
	public int insertTeam(Team t) {
		// TODO Auto-generated method stub
		return tDao.insertTeam(t);
	}

	@Override
	public int checkTeamNameDup(String teamName) {
		// TODO Auto-generated method stub
		return tDao.checkTeamNameDup(teamName);
	}

	@Override
	public Team selectCreatedTeam(String createdTeamName) {
		// TODO Auto-generated method stub
		return tDao.selectCreatedTeam(createdTeamName);
	}

	@Override
	public int insertCreatedTeamMember(TeamMember tm) {
		// TODO Auto-generated method stub
		return tDao.insertCreatedTeamMember(tm);
	}

	@Override
	public int selectDupAD(int teamNo) {
		// TODO Auto-generated method stub
		return tDao.selectDupAd(teamNo);
	}

	@Override
	public int selectDupApply(TeamJoinedMember tjm) {
		// TODO Auto-generated method stub
		return tDao.selectDupApply(tjm);
	}

	@Override
	public int updateCount(int teamNo) {
		// TODO Auto-generated method stub
		return tDao.updateCount(teamNo);
	}

	@Override
	public int deleteAD() {
		// TODO Auto-generated method stub
		return tDao.deleteAD();
	}

	@Override
	public int deleteTJM(int teamNo) {
		// TODO Auto-generated method stub
		return tDao.deleteTJM(teamNo);
	}

	@Override
	public int getSearchListCount(TeamFilter tf) {
		// TODO Auto-generated method stub
		return tDao.getSearchListCount(tf);
	}

	@Override
	public ArrayList<Team> selectSearchList(PageInfo pi, TeamFilter tf) {
		// TODO Auto-generated method stub
		return tDao.selectSearchList(pi,tf);
	}

	@Override
	public Team searchTeamName(String teamName) {
		// TODO Auto-generated method stub
		return tDao.searchTeamName(teamName);
	}

	@Override
	public ArrayList<Team> selectAllTeam() {
		// TODO Auto-generated method stub
		return tDao.selectAllTeam();
	}

	@Override
	public ArrayList<TeamMember> moreTeamMember(int teamNo) {
		// TODO Auto-generated method stub
		return tDao.moreTeamMember(teamNo);
	}

	@Override
	public int inviteTeam(TeamJoinedMember tjm) {
		// TODO Auto-generated method stub
		return tDao.inviteTeam(tjm);
	}

	@Override
	public ArrayList<Team> selectInviteMe(int userNo) {
		// TODO Auto-generated method stub
		return tDao.selectInviteMe(userNo);
	}

	@Override
	public Team getModalTeam(int teamNo) {
		// TODO Auto-generated method stub
		return tDao.getModalTeam(teamNo);
	}

	@Override
	public int inviteAgree(TeamJoinedMember tjm) {
		// TODO Auto-generated method stub
		return tDao.inviteAgree(tjm);
	}

	@Override
	public Team teamDetail2(int teamNo) {
		// TODO Auto-generated method stub
		return tDao.teamDetail2(teamNo);
	}

	@Override
	public int updateTeamInfo(Team t) {
		// TODO Auto-generated method stub
		return tDao.updateTeamInfo(t);
	}

	@Override
	public int deleteTeam(int teamNo) {
		// TODO Auto-generated method stub
		return tDao.deleteTeam(teamNo);
	}

	@Override
	public int deleteTeamM(int teamNo) {
		// TODO Auto-generated method stub
		return tDao.deleteTeamM(teamNo);
	}

	@Override
	public int withdrawal(TeamMember tm) {
		// TODO Auto-generated method stub
		return tDao.withdrawal(tm);
	}
	
	


	


}
