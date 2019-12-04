package com.kh.FIFAOFFLINE.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.FIFAOFFLINE.member.model.dao.MemberDao;
import com.kh.FIFAOFFLINE.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao mDao;
	@Override
	public Member loginMember(Member m) {
		return mDao.loginMember(m);
	}
	@Override
	public int insertMember(Member m) {
	
		return mDao.insertMember(m);
	}
	@Override
	public int checkIdDup(String id) {
		
		return  mDao.checkIdDup(id);
	}
}
