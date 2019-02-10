package com.spring.project.restful.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;

import com.spring.project.restful.vo.Message;
import com.spring.project.share.vo.Major;

public interface RestfulService {
	public Map<String, List<Message>> getMessages(Map<String, Object> map,
			HttpServletRequest request, Logger logger);
	public Message showMessage(Map<String, Object> map, Logger logger);
	
	// 학과 조회
	public List<Major> getMajors(Map<String, Object> map);
}
