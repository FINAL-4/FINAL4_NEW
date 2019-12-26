package com.kh.FIFAOFFLINE.match.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.FIFAOFFLINE.match.model.vo.AppMatch;
import com.kh.FIFAOFFLINE.match.model.vo.Match;
import com.kh.FIFAOFFLINE.match.model.vo.MatchFilter;
import com.kh.FIFAOFFLINE.match.model.vo.ScoreInfo;
import com.kh.FIFAOFFLINE.match.model.vo.SmsInfo;
import com.kh.FIFAOFFLINE.member.model.vo.Member;
import com.kh.FIFAOFFLINE.team.model.vo.Team;

public interface MatchService {

	int insertMatching(Match m);

	ArrayList<Match> getAllMatchList();

	Match getMatch(int mId);

	ArrayList<AppMatch> getAppMatchList(int mId);

	int appMatch(HashMap<String, Integer> hm);

	ArrayList<Match> getNewMatchList(MatchFilter mf);

	int checkAppMatch(HashMap<String, Integer> hm);

	int cancleAm(HashMap<String, Integer> hm);

	int updateMatch(Match m);

	int deleteMatch(int mId);

	Match getMyMatchList(int tId);

	int checkSelectTeam(int tId);

	int confirmMatch(HashMap<String, Integer> hm);

	ArrayList<SmsInfo> getSmsInfo(int teamNo);

	Team selectTeam(int tId);

	int selectMemberCount(int tId);

	ArrayList<Member> selectTeamMember(int tId);

	int endMatch(int mId);

	int insertScore(ScoreInfo mySi);

	ArrayList<ScoreInfo> selectTeamScore(int tId);

	ArrayList<ScoreInfo> getPvp(HashMap<String, Integer> hm);

	SmsInfo selectManager(int mTeamNo);


}
