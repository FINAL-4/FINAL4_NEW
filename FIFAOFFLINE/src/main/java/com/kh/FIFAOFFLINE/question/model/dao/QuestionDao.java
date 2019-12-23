package com.kh.FIFAOFFLINE.question.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.FIFAOFFLINE.question.model.vo.Question;

@Repository("qDao")
public class QuestionDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	public ArrayList<Question> selectAllqList() {
		
		return (ArrayList)sqlSession.selectList("questionMapper.selectAllqList");
	}

	public ArrayList<Question> selectqList(int userNo) {
		
		return (ArrayList)sqlSession.selectList("questionMapper.selectqList", userNo);
	}

	public int insertQuestion(Question q) {
		
		return sqlSession.insert("questionMapper.insertQuestion", q);
	}

	public Question selectQuestion(int qId) {
		
		return (Question)sqlSession.selectOne("questionMapper.selectQuestion", qId);
	}

	public int deleteQuestion(int qId) {
		
		return sqlSession.update("questionMapper.deleteQuestion", qId);
	}

	public int insertAnswer(Question q) {
		
		return sqlSession.update("questionMapper.updateAnswer", q);
	}

	public void updateRead(int qId) {

		sqlSession.update("questionMapper.updateRead", qId);
		
	}
}
