package com.kh.FIFAOFFLINE.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.FIFAOFFLINE.notice.model.dao.NoticeDao;
import com.kh.FIFAOFFLINE.notice.model.vo.PageInfo;
import com.kh.FIFAOFFLINE.notice.model.vo.Reply;
import com.kh.FIFAOFFLINE.notice.model.vo.Notice;

@Service("nService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	NoticeDao nDao;
	
	@Override
	public int getListCount() {
		return nDao.getListCount();
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
	
		return nDao.selectList(pi);
	}



	@Override
	public int insertNotice(Notice n) {

		return nDao.insertNotice(n);
	}
	
	@Override
	public int addReadCount(int nId) {
		
		return nDao.addReadCount(nId);
	}

	@Override
	public Notice selectOne(int nId) { 
		
		return nDao.selectOne(nId);
	}

	@Override
	public int updateNotice(Notice n) {

		return nDao.updateNotice(n);
	}

	@Override
	public int deleteNotice(int nId) {
		
		return nDao.deleteNotcie(nId);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int nId) {
		
		return nDao.selectReplyList(nId);
	}

	@Override
	public int insertReply(Reply r) {
		
		return nDao.insertReply(r);
	}

}
