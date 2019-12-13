package com.kh.FIFAOFFLINE.tournament.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.FIFAOFFLINE.tournament.model.vo.Tournament;
import com.kh.FIFAOFFLINE.tournament.model.vo.TournamentInfo;
import com.kh.FIFAOFFLINE.tournament.model.vo.TournamentSche;

public interface TournamentService {

	ArrayList<TournamentInfo> getAllTournament();

	int insertToInfo();

	int selectCreateTo();

	int insertToSche(HashMap<String, Integer> hs);

	int insertToResult(HashMap<String, Integer> hs);

	ArrayList<Tournament> getToResultList(int toNo);

	ArrayList<TournamentSche> getToScheList(int toNo);

	TournamentInfo getTournament(int toNo);

	int saveResult(Tournament tr);

}
