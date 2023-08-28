package com.novocozy.service;

import java.util.List;

import com.novocozy.domain.NoticeVO;

public interface NoticeService {
	public void noticeWrite(NoticeVO noticeVo) throws Exception;
	public List<NoticeVO> noticeList(NoticeVO noticeVo) throws Exception;
	public NoticeVO noticeDetail(int notice_num) throws Exception;
	public void noticeUpdate(NoticeVO noticeVo) throws Exception;
	public void noticeDelete(int notice_num) throws Exception;
}
