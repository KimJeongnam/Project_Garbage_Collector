package com.spring.project.restful.dao;

import java.util.List;

import com.spring.project.restful.vo.Message;

public interface RestfulDAO {
	public List<Message> getMessages(String userNumber);
}
