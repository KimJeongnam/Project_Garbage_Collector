package com.spring.project.restful.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;

import com.spring.project.restful.vo.Message;

public interface RestfulService {
	public Map<String, List<Message>> getMessages(Map<String, Object> map,
			HttpServletRequest request, Logger logger);
	
}
