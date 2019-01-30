package com.spring.project.restful.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.restful.dao.RestfulDAO;
import com.spring.project.restful.vo.Message;

@Service
public class RestfulServiceImpl implements RestfulService{
	@Autowired
	RestfulDAO dao;
	
	@Override
	public Map<String, List<Message>> getMessages(Map<String, Object> map, 
			HttpServletRequest request, Logger logger) {
		Map<String, List<Message>> result = new HashMap<String, List<Message>>();
		String userNumber = (String) map.get("userNumber");
		
		List<Message> sessionMessages = (List<Message>) request.getSession()
				.getAttribute("Messages");
		
		//logger.info("request userNumber : "+userNumber);
		List<Message> list = dao.getMessages(userNumber);
		//logger.info("response list size : "+list.size());
		
		if(sessionMessages != null) {
			//logger.info("sessionMessage count : "+sessionMessages.size());
			/*
			 *  DB에서 가져온 메세지와 Session에서 가져온 메세지를 비교 후
			 *  이미 세션에 있던 메세지라면 DB에서 가져온 메세지 삭제..  
			 */
			for(Iterator<Message> it = list.iterator(); it.hasNext();) {
				Message getmsg = it.next();
				for(Message message : sessionMessages) {
					if(message.getMessageCode() == getmsg.getMessageCode()) {
						it.remove();
					}
				}
			}
			/*
			 * 위과정을 거치고 남아있는 새로운 메세지가 있을시 처리
			 */
			if(list.size()>0) {
				for(Message msg : list) {
					sessionMessages.add(msg);
				}
				Collections.sort(sessionMessages);
				
				request.getSession().setAttribute("Messages", sessionMessages);
			}
			
		}else {
			request.getSession().setAttribute("Messages", list);
		}
		
		logger.info("response list Size() : "+list.size());
		result.put("newMessages", list);
		result.put("notReadMessages", sessionMessages);
		return result;
	}
}
