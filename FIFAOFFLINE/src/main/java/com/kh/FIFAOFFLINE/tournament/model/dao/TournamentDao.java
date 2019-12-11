package com.kh.FIFAOFFLINE.tournament.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("toDao")
public class TournamentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}
