package com.kh.FIFAOFFLINE.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.FIFAOFFLINE.member.model.vo.Member;

@Repository("mDao")
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Member loginMember(Member m) {
		System.out.println(m);
		return (Member)sqlSession.selectOne("memberMapper.loginMember",m);
	}

	public int insertMember(Member m) {
	
		return sqlSession.insert("memberMapper.insertMember",m);
	}

	public int checkIdDup(String id) {

		return sqlSession.selectOne("memberMapper.idCheck",id);
	}

	public int updateMember(Member m) {
		
		return sqlSession.update("memberMapper.updateMember",m);
	}

	public int loginCheck(Member m) {
		
		return sqlSession.selectOne("memberMapper.selectLogin", m);
	}

	public String findId(Member m) {
		
		return sqlSession.selectOne("memberMapper.findId", m);
	}

	public int findPwd(Member m) {
		
		return sqlSession.selectOne("memberMapper.findPwd", m);
	}

	public int newPwd(HashMap hm) {
		
		return sqlSession.update("memberMapper.newPwd", hm);
	}



	
	
}
