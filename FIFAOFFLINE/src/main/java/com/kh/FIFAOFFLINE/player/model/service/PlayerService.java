package com.kh.FIFAOFFLINE.player.model.service;

import java.util.ArrayList;

import com.kh.FIFAOFFLINE.player.model.vo.P_RECRUIT;

public interface PlayerService {

	public int playTeamCreate(P_RECRUIT pr);

	public ArrayList<P_RECRUIT> teamPlayList();

	public P_RECRUIT playTeamDetail(int rNum);

	public int teamPlayListDelete(int rNum);

	public int playTeamModify(P_RECRUIT pr);

	

}
