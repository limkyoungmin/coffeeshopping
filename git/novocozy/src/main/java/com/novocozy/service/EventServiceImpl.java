package com.novocozy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novocozy.domain.EventVO;
import com.novocozy.persistence.EventDAO;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	EventDAO eventDao;
	
	@Override
	public List<EventVO> eventList(EventVO eventVo) throws Exception {
		return eventDao.eventList(eventVo);
	}
	
	@Override
	public void eventWrite(EventVO eventVo) throws Exception {
		eventDao.insertEvent(eventVo);
	}
	
	@Override
	public EventVO eventDetail(int event_num) throws Exception {
		return eventDao.eventDetail(event_num);
	}
	
	@Override
	public void eventUpdate(EventVO eventVo) throws Exception {
		eventDao.updateEvent(eventVo);
	}
	
	@Override
	public void eventDelete(int event_num) throws Exception {
		eventDao.deleteEvent(event_num);
	}
}
