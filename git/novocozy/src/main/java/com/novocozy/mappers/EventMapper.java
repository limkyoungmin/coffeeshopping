package com.novocozy.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.novocozy.domain.EventVO;

@Mapper
public interface EventMapper {
	public List<EventVO> eventList (EventVO eventVo) throws Exception;
	public void insertEvent (EventVO eventVo) throws Exception;
	public EventVO eventDetail (int event_num) throws Exception;
	public void updateEvent (EventVO eventVo) throws Exception;
	public void deleteEvent (int event_num) throws Exception;
}
