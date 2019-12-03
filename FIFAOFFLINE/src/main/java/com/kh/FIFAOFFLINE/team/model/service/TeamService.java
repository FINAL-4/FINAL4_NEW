package com.kh.FIFAOFFLINE.team.model.service;

import java.util.ArrayList;

import com.kh.FIFAOFFLINE.team.model.vo.PageInfo;
import com.kh.FIFAOFFLINE.team.model.vo.Team;

public interface TeamService {

	int getListCount();

	ArrayList<Team> selectList(PageInfo pi);

}
