package com.kh.FIFAOFFLINE.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.FIFAOFFLINE.notice.model.vo.Catagory;
import com.kh.FIFAOFFLINE.notice.model.vo.Like;
import com.kh.FIFAOFFLINE.notice.model.vo.Notice;
import com.kh.FIFAOFFLINE.notice.model.vo.PageInfo;
import com.kh.FIFAOFFLINE.notice.model.vo.Reply;
import com.kh.FIFAOFFLINE.notice.model.vo.SearchCondition;

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

		return sqlSession.update("noticeMapper.deleteNotice", nId);
	}

	public ArrayList<Reply> selectReplyList(int nId) {

		return (ArrayList)sqlSession.selectList("noticeMapper.selectReplyList", nId);
	}

	public int insertReply(Reply r) {

		return sqlSession.insert("noticeMapper.insertReply", r);
	}


	public ArrayList<Catagory> getcList() {
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectCList");
	}


	public int deleteReply(int rId) {
		
		return sqlSession.update("noticeMapper.deleteReply", rId);
	}


	public int modifyReply(Reply r) {
		
		return sqlSession.update("noticeMapper.modifyReply", r);
	}


	public int getsListCount(SearchCondition sc) {
		
		return sqlSession.selectOne("noticeMapper.getsListCount", sc);
	}


	public ArrayList<Notice> selectsList(PageInfo pi, SearchCondition sc) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectsList", sc, rowBounds);
	}


	public ArrayList<Like> getlList() {
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectLikeList");
	}


	public int selectLike(Like l) {
		
		return sqlSession.selectOne("noticeMapper.selectLike", l);
	}

	public int selectnLike(int nId) {
		
		return sqlSession.selectOne("noticeMapper.selectnLike", nId);
	}


	public int appLike(Like l) {
		
		return sqlSession.insert("noticeMapper.insertLike", l);
	}


	public int canLike(Like l) {
		
		return sqlSession.delete("noticeMapper.deleteLike", l);
	}


	public ArrayList<Notice> getNotice() {
		
		return (ArrayList)sqlSession.selectList("noticeMapper.getNotice");
	}

	
	
}
