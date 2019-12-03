package com.kh.FIFAOFFLINE.member.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kh.FIFAOFFLINE.member.model.exception.MemberException;
import com.kh.FIFAOFFLINE.member.model.service.MemberService;
import com.kh.FIFAOFFLINE.member.model.vo.Member;
import com.kh.FIFAOFFLINE.team.model.service.TeamService;
import com.kh.FIFAOFFLINE.team.model.vo.Team;

@SessionAttributes("loginUser")
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
	@Autowired
	private TeamService tService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("goJoin.me")
	public String goJoinMember() {
		
		return "member/memberJoinForm";
	}
	@RequestMapping("find.me")
	public String findIP() {
	return "member/findIdPwd";
	}
	
	@RequestMapping(value = "login.me", method = RequestMethod.POST)
	public String memberLogin(Member m,HttpSession session) {
		System.out.println(m);
		
		
		Member loginUser=mService.loginMember(m);
		int userNo = loginUser.getUserNo();
		ArrayList<Team> myTeam = tService.selectMyTeam(userNo);
		System.out.println(loginUser);
		if(loginUser !=null) {
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("myTeam", myTeam);
		}else {
			throw new  MemberException("로그인실패");
		}
		
		return "home";
	}
	@RequestMapping(value = "logout.me",method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
	}
	@RequestMapping(value =  "join.me" , method = RequestMethod.POST)
	@ResponseBody
	public String memberInsert(HttpServletRequest request, Member m,Model model,
			@RequestParam("phone1") String phone1,
			@RequestParam("phone2") String phone2,
			@RequestParam("phone3") String phone3,
			@RequestParam("emailId") String emailId,
			@RequestParam("email2") String email2,
			@RequestParam(value="uploadFile",required = false)MultipartFile file,
			@RequestParam(value = "valueArr[]",required = false) List<String> valueArr) {
		
		m.setPhone(phone1+"-"+phone2+"-"+phone3);
		System.out.println(file);
		System.out.println(m);
		m.setUserEmail(emailId+"@"+email2);
		if(!file.getOriginalFilename().contentEquals("")) {
			String proFile = saveFile(file, request);
			
			if(proFile != null) {	// 파일이 잘 저장된 경우
				m.setProfile(file.getOriginalFilename());
			}
		}

		 

/*
 * String phone = request.getParameter("phone1") +"-"+request.getParameter("phone2") +"-"+request.getParameter("phone3");
 * String email = request.getParameter("emailId") + "@" + request.getParameter("email2");
 */
		int result = mService.insertMember(m);
		
		if(result > 0) {
			return "home.do";
		}else {
			throw new MemberException("회원 가입 실패!!");
		}
		
		
		
	}

public String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일이 저장될 경로를 설정하는 메소드
		
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\proFiles";
		
		File folder = new File(savePath);
		
		
		if(!folder.exists())
		{
			folder.mkdirs();
		}
		
		String proFile = folder + "\\" +file.getOriginalFilename(); // 실제 저장될 파일 경로 + 파일명
		
		try {
			file.transferTo(new File(proFile)); // 이 때 파일이 저장된다.
			// 이게 실행되서 파일이 경로에 저장될려면 pom.xml에서 파일 업로드 관련 라이브러리 두개를 추가하고
			// root-context.xml에서 파일 크기 지정을 해줘야지만 파일이 저장된다!!!!!!!!!!!
			
		}catch(Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		
		return proFile;
	}
	
	 @RequestMapping("mypage.me")
	 public String mypageView() {
		 return "member/mypage";
	 }
	
}