package com.novocozy.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.novocozy.domain.EventVO;

@Repository
public class EventDAOImpl implements EventDAO {
	
	@Autowired
	SqlSession session;
	
	private static String namespace="com.novocozy.mappers.EventMapper";
	
	@Override
	public List<EventVO> eventList(EventVO eventVo) throws Exception {
		return session.selectList(namespace + ".eventList", eventVo);
	}
	
	@Override
	public void insertEvent(EventVO eventVo) throws Exception {
		session.insert(namespace + ".insertEvent", eventVo);
	}
	
	@Override
	public EventVO eventDetail(int event_num) throws Exception {
		return session.selectOne(namespace + ".eventDetail", event_num);
	}
	
	@Override
	public void updateEvent(EventVO eventVo) throws Exception {
		session.update(namespace + ".updateEvent", eventVo);
	}
	
	@Override
	public void deleteEvent(int event_num) throws Exception {
		session.delete(namespace + ".deleteEvent", event_num);
	}
}
