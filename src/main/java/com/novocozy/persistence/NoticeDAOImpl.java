package com.novocozy.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.novocozy.domain.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.novocozy.mappers.NoticeMapper";
	
	@Override
	public void insertNotice(NoticeVO noticeVo) throws Exception {
		session.insert(namespace + ".insertNotice", noticeVo);
	}
	
	@Override
	public List<NoticeVO> noticeList(NoticeVO noticeVo) throws Exception {
		return session.selectList(namespace + ".noticeList", noticeVo);
	}
	
	@Override
	public NoticeVO noticeDetail(int notice_num) throws Exception {
		return session.selectOne(namespace + ".noticeDetail", notice_num);
	}
	
	@Override
	public void updateNotice(NoticeVO noticeVo) throws Exception {
		session.update(namespace + ".updateNotice", noticeVo);
	}
	
	@Override
	public void deleteNotice(int notice_num) throws Exception {
		session.delete(namespace + ".deleteNotice", notice_num);
	}
}
