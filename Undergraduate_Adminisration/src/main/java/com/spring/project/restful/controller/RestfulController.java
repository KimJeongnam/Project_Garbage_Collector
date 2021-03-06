package com.spring.project.restful.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.project.admin.service.AdminService;
import com.spring.project.restful.service.RestfulService;
import com.spring.project.restful.vo.Location;
import com.spring.project.restful.vo.Message;
import com.spring.project.restful.vo.ResponseData;
import com.spring.project.share.vo.Major;
import com.spring.project.student.vo.LectureVO;

// ****************************************************** 김 정 남 ******************************************************
@Controller
public class RestfulController {
	@Autowired
	RestfulService service;
	@Autowired
	AdminService adminService;

	private static final Logger logger = LoggerFactory.getLogger(RestfulController.class);

	@ResponseBody
	@RequestMapping(value = "/rest/api/v1.0/messages", method = RequestMethod.POST)
	public Map<String, List<Message>> messages(@RequestBody Map<String, Object> map, HttpServletRequest request) {
		Map<String, List<Message>> responseData = null;
		// logger.info("messages()");

		responseData = service.getMessages(map, request, logger);

		return responseData;
	}

	@ResponseBody
	@RequestMapping(value = "/rest/api/v1.0/showMessage", method = RequestMethod.POST)
	public Message getMessage(@RequestBody Map<String, Object> map) {
		Message message = null;
		message = service.showMessage(map, logger);
		return message;
	}

	// 학과 조회
	@ResponseBody
	@RequestMapping(value = "/rest/json/getMajors", method = RequestMethod.POST)
	public List<Major> getMajors(@RequestBody Map<String, Object> map) {
		logger.info("List<Major> getMajors()");
		List<Major> list = null;
		list = service.getMajors(map);
		return list;
	}

	// 강의 정보 조회
	@ResponseBody
	@RequestMapping(value = "/rest/api/v1.0/getLecture/{lecCode}", method = RequestMethod.GET)
	public LectureVO getLecture(@PathVariable String lecCode, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lecCode", lecCode);
		return adminService.getLecture(map);
	}

	// 메세지 송신
	@ResponseBody
	@RequestMapping(value = "/rest/api/v1.0/messsage/send", method=RequestMethod.POST)
	public Map<String, Object> sendMessage(@RequestBody Map<String, Object> map) {
		logger.info("sendMessage()");
		return service.sendMessage(map);
	}
	
	@ResponseBody
	@RequestMapping(value="/rest/api/v1.0/connect_check", method=RequestMethod.GET)
	public Map<String, Object> connectCheck(){
		Map<String, Object> responseData = new HashMap<String, Object>();
		responseData.put("message", "connect success");
		responseData.put("status", 1);
		responseData.put("data", null);
		
		return responseData;
	}
	
	@ResponseBody
	@RequestMapping(value="/rest/api/v1.0/login/student", method=RequestMethod.POST)
	public ResponseData studentLogin(@RequestParam String userNumber, @RequestParam String userPassword) {
		logger.info("studentLogin");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNumber", userNumber);
		map.put("userPassword", userPassword);
		return service.studentLogin(map);
	}
	
	
	// ResponseEntry 예제..
	@ResponseBody
	@RequestMapping(value="/rest/api/v1.0/login/student/test", method=RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> studentLogin2(@RequestParam String userNumber, @RequestParam String userPassword) {
		logger.info("studentLogin");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNumber", userNumber);
		map.put("userPassword", userPassword);
		ResponseData data = service.studentLogin(map);
		map.clear();
		map.put("message", data.getMessage());
		map.put("data", data.getData());
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	// 남도  시,군,구  동  지역의 x, y 값 가져오는 rest api
	@ResponseBody
	@RequestMapping(value="/rest/api/v1.0/getLocation")
	public ResponseData getLocation(@RequestParam String area
			, @RequestParam String locality
			, @RequestParam String thoroughfare) {
		Location location = new Location();
		location.setArea(area);
		location.setLocality(locality);
		location.setThoroughfare(thoroughfare);
		/*logger.info("getLocation()");
		logger.info(area+" "+locality+" "+thoroughfare);*/
		return service.getLocation(location);
	}
	
	@ResponseBody
	@RequestMapping(value="/rest/api/v1.0/getLectureTime")
	public ResponseData getLectureTime(@RequestParam String stdNumber, @RequestParam int day) {
		logger.info("getLectureTime()");
		return service.getLectureTime(stdNumber, day);
	}
	
	@ResponseBody
	@RequestMapping(value="/rest/api/v1.0/getStdReports", method=RequestMethod.POST)
	public ResponseData getStdReports(@RequestParam String stdNumber) {
		logger.info("getStdReports()");
		return service.getStdReports(stdNumber);
	}
	
	@ResponseBody
	@RequestMapping(value="/rest/api/v1.0/getTotalScore", method=RequestMethod.POST)
	public ResponseData getTotalScore(@RequestParam String stdNumber) {
		logger.info("getTotalScore()");
		return service.getStdTotalScore(stdNumber);
	}
	
}
//****************************************************** 김 정 남 ******************************************************
