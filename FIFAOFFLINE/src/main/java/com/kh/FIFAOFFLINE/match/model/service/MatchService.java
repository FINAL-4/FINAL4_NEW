package com.kh.FIFAOFFLINE.match.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.FIFAOFFLINE.match.model.vo.AppMatch;
import com.kh.FIFAOFFLINE.match.model.vo.Match;
import com.kh.FIFAOFFLINE.match.model.vo.MatchFilter;

public interface MatchService {

	int insertMatching(Match m);

	ArrayList<Match> getAllMatchList();

	Match getMatch(int mId);

	ArrayList<AppMatch> getAppMatchList(int mId);

	int appMatch(HashMap<String, Integer> hm);

	ArrayList<Match> getNewMatchList(MatchFilter mf);

	int checkAppMatch(HashMap<String, Integer> hm);

	int cancleAm(HashMap<String, Integer> hm);

}
