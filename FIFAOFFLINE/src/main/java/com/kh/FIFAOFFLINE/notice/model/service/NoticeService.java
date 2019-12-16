package com.kh.FIFAOFFLINE.notice.model.service;

import java.util.ArrayList;

import com.kh.FIFAOFFLINE.notice.model.vo.Notice;
import com.kh.FIFAOFFLINE.notice.model.vo.PageInfo;
import com.kh.FIFAOFFLINE.notice.model.vo.Reply;

public interface NoticeService {
	
	
	/*
	 * 1.1 공지사항 전체 수 조회
	 * 
	 */
	public int getListCount();
	
	
	/*
	 * 1.2 공지사항 전체 조회
	 */
	public ArrayList<Notice> selectList(PageInfo pi);
		
	/*
	 * 2. 공지사항 등록
	 */
	public int insertNotice(Notice n);
	
	/*
	 * 3_1. 게시판 상세 조회시 조회수 증가
	 */
	public int addReadCount(int nId);
	/*
	 * 3_2 공지사항 상세 조회
	 */
	public Notice selectOne(int nId);
	
	/*
	 * 4. 공지사항 수정
	 */
	public int updateNotice(Notice n);
	
	/*
	 * 5. 공지사항 삭제
	 */
	public int deleteNotice(int nId);
	
	/*
	 * 6. 댓글 조회
	 */
	public ArrayList<Reply> selectReplyList(int nId);

	/*
	 * 7. 댓글 추가
	 */
	public int insertReply(Reply r);
	
}
