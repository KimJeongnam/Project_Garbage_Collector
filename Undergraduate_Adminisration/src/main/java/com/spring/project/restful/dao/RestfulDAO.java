package com.spring.project.restful.dao;

import java.util.List;
import java.util.Map;

import com.spring.project.restful.vo.Location;
import com.spring.project.restful.vo.Message;
import com.spring.project.restful.vo.RestUser;

public interface RestfulDAO {
	public List<Message> getMessages(Map<String, Object> map);
	public int messageReadSet(Map<String, Object> map);
	public Message getMessage(Map<String, Object> map);
	public Message showMessage(Map<String, Object> map);
	public List<Message> getAllmessages(Map<String, Object> map);
	public int sendMessage(Map<String, Object> map);
	
	//---------------------------Android-START---------------------------------
	public RestUser getUser(Map<String, Object> map);
	public Location getLocation(Location location);
	//---------------------------Android-END---------------------------------
}
