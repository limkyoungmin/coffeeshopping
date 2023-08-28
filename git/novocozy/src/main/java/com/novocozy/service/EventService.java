package com.novocozy.service;

import java.util.List;

import com.novocozy.domain.EventVO;

public interface EventService {
	public List<EventVO> eventList(EventVO eventVo) throws Exception;
	public void eventWrite(EventVO eventVo) throws Exception;
	public EventVO eventDetail(int event_num) throws Exception;
	public void eventUpdate(EventVO eventVo) throws Exception;
	public void eventDelete(int event_num) throws Exception;
}
