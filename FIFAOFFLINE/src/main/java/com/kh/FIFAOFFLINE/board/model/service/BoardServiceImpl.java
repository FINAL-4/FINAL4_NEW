package com.kh.FIFAOFFLINE.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.FIFAOFFLINE.board.model.dao.BoardDao;

@Service("bService")
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDao bDao;
}
