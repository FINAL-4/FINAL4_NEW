package com.kh.FIFAOFFLINE.player.model.service;

import java.util.ArrayList;

import com.kh.FIFAOFFLINE.match.model.vo.SmsInfo;
import com.kh.FIFAOFFLINE.member.model.vo.Member;
import com.kh.FIFAOFFLINE.player.model.vo.P_ENROLL;
import com.kh.FIFAOFFLINE.player.model.vo.P_EN_LIST;
import com.kh.FIFAOFFLINE.player.model.vo.P_LIST;
import com.kh.FIFAOFFLINE.player.model.vo.P_RECRUIT;

public interface PlayerService {

	public int playTeamCreate(P_RECRUIT pr);

	public ArrayList<P_RECRUIT> teamPlayList();

	public P_RECRUIT playTeamDetail(int rNum);

	public int teamPlayListDelete(int rNum);

	public int playTeamModify(P_RECRUIT pr);

	public int playPersonEnroll(P_ENROLL pe);

	public ArrayList<P_ENROLL> personPlayList();

	public P_ENROLL playPersonDetail(int eNum);

	public int personPlayListDelete(int eNum);

	public int playPersonModify(P_ENROLL pe);

	public int teamPlayApply(P_LIST pl);

	public int ajaxApplyPlayer(P_LIST pl);

	public ArrayList<P_LIST> applyList(int rNum);

	public int checkTeamSelect(int mt);

	public int ald(P_LIST pl);

	public int agreeResult(Member m);

	public int deadlineUpdate(int rNum);

	public int cancelPlay(P_LIST pl);

	public int ajaxApplyPerson(P_EN_LIST pe);

	public int personApply(P_ENROLL pe);

	public int checkPersonApply(P_EN_LIST pel);

	public int deletePlay();

	public ArrayList<SmsInfo> SMSservice(int getrNum);

	public ArrayList<SmsInfo> SMSservice1(int geteNum);

	

	


	

	

	


	





	

	

}
