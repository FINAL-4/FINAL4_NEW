package com.kh.FIFAOFFLINE.member.model.dao;

import java.util.ArrayList;

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
	
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int checkIdDup(String id) {

		return sqlSession.selectOne("memberMapper.idCheck",id);
	}
	
	
	//	안효찬꺼
	public ArrayList<Member> selectAllMember() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("memberMapper.selectAllMember");
	}
	//	안효찬꺼
	public Member drawMember(int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.drawMember",userNo);
	}

	
	
}
