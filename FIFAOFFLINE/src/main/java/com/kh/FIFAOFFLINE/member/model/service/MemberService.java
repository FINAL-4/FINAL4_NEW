package com.kh.FIFAOFFLINE.member.model.service;

import com.kh.FIFAOFFLINE.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m);

	int insertMember(Member m);

	int checkIdDup(String id);

}
