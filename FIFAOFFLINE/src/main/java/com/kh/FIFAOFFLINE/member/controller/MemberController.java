package com.kh.FIFAOFFLINE.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.annotation.ModelAndViewResolver;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.FIFAOFFLINE.member.model.exception.MemberException;
import com.kh.FIFAOFFLINE.member.model.service.MemberService;
import com.kh.FIFAOFFLINE.member.model.vo.Member;
import com.kh.FIFAOFFLINE.team.model.service.TeamService;
import com.kh.FIFAOFFLINE.team.model.vo.Team;

import javafx.scene.control.Alert;

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
	
	@RequestMapping("login.me")
	public String memberLogin(Member m,HttpSession session) {
		
		
		
		Member loginUser=mService.loginMember(m);

		int userNo = loginUser.getUserNo();
		ArrayList<Team> myTeam = tService.selectMyTeam(userNo);
		

		if(loginUser !=null) {
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("myTeam", myTeam);
		}
		
		return "home";
	}
	
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();
		
		return "home";
	}
	
	@RequestMapping(value = "join.me", method = RequestMethod.POST)

	public String memberInsert(HttpServletRequest request, Member m,Model model,
			@RequestParam("phone1") String phone1,
			@RequestParam("phone2") String phone2,
			@RequestParam("phone3") String phone3,
			@RequestParam("emailId") String emailId,
			@RequestParam("email2") String email2,
			@RequestParam("address1") String address1,
			@RequestParam("address2") String address2,
			@RequestParam(value="uploadFile",required = false)MultipartFile file,
			@RequestParam(value = "valueArr[]",required = false) List<String> valueArr) {
		
		m.setPhone(phone1+"-"+phone2+"-"+phone3);
		m.setUserEmail(emailId+"@"+email2);
		m.setAddress(address1+", "+address2);
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
			return "home";
		}else {
			throw new MemberException("회원 가입 실패!!");
		}
		
		
		
	}
	/*
	 * @RequestMapping("log.me") public ModelAndView idPwdCheck(Member m,
	 * ModelAndView mv) {
	 * 
	 * Map map =new HashMap(); int Ava= mService.checkIdPwd(m.getUserId());
	 * System.out.println(m); map.put("Ava", Ava); mv.addAllObjects(map);
	 * mv.setViewName("jsonView"); return mv; }
	 */
	
	
	@RequestMapping("Du.me")//ajax아이디중복검사
	public ModelAndView idDuplicateCheck(String id,ModelAndView mv) {
		Map map =new HashMap();
		boolean Usable =mService.checkIdDup(id)==0?true:false;
		
		map.put("Usable", Usable);
		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		return mv;
	}
	
	
public String saveFile(MultipartFile file, HttpServletRequest request) {
		
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
			
		}
		
		return proFile;
	}
	
	 @RequestMapping("mypage.me")
	 public String mypageView() {
		 return "member/mypage";
	 }
	 
	@RequestMapping("mupdate.me")
	public String memberUpdate(Member m, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam("phone1") String phone1,
			@RequestParam("phone2") String phone2,
			@RequestParam("phone3") String phone3,
			@RequestParam("emailId") String emailId,
			@RequestParam("email2") String email2,
			@RequestParam("address1") String address1,
			@RequestParam("address2") String address2,
			@RequestParam(value="uploadFile",required = false)MultipartFile file,
			
			@RequestParam(value = "valueArr[]",required = false) List<String> valueArr){
		
		
		m.setPhone(phone1+"-"+phone2+"-"+phone3);
		m.setUserEmail(emailId+"@"+email2);
		m.setAddress(address1+", "+address2);
		Member loginUser =(Member)session.getAttribute("loginUser");
		
		if(m.getUserPwd().equals("")) {
			
			m.setUserPwd(loginUser.getUserPwd());
		}
		
		String proFile = saveFile(file, request);
		
		/*
		 * System.out.println(loginUser.getProfile()+"---"+file.getOriginalFilename());
		 */
		
		
		if(file.getOriginalFilename().equals("")){ 
			 m.setProfile(loginUser.getProfile());
		  }else {
		  
			  if(proFile != null) { // 파일이 잘 저장된 경우
				  m.setProfile(file.getOriginalFilename()); 
			  } 
			  
		 }
		 
		 
		
		
		int result =mService.updateMember(m);
		if(result > 0) {
			model.addAttribute("loginUser",m);
		}else {
			throw new MemberException("정보수정에 실패했습니다");
		}
		
				return "home";
				
		}
	
	
	@RequestMapping("loginCheck")
	public void loginCheck(HttpServletResponse response, Member m) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		int result = mService.loginCheck(m);
		
		
		
		new Gson().toJson(result, response.getWriter());
	}
	
	
	@RequestMapping("findId.me")
	public void findId(Member m, HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		
		
		String id =  mService.findId(m); 

		
		new Gson().toJson(id, response.getWriter());
	}
	
	
	@RequestMapping("findPwd.me")
	public void findPwd(Member m, HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		/*
		 * System.out.println(m.getUserId()+"---"+m.getUserEmail()+"---"+m.getPhone());
		 */
		
		int result =  mService.findPwd(m); 

		//임시비밀번호 만들기=================ㄹ==================================
		String newPwd = "";
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', 
				'6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 
				'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
				'U', 'V', 'W', 'X', 'Y', 'Z' };
		char[] symbolsSet = new char[] { '!', '@', '#', '$', '%', '^', 
				'&', '*', '(', ')' };
		
		for (int i = 0 ; i < 5 ; i++) {
			newPwd += charSet[(int) (charSet.length * Math.random())];
		};
		for (int i = 0 ; i < 3 ; i++) {
			newPwd += symbolsSet[(int) (symbolsSet.length * Math.random())];
		};
		
		newPwd += String.valueOf((int)((Math.random() * 100) + 1));
		//=================================ㄹ==================================
		
		
		if(result == 1) {
			new Gson().toJson(newPwd, response.getWriter());
		}else {
			new Gson().toJson(0, response.getWriter());
		}
	}
	
	
	@RequestMapping("newPwd.me")
	public void newPwd(Member m, HttpServletResponse response, String newPwd) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		

		
		HashMap hm = new HashMap();
		
		hm.put("userId", m.getUserId());
		hm.put("userEmail", m.getUserEmail());
		hm.put("phone", m.getPhone());
		hm.put("newPwd", newPwd);
		
		int result = mService.newPwd(hm);
		
	
		if(result == 1) {
			new Gson().toJson(newPwd, response.getWriter());
		}else {
			new Gson().toJson(0, response.getWriter()); 
		}
	}
	
	
	
}