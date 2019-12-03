package com.kh.FIFAOFFLINE.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.FIFAOFFLINE.board.model.service.BoardService;

@Controller
public class Boardcontroller {

	@Autowired
	private BoardService bService;
}
