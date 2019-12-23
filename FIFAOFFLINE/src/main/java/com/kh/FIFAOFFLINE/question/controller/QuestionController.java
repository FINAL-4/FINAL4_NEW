package com.kh.FIFAOFFLINE.question.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.FIFAOFFLINE.member.model.vo.Member;
import com.kh.FIFAOFFLINE.question.model.service.QuestionService;
import com.kh.FIFAOFFLINE.question.model.vo.Question;

@Controller
public class QuestionController {

	@Autowired
	QuestionService qService;
	
	@RequestMapping("qList.do")
	public ModelAndView goQuestion(ModelAndView mv, HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		ArrayList<Question> qList = null;
		
		if(m.getUserId().equalsIgnoreCase("admin")) {
			qList = qService.selectAllqList();
		}else {
			qList = qService.selectqList(m.getUserNo());
		}
		
		System.out.println(qList);
		
		mv.addObject("qList", qList);
		mv.setViewName("question/questionListView");
		
		
		return mv;
	}
	
	@RequestMapping("postQ.do")
	public void postQuestion(HttpServletResponse response, Question q) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		
		
		int result = qService.insertQuestion(q);
		
		new Gson().toJson(result, response.getWriter());
	}
	
	@RequestMapping("selectQ.do")
	public void selectQuestion(HttpServletResponse response, int qId, HttpSession session) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		
		Member m = (Member)session.getAttribute("loginUser");
		
		if(m.getUserId().equalsIgnoreCase("admin")) {
			qService.updateRead(qId);
		}

		Question q = qService.selectQuestion(qId);
	
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		gson.toJson(q, response.getWriter());
	}
	
	@RequestMapping("deleteQ.do")
	public void deleteQuestion(HttpServletResponse response, int qId) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		
		
		int result = qService.deleteQuestion(qId);
		
		new Gson().toJson(result, response.getWriter());
	}
	
	@RequestMapping("postA.do")
	public void postAnswer(HttpServletResponse response, Question q) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		
		
		int result = qService.insertAnswer(q);
		
		new Gson().toJson(result, response.getWriter());
	}
	
	
}
