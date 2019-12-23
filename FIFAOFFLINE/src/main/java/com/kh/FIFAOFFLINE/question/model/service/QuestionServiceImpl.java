package com.kh.FIFAOFFLINE.question.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.FIFAOFFLINE.question.model.dao.QuestionDao;
import com.kh.FIFAOFFLINE.question.model.vo.Question;

@Service("qService")
public class QuestionServiceImpl implements QuestionService{

	@Autowired
	QuestionDao qDao;
	
	
	@Override
	public ArrayList<Question> selectAllqList() {
		
		return qDao.selectAllqList();
	}

	@Override
	public ArrayList<Question> selectqList(int userNo) {
		
		return qDao.selectqList(userNo);
	}

	@Override
	public int insertQuestion(Question q) {
		
		return qDao.insertQuestion(q);
	}

	@Override
	public Question selectQuestion(int qId) {
		
		return qDao.selectQuestion(qId);
	}

	@Override
	public int deleteQuestion(int qId) {
		
		return qDao.deleteQuestion(qId);
	}

	@Override
	public int insertAnswer(Question q) {
		
		return qDao.insertAnswer(q);
	}

	@Override
	public void updateRead(int qId) {

		qDao.updateRead(qId);
		
	}

}
