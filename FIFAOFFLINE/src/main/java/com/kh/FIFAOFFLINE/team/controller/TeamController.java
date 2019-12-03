package com.kh.FIFAOFFLINE.team.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.FIFAOFFLINE.common.Pagination;
import com.kh.FIFAOFFLINE.team.model.exception.TeamException;
import com.kh.FIFAOFFLINE.team.model.service.TeamService;
import com.kh.FIFAOFFLINE.team.model.vo.PageInfo;
import com.kh.FIFAOFFLINE.team.model.vo.Team;

@Controller
public class TeamController {

	@Autowired
	private TeamService tService;
	
	@RequestMapping("tlist.tm")
	public ModelAndView teamList(ModelAndView mv,
									@RequestParam(value="page", required=false) Integer page) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = tService.getListCount();
//		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Team> list = tService.selectList(pi);
		
		
		if(list != null && list.size() > 0) {	// 게시글이 있다면
			mv.addObject("list",list);
			mv.addObject("pi", pi);
			mv.setViewName("team/teamListView");
			
			System.out.println(list);
		}else {
			throw new TeamException("팀원 모집 게시글 불러오기 실패..");
		}
	
		return mv;
	}
	
	 
	
	@RequestMapping("moreList.tm")
	public void moreList(HttpServletResponse response, HttpServletRequest request, @RequestParam(value="page", required=false) Integer page) throws IOException, ServletException {
		response.setContentType("application/json;charset=utf-8");
		
		int currentPage = 1; 
		
		if(page != null) { 
			currentPage = page; 
		}
		
		int listCount = tService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Team> list = tService.selectList(pi);
		
		JSONArray jArr = new JSONArray();
		JSONArray jArr2 = new JSONArray();
		
		JSONObject jObj2 = new JSONObject();
		
		jObj2.put("currentPage",pi.getCurrentPage());
		jObj2.put("listCount",pi.getListCount());
		jObj2.put("pageLimit",pi.getPageLimit());
		jObj2.put("maxPage",pi.getMaxPage());
		jObj2.put("startPage",pi.getStartPage());
		jObj2.put("endpage",pi.getEndPage());
		jObj2.put("boardLimit",pi.getBoardLimit());
		

		jArr2.add(jObj2);
		
		for(Team t:list) {
			JSONObject jObj = new JSONObject();
			
			jObj.put("teamNo",t.getTeamNo());
			jObj.put("userNo",t.getUserNo());
			jObj.put("userName",t.getUserName());
			jObj.put("teamName",t.getTeamName());
			jObj.put("teamImage",t.getTeamImage());
			jObj.put("teamArea",t.getTeamIntro());
			jObj.put("teamAdver",t.getTeamAdver());
			jObj.put("resisterDay",t.getResisterDay());
			jObj.put("ad_status",t.getAd_status());
			
			jArr.add(jObj);
		}
		
		JSONObject sendJson = new JSONObject();
					
		sendJson.put("list",jArr);
		/* sendJson.put("pi",jArr2); */
		
		System.out.println(sendJson);
		
		
		
	
		
		
		  PrintWriter out = response.getWriter(); out.print(sendJson); 
		  out.flush();
		  out.close();
		 
		

	}
}
