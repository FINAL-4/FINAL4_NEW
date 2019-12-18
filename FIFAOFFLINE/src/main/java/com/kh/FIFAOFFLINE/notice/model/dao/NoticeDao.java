package com.kh.FIFAOFFLINE.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.FIFAOFFLINE.notice.model.vo.Notice;
import com.kh.FIFAOFFLINE.notice.model.vo.PageInfo;
import com.kh.FIFAOFFLINE.notice.model.vo.Reply;

@Repository("nDao")
public class NoticeDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int getListCount() {

		return sqlSession.selectOne("noticeMapper.getListCount");
	}
	

	public ArrayList<Notice> selectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList",null, rowBounds);
	}

	public Notice selectOne(int nId) {
		
		return sqlSession.selectOne("noticeMapper.selectOne", nId);
	}

	public int insertNotice(Notice n) {

		return sqlSession.insert("noticeMapper.insertNotice", n);
	}

	public int addReadCount(int nId) {

		return sqlSession.update("noticeMapper.updateCount", nId);
	}
	
	public int updateNotice(Notice n) {

		return sqlSession.update("noticeMapper.updateNotice", n);
	}
	
	public int deleteNotcie(int nId) {

		return sqlSession.delete("noticeMapper.deleteNotice", nId);
	}

	public ArrayList<Reply> selectReplyList(int nId) {

		return (ArrayList)sqlSession.selectList("noticeMapper.selectReplyList", nId);
	}

	public int insertReply(Reply r) {

		return sqlSession.insert("noticeMapper.insertReply", r);
	}



	
	
}
