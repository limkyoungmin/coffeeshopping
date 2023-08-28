package com.novocozy.persistence;

import java.util.List;

import com.novocozy.domain.NoticeVO;

public interface NoticeDAO {
	public void insertNotice(NoticeVO noticeVo) throws Exception;
	public List<NoticeVO> noticeList(NoticeVO noticeVo) throws Exception;
	public NoticeVO noticeDetail(int notice_num) throws Exception;
	public void updateNotice(NoticeVO noticeVo) throws Exception;
	public void deleteNotice(int notice_num) throws Exception;
}
