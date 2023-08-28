package com.novocozy.persistence;

import java.util.List;

import com.novocozy.domain.EventVO;

public interface EventDAO {
	public List<EventVO> eventList (EventVO eventVo) throws Exception;
	public void insertEvent(EventVO eventVo) throws Exception;
	public EventVO eventDetail(int event_num) throws Exception;
	public void updateEvent(EventVO eventVo) throws Exception;
	public void deleteEvent(int event_num) throws Exception;
}
