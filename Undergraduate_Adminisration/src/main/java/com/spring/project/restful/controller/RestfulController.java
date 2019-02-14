package com.spring.project.restful.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.project.restful.service.RestfulService;
import com.spring.project.restful.vo.Message;
import com.spring.project.share.vo.Major;

@Controller
public class RestfulController {
	@Autowired
	RestfulService service;
	
	private static final Logger logger = LoggerFactory.getLogger(RestfulController.class);
	
	@ResponseBody
	@RequestMapping(value="/rest/api/v1.0/messages", method=RequestMethod.POST)
	public Map<String, List<Message>> messages(@RequestBody Map<String, Object> map,
			HttpServletRequest request) {
		Map<String, List<Message>> responseData = null;
		//logger.info("messages()");
		
		responseData = service.getMessages(map, request, logger);
		
		return responseData;
	}
	
	@ResponseBody
	@RequestMapping(value="/rest/api/v1.0/showMessage", method=RequestMethod.POST)
	public Message getMessage(@RequestBody Map<String, Object> map) {
		Message message = null;
		message = service.showMessage(map, logger);
		return message;
	}
	
	@ResponseBody
	@RequestMapping(value="/rest/json/getMajors")
	public List<Major> getMajors(@RequestBody Map<String, Object> map){
		logger.info("List<Major> getMajors()");
		List<Major> list = null;
		list = service.getMajors(map);
		return list;
	}
}
