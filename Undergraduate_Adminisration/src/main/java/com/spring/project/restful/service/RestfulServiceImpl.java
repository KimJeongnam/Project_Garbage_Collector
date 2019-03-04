package com.spring.project.restful.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.Days;
import com.spring.project.restful.dao.RestfulDAO;
import com.spring.project.restful.vo.Location;
import com.spring.project.restful.vo.Message;
import com.spring.project.restful.vo.ResponseData;
import com.spring.project.restful.vo.RestUser;
import com.spring.project.restful.vo.StdLecTime;
import com.spring.project.share.dao.ShareDAO;
import com.spring.project.share.vo.Major;
import com.spring.project.student.vo.LectureVO;

@Service
public class RestfulServiceImpl implements RestfulService {
	@Autowired
	RestfulDAO dao;
	@Autowired
	ShareDAO shareDao;
	
	private static final Logger logger = LoggerFactory.getLogger(RestfulServiceImpl.class);

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, List<Message>> getMessages(Map<String, Object> map, HttpServletRequest request, Logger logger) {
		Map<String, List<Message>> result = new HashMap<String, List<Message>>();
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

	@Override
	public Map<String, Object> sendMessage(Map<String, Object> map) {
		Map<String, Object> response = new HashMap<String, Object>();
		response.put("result",  dao.sendMessage(map));
		return response;
	}
	
	//---------------------------Android-START---------------------------------
	@Override
	public ResponseData studentLogin(Map<String, Object> map) {
		ResponseData responseData = new ResponseData();
		RestUser user = dao.getUser(map);
		int status = 0;
		String message = "";
		
		message = "로그인 실패 없는 아이디 입니다.";
		
		if(user != null) {
			
			if(user.getDelStatus()==1)
				message = "로그인 실패! '삭제된 회원 입니다. 관리자에게 문의 하세요.'";
			String pw = user.getUserPassword();
			
			if(pw.equals((String)map.get("userPassword"))) {
				message = "로그인 성공!";
				status=1;
				responseData.setData(user);
			}else {
				message = "로그인 실패 '비밀번호'가 다릅니다.!";
			}
		}
		
		responseData.setStatus(status);
		responseData.setMessage(message);
		return responseData;
	}

	@Override
	public ResponseData getLocation(Location location) {
		ResponseData responseData = new ResponseData();
		Location getLocation = dao.getLocation(location);
		
		if(getLocation != null) {
			responseData.setStatus(1);
			responseData.setMessage("success");
			responseData.setData(getLocation);
			//logger.info("getLocation not null");
		}else {
			responseData.setStatus(0);
			responseData.setMessage("위치 정보 가져오기 오류!  location is null");
			//logger.info("getLocation is null");
		}
		return responseData;
	}

	@Override
	public ResponseData getLectureTime(String stdNumber, int day) {
		ResponseData responseData = new ResponseData();
		LectureVO vo = new LectureVO();
		vo.setUserNumber(stdNumber);
		vo.setDay(day);
		
		Days edays = Days.MON;
		
		Days eday= edays.valueOf(day);
		
		List<Object> data = dao.getStdLectureTime(vo);
		
		logger.info("GET DAY : "+day);
		logger.info("Days : "+eday.getDays1Value());
		
		String message = "";
		
		responseData.setStatus(0);
		responseData.setMessage("fail");
		if(data != null) {
			responseData.setStatus(1);
			responseData.setMessage("success");
			
			message += "'"+eday.getDays1Value()+"'요일 시간표\n";
			
			if(data.size()==0) message += "시간표가 비어 있습니다.";
			
			message += "\t\t\t\t\t강의명\t\t\t|  강의실\n";
			for(Object obj: data) {
				StdLecTime dto = (StdLecTime)obj;
				
				message += dto.getClassTime()+"교시 : "+dto.getLectureName()+"\t, "+dto.getClassRoom()+"\n";
			}
			
			responseData.setData(message);
		}
	
		return responseData;
	}
	
	//---------------------------Android-END---------------------------------
}
