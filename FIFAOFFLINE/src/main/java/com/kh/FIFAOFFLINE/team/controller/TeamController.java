package com.kh.FIFAOFFLINE.team.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.FIFAOFFLINE.common.Pagination;
import com.kh.FIFAOFFLINE.member.model.exception.MemberException;
import com.kh.FIFAOFFLINE.member.model.service.MemberService;
import com.kh.FIFAOFFLINE.member.model.vo.Member;
import com.kh.FIFAOFFLINE.team.model.exception.TeamException;
import com.kh.FIFAOFFLINE.team.model.service.TeamService;
import com.kh.FIFAOFFLINE.team.model.vo.PageInfo;
import com.kh.FIFAOFFLINE.team.model.vo.Team;
import com.kh.FIFAOFFLINE.team.model.vo.TeamAD;
import com.kh.FIFAOFFLINE.team.model.vo.TeamFilter;
import com.kh.FIFAOFFLINE.team.model.vo.TeamJoinedMember;
import com.kh.FIFAOFFLINE.team.model.vo.TeamMember;

@Controller
public class TeamController {

	@Autowired
	private TeamService tService;
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("tlist.tm")
	public ModelAndView teamList(ModelAndView mv, HttpSession session, TeamFilter tf,
									@RequestParam(value="page", required=false) Integer page) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = tService.getListCount();
//		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Team> list = tService.selectList(pi);
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		ArrayList<Team> teamLeader = tService.selectTeamLeader(userNo);
		
		System.out.println("리더인 팀 : " +teamLeader);
		
		mv.addObject("list",list);
		mv.addObject("pi", pi);
		mv.addObject("teamLeader",teamLeader);
		mv.setViewName("team/teamListView");
		
			
		
	
		return mv;
	}
	
	 
	
	@RequestMapping("moreList.tm")
	public void moreList(HttpServletResponse response, HttpServletRequest request, TeamFilter tf,
						@RequestParam(value="page", required=false) Integer page) throws IOException, ServletException {
		response.setContentType("application/json;charset=utf-8");
		
		int currentPage = 1; 
		
		if(page != null) { 
			currentPage = page; 
		}
		
		int listCount = tService.getSearchListCount(tf);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Team> list = tService.selectSearchList(pi,tf);
		
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
			jObj.put("teamArea",t.getTeamArea());
			jObj.put("teamIntro",t.getTeamIntro());
			jObj.put("teamAdver",t.getTeamAdver());
			jObj.put("resisterDay",t.getResisterDay());
			jObj.put("ad_status",t.getAd_status());
			jObj.put("recruitCount", t.getRecruitCount());
			
			jArr.add(jObj);
		}
		
		JSONObject sendJson = new JSONObject();
					
		sendJson.put("list",jArr);
		sendJson.put("pi",jArr2);
		
		System.out.println("more sendJson : " + sendJson);
		System.out.println("listCount: " + listCount);
		
		
		
	
		
		
		  PrintWriter out = response.getWriter(); out.print(sendJson); 
		  out.flush();
		  out.close();
		 
		

	}
	
	@RequestMapping("tdetail.tm")
	public ModelAndView teamDetail(ModelAndView mv,
									@RequestParam(value="teamNo", required=false) Integer teamNo) {

		// 값이 개같이 나오니깐 그냥 쿼리문하나하나 왔다리갔다리하면서 받아오자 줮같네 ㅡㅡ
		int tNo = teamNo;
		
		Team t = tService.teamDetail(tNo);
		ArrayList<TeamJoinedMember> joinList = tService.selectJoinList(tNo);
		ArrayList<TeamMember> memberList = tService.selectMemberList(tNo);
		
		if(t != null) {
			mv.addObject("t",t);
			mv.addObject("joinList",joinList);
			mv.addObject("memberList",memberList);
			mv.setViewName("team/teamDetailView");
			
			System.out.println(t);
		
		}else {
			throw new TeamException("팀 자세히보기 실패");
		}
	
		return mv;
	}
	
	@RequestMapping("modal.tm")
	public void getModalUser(HttpServletResponse response, int userNo) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		Member m = tService.getModalUser(userNo);
		
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(m,response.getWriter());
	}
	

	
	@RequestMapping("cancel.tm")
	public void joinedCancel(HttpServletResponse response, TeamJoinedMember tjm) throws JsonIOException, IOException {
		
		System.out.println(tjm);
		
		int result = tService.joinedCancel(tjm);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(result,response.getWriter());
	}
	
	@RequestMapping("agree.tm")
	public void joinedAgree(HttpServletResponse response, TeamJoinedMember tjm) throws JsonIOException, IOException {
		
		System.out.println(tjm);
		int teamNo = tjm.getTeamNo();
		
		int updateCount = 0;
		int result = 0;
		int deleteAD = 0;
		int deleteTJM = 0;
		
		int deleteResult = tService.joinedAgree(tjm);    // <- 팀원 신청 리스트에서 해당 사람 없어지는거 
		if(deleteResult>0) {
			result = tService.teamJoin(tjm);  // <- 팀원에 넣은거 
			updateCount = tService.updateCount(teamNo); // <- 팀원 모집수를 -1 한거
			deleteAD = tService.deleteAD();  // <- 팀원 모집수가 0 이면 글이 없어지는거 
			deleteTJM = tService.deleteTJM(teamNo); // <- 신청리스트에서 그 사람 없어지는거 (왜 있는거지??)
			
			// 1. 팀원 모집수가 1이 남았다.
			//  - 신청한 인원은 총 4명이다.  
			//  - 그 중 한명만 수락했을 때 -> 
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(result,response.getWriter());
	}
	
	@RequestMapping("applyTeam.tm")
	public String applyTeam(TeamJoinedMember tjm, HttpServletRequest request) {
		
		int result = tService.applyTeam(tjm);
		
		System.out.println(result);
		
		return "home";
	}
	
	@RequestMapping("deleteTeamAD.tm")
	public ModelAndView deleteTeamAD(ModelAndView mv,
									@RequestParam(value="teamNo", required=false) Integer teamNo) {
		
		int result = tService.deleteTeamAD(teamNo);
		
		
		mv.setViewName("home");
		
		return mv;
	}
	
	@RequestMapping("updateTeamView.tm")
	public ModelAndView updateTeamView(ModelAndView mv,
			@RequestParam(value="teamNo", required=false) Integer teamNo) {
	
		// 값이 개같이 나오니깐 그냥 쿼리문하나하나 왔다리갔다리하면서 받아오자 줮같네 ㅡㅡ
		int tNo = teamNo;
				
		Team t = tService.teamDetail(tNo);
		ArrayList<TeamJoinedMember> joinList = tService.selectJoinList(tNo);
		ArrayList<TeamMember> memberList = tService.selectMemberList(tNo);
				
		if(t != null) {
			mv.addObject("t",t);
			mv.addObject("joinList",joinList);
			mv.addObject("memberList",memberList);
			mv.setViewName("team/teamUpdateView");
					
			System.out.println(t);
				
		}else {
			throw new TeamException("팀 수정하기 실패");
		}
			
		return mv;
	}
	
	@RequestMapping("updateTeamAD.tm")
	public ModelAndView updateTeamAD(ModelAndView mv,Team t) {
		
		int result = tService.updateTeamAD(t);
		
		mv.setViewName("home");
		
		return mv;
	}
	
	@RequestMapping("ADinsert.tm")
	public ModelAndView ADinsertView(ModelAndView mv, TeamAD ta, HttpSession session){
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		ta.setUserNo(userNo);
		
		int result = tService.ADinsert(ta);
		
		mv.setViewName("home");
		
		return mv;
	}
	
	@RequestMapping("createTeamView.tm")
	public ModelAndView createTeam(ModelAndView mv) {
		
		mv.setViewName("team/createTeamView");
		
		return mv;
	}
	
	@RequestMapping(value="createTeam.tm",method = RequestMethod.POST)
	public String memberInsert(HttpServletRequest request, Team t , TeamMember tm, Model model,HttpSession session,
			@RequestParam(value="uploadFile",required = false)MultipartFile file)
	{
		
		
		System.out.println("파일명 : " +file);
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		t.setUserNo(userNo);
		tm.setUserNo(userNo);
		
		
		
		if(!file.getOriginalFilename().contentEquals("")) {
			String teamImage = saveFile(file, request);
			
			if(teamImage != null) {	// 파일이 잘 저장된 경우
				t.setTeamImage(file.getOriginalFilename());
			}
		}
		System.out.println("tm :" + tm);
		System.out.println(t);
		int result = tService.insertTeam(t);
		
		
		
		if(result > 0) {
			String createdTeamName = t.getTeamName();
			Team createdTeam = tService.selectCreatedTeam(createdTeamName);
			int createdTeamNo = createdTeam.getTeamNo();
			
			tm.setTeamNo(createdTeamNo);
			
			int result2 = tService.insertCreatedTeamMember(tm);
			session.removeAttribute("myTeam");
			
			ArrayList<Team> myTeam = tService.selectMyTeam(userNo);
			session.setAttribute("myTeam", myTeam);
			
			return "team/teamManageView";
		}
		
		return "team/teamManageView";
		
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일이 저장될 경로를 설정하는 메소드
		
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\images\\team";
		
		File folder = new File(savePath);
		
		
		if(!folder.exists())
		{
			folder.mkdirs();
		}
		
		String teamImage = folder + "\\" +file.getOriginalFilename(); // 실제 저장될 파일 경로 + 파일명
		
		try {
			file.transferTo(new File(teamImage)); // 이 때 파일이 저장된다.
			// 이게 실행되서 파일이 경로에 저장될려면 pom.xml에서 파일 업로드 관련 라이브러리 두개를 추가하고
			// root-context.xml에서 파일 크기 지정을 해줘야지만 파일이 저장된다!!!!!!!!!!!
			
		}catch(Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		
		return teamImage;
	}
	
	@RequestMapping("Du.tm")
	public ModelAndView idDuplicateCheck(String teamName, ModelAndView mv) {
		Map map =new HashMap();
		boolean Usable =tService.checkTeamNameDup(teamName)==0?true:false;
		map.put("Usable", Usable);
		mv.addAllObjects(map);
		mv.setViewName("team/createTeamView");
		return mv;
	}
	
	@RequestMapping("DupAD.tm")
	public void isDuplicateAD(int teamNo, HttpServletResponse response) throws JsonIOException, IOException {
		int dup = tService.selectDupAD(teamNo);
		System.out.println(dup);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(dup,response.getWriter());
	}
	
	@RequestMapping("dupApply.tm")
	public void isDuplicateApply(TeamJoinedMember tjm, HttpServletResponse response) throws JsonIOException, IOException {
		
		int dup = tService.selectDupApply(tjm);
		
		System.out.println("신청했냐? : " + dup);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(dup,response.getWriter());
		
	}
	
	@RequestMapping("teamFilter.tm")
	public void teamFilter(HttpServletResponse response, HttpServletRequest request, TeamFilter tf,
							@RequestParam(value="page", required=false) Integer page) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		
		
		System.out.println(tf);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
//		int listCount = tService.getListCount();
		
		int searchListCount = tService.getSearchListCount(tf);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, searchListCount);
		
		System.out.println(searchListCount);
		
		ArrayList<Team> list = tService.selectSearchList(pi,tf);
		
		//	여기까지가 리스트 받아온거임 ( 검색한거 )
		
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
		

		jArr2.add(jObj2);	//	 페이지 정보 Jobj로 만들어서 jArr에 하나 담고
		
		for(Team t:list) {
			JSONObject jObj = new JSONObject();
			
			jObj.put("teamNo",t.getTeamNo());
			jObj.put("userNo",t.getUserNo());
			jObj.put("userName",t.getUserName());
			jObj.put("teamName",t.getTeamName());
			jObj.put("teamImage",t.getTeamImage());
			jObj.put("teamArea",t.getTeamArea());
			jObj.put("teamIntro",t.getTeamIntro());
			jObj.put("teamAdver",t.getTeamAdver());
			jObj.put("resisterDay",t.getResisterDay());
			jObj.put("ad_status",t.getAd_status());
			jObj.put("recruitCount", t.getRecruitCount());
			
			jArr.add(jObj);	//	리스트 jobj로 만들어서 jArr에 하나 더 담고
		}
		
		JSONObject sendJson = new JSONObject();
					
		sendJson.put("list",jArr);
		sendJson.put("pi",jArr2);
		
		System.out.println("sendJson : " + sendJson);
		
		//	jArr 2개를 보낼 jObj에 담고

		PrintWriter out = response.getWriter(); out.print(sendJson); 
		out.flush();
		out.close();
		
		// 보내고

		
	}
	
	@RequestMapping("searchTeamName.tm")
	public void searchTeamName(String teamName, HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		Team t = tService.searchTeamName(teamName);
		
		System.out.println("검색된 팀 : " + t);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(t,response.getWriter());
	}
	
	@RequestMapping("managedTeam.tm")
	public ModelAndView managedTeam(ModelAndView mv, HttpSession session) {
		
		ArrayList<Member> mList = mService.selectAllMember();
		ArrayList<Team> tList = tService.selectAllTeam();
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		ArrayList<Team> teamLeader = tService.selectTeamLeader(userNo);
		
		mv.addObject("tList",tList);
		mv.addObject("teamLeader",teamLeader);
		mv.addObject("mList",mList);
		mv.setViewName("team/teamManageView");
		
		return mv;
	}
	
	@RequestMapping("drawMember.tm")
	public void drawMember(int userNo, HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		Member m = mService.drawMember(userNo);
		
		System.out.println(m);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(m,response.getWriter());
	}
	
	@RequestMapping("moreTeamMember.tm")
	public void moreTeamMember(int teamNo, HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		ArrayList<TeamMember> tMember = tService.moreTeamMember(teamNo);
		
		System.out.println("tMember : " + tMember);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(tMember,response.getWriter());
	
	}
	
	
	
}
