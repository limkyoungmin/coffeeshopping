package com.novocozy.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.novocozy.domain.NoticeVO;

@Mapper
public interface NoticeMapper {
	public void insertNotice(NoticeVO noticeVo) throws Exception;
	public List<NoticeVO> noticeList(NoticeVO noticeVo) throws Exception;
	public NoticeVO noticeDetail(int notice_num) throws Exception;
	public void updateNotice(NoticeVO noticeVo) throws Exception;
	public void deleteNotice(int notice_num) throws Exception;
}
