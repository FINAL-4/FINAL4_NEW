package com.kh.FIFAOFFLINE.question.model.service;

import java.util.ArrayList;

import com.kh.FIFAOFFLINE.question.model.vo.Question;

public interface QuestionService {

	ArrayList<Question> selectAllqList();

	ArrayList<Question> selectqList(int userNo);

	int insertQuestion(Question q);

	Question selectQuestion(int qId);

	int deleteQuestion(int qId);

	int insertAnswer(Question q);

	void updateRead(int qId);

}
