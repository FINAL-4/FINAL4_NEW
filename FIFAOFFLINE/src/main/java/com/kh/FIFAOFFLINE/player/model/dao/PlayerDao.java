package com.kh.FIFAOFFLINE.player.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.FIFAOFFLINE.member.model.vo.Member;
import com.kh.FIFAOFFLINE.player.model.vo.P_ENROLL;
import com.kh.FIFAOFFLINE.player.model.vo.P_EN_LIST;
import com.kh.FIFAOFFLINE.player.model.vo.P_LIST;
import com.kh.FIFAOFFLINE.player.model.vo.P_RECRUIT;

@Repository("pDao")
public class PlayerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 용병 메인화면(개인용병 + 팀용병 리스트)
	public ArrayList<P_RECRUIT> teamPlayList() {
		return (ArrayList)sqlSession.selectList("playerMapper.teamPlayList");
	}

	// 용병 모집
	public int playTeamCreate(P_RECRUIT pr) {
		// System.out.println("Dao test : " + pr);
		return sqlSession.insert("playerMapper.playTeamCreate", pr);
	}

	// 팀 용병 리스트 상세보기
	public P_RECRUIT playTeamDetail(int rNum) {
		// System.out.println("Dao test rNum : " + rNum);
		return sqlSession.selectOne("playerMapper.playTeamDetail", rNum);
	}

	// 팀 용병 모집글 삭제하기
	public int teamPlayListDelete(int rNum) {
		// System.out.println("다오 삭제 테스트 : " + rNum);
		return sqlSession.delete("playerMapper.playTeamDelete", rNum);
	}

	// 팀 용병 모집글 수정하기
	public int playTeamModify(P_RECRUIT pr) {
	//	System.out.println("다오 수정 테스트 : " + pr);
		return sqlSession.update("playerMapper.playTeamModify", pr);
	}
	
	// 용병 등록 
	public int playPersonEnroll(P_ENROLL pe) {
		// System.out.println("다오 등록 테스트 : " + pe);
		return sqlSession.insert("playerMapper.playPersonEnroll", pe);
	}
	
	// 용병 등록 리스트 보기
	public ArrayList<P_ENROLL> personPlayList() {
		return (ArrayList)sqlSession.selectList("playerMapper.personPlayList");
	}

	// 용병 등록 리스트 상세보기
	public P_ENROLL playPersonDetail(int eNum) {
	//	System.out.println("Dao test eNum : " + eNum);
		return sqlSession.selectOne("playerMapper.playPersonDetail", eNum);
	}

	// 용병 등록 삭제
	public int personPlayListDelete(int eNum) {
	//	System.out.println("Dao test 삭제 : " + eNum);
		return sqlSession.delete("playerMapper.playPersonDelete", eNum);
	}

	// 용병 등록 수정
	public int playPersonModify(P_ENROLL pe) {
	//	System.out.println("Dao test 수정 : " + pe);
		return sqlSession.update("playerMapper.playPersonModify", pe);
	}
	
	// 개인 용병 신청 중복검사
	public int checkPersonApply(P_EN_LIST pel) {
		return sqlSession.insert("playerMapper.checkPersonApply", pel);
	}

	// 개인 용병 신청 
	public int personApply(P_ENROLL pe) {
		return sqlSession.update("playerMapper.personApply", pe);
	}

	// 신청 하는 거
	public int teamPlayApply(P_LIST pl) {
		//System.out.println("다오 신청 테스트 : " + pl);
		return sqlSession.insert("playerMapper.teamPlayApply", pl);
	}

	// 용병 신청
	public int ajaxApplyPlayer(P_LIST pl) {
	//	System.out.println("다오 용병 신청 테스트 : " + pl);
		return sqlSession.selectOne("playerMapper.ajaxApplyPlayer", pl);
	}

	// 용병 신청 리스트
	public ArrayList<P_LIST> applyList(int rNum) {
		//System.out.println("다오 용병 신청 리스트 :" + rNum);
		return (ArrayList)sqlSession.selectList("playerMapper.applyList", rNum);
	}

	// 개인 용병 신청 
	public int ajaxApplyPerson(P_EN_LIST pe) {
		return sqlSession.selectOne("playerMapper.ajaxApplyPerson", pe);
	}
		
	// 용병 모집 글 등록 중복 검사
	public int checkTeamSelect(int mt) {
		return sqlSession.selectOne("playerMapper.checkTeamSelect", mt);
	}
	
	// 신청 리스트에 신청 한 사람 없어지는 거
	public int ald(P_LIST pl) {
		return sqlSession.delete("playerMapper.ald", pl);
	}

	// 수락 한 사람 member 에 count 올려주는거 
	public int agreeResult(Member m) {
		return sqlSession.update("playerMapper.agreeResult", m);
	}

	// 수락 하면 모집 글에 모집인원 -1 
	public int deadlineUpdate(int rNum) {
		return sqlSession.update("playerMapper.deadlineUpdate", rNum);
	}

	// 신청 리스트에 신청 거절 
	public int cancelPlay(P_LIST pl) {
		return sqlSession.delete("playerMapper.ald", pl);
	}

	// 팀용병 모집인원이 0 이 되면 글 삭제
	public int deletePlay() {
		return sqlSession.delete("playerMapper.deletePlay");
	}

	
	

	

	

	

	



	
	



	
	
	


	

	
}
