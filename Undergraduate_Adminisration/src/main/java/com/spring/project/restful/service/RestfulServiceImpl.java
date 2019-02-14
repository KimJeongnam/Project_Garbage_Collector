package com.spring.project.restful.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.restful.dao.RestfulDAO;
import com.spring.project.restful.vo.Message;
import com.spring.project.share.dao.ShareDAO;
import com.spring.project.share.vo.Major;

@Service
public class RestfulServiceImpl implements RestfulService {
	@Autowired
	RestfulDAO dao;
	@Autowired
	ShareDAO shareDao;

	@Override
	public Map<String, List<Message>> getMessages(Map<String, Object> map, HttpServletRequest request, Logger logger) {
		Map<String, List<Message>> result = new HashMap<String, List<Message>>();
		String userNumber = (String) map.get("userNumber");

		map.put("readStatus",  0);
		
		List<Message> sessionMessages = null;
		if(request.getSession().getAttribute("Messages") != null)
			sessionMessages = (List<Message>) request.getSession().getAttribute("Messages");
		
		Map<Integer, Message> nets = new HashMap<Integer, Message>();
		
		List<Message> newMessages = new ArrayList<Message>();

		// logger.info("request userNumber : "+userNumber);
		List<Message> list = dao.getMessages(map);
		// logger.info("response list size : "+list.size());

		if (sessionMessages != null) {
			// logger.info("sessionMessage count : "+sessionMessages.size());
			/*
			 * DB에서 가져온 메세지와 Session에서 가져온 메세지를 비교 후 이미 세션에 있던 메세지라면 DB에서 가져온 메세지 삭제..
			 */
			for(Message msg : sessionMessages)
				nets.put(msg.getMessageCode(), msg);
			
			for(Message msg : list) {
				if(!nets.containsKey(msg.getMessageCode())) {
					try {
						newMessages.add((Message) msg.clone());
					} catch (CloneNotSupportedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			
			/*
			 * 위과정을 거치고 남아있는 새로운 메세지가 있을시 처리
			 */
			Collections.sort(newMessages);
			result.put("notReadMessages", list);
		} else {
			result.put("notReadMessages", list);
		}

		//logger.info("response list Size() : " + newMessages.size());
		request.getSession().setAttribute("Messages", list);
		result.put("newMessages", newMessages);

		return result;
	}

	// 메세지 보여주는 메서드
	@Override
	public Message showMessage(Map<String, Object> map, Logger logger) {
		return dao.showMessage(map);
	}

	// 학과 조회
	@Override
	public List<Major> getMajors(Map<String, Object> map) {
		return shareDao.getMajors(map);
	}
	
	
}
