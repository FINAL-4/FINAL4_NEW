package com.kh.FIFAOFFLINE.team.model.service;

import java.util.ArrayList;

import com.kh.FIFAOFFLINE.member.model.vo.Member;
import com.kh.FIFAOFFLINE.team.model.vo.PageInfo;
import com.kh.FIFAOFFLINE.team.model.vo.Team;
import com.kh.FIFAOFFLINE.team.model.vo.TeamAD;
import com.kh.FIFAOFFLINE.team.model.vo.TeamFilter;
import com.kh.FIFAOFFLINE.team.model.vo.TeamJoinedMember;
import com.kh.FIFAOFFLINE.team.model.vo.TeamMember;

public interface TeamService {

	int getListCount();

	ArrayList<Team> selectList(PageInfo pi);

	Team teamDetail(int tNo);

	ArrayList<TeamJoinedMember> selectJoinList(int tNo);

	ArrayList<TeamMember> selectMemberList(int tNo);

	ArrayList<Team> selectMyTeam(int userNo);

	Member getModalUser(int userNo);

	int joinedCancel(TeamJoinedMember tjm);

	int joinedAgree(TeamJoinedMember tjm);

	int teamJoin(TeamJoinedMember tjm);

	int applyTeam(TeamJoinedMember tjm);

	int deleteTeamAD(Integer teamNo);

	int updateTeamAD(Team t);

	ArrayList<Team> selectTeamLeader(int userNo);

	int ADinsert(TeamAD ta);

	int insertTeam(Team t);

	int checkTeamNameDup(String teamName);

	Team selectCreatedTeam(String createdTeamName);

	int insertCreatedTeamMember(TeamMember tm);

	int selectDupAD(int teamNo);

	int selectDupApply(TeamJoinedMember tjm);

	int updateCount(int teamNo);

	int deleteAD();

	int deleteTJM(int teamNo);

	int getSearchListCount(TeamFilter tf);

	ArrayList<Team> selectSearchList(PageInfo pi, TeamFilter tf);

	Team searchTeamName(String teamName);

	ArrayList<Team> selectAllTeam();

	ArrayList<TeamMember> moreTeamMember(int teamNo);
	
	

}
