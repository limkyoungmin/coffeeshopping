package com.novocozy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novocozy.domain.NoticeVO;
import com.novocozy.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeDAO noticeDao;
	
	@Override
	public void noticeWrite(NoticeVO noticeVo) throws Exception {
		noticeDao.insertNotice(noticeVo);
	}
	
	@Override
	public List<NoticeVO> noticeList(NoticeVO noticeVo) throws Exception {
		return noticeDao.noticeList(noticeVo);
	}
	
	@Override
	public NoticeVO noticeDetail(int notice_num) throws Exception {
		return noticeDao.noticeDetail(notice_num);
	}
	
	@Override
	public void noticeUpdate(NoticeVO noticeVo) throws Exception {
		noticeDao.updateNotice(noticeVo);
	}
	
	@Override
	public void noticeDelete(int notice_num) throws Exception {
		noticeDao.deleteNotice(notice_num);
	}
}
