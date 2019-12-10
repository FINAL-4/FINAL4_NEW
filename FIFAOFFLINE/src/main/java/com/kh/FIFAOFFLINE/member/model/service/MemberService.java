package com.kh.FIFAOFFLINE.member.model.service;

import java.util.HashMap;

import com.kh.FIFAOFFLINE.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m);

	int insertMember(Member m);

	int checkIdDup(String id);

	int updateMember(Member m);

	int loginCheck(Member m);

	String findId(Member m);

	int findPwd(Member m);

	int newPwd(HashMap hm);



	



}
