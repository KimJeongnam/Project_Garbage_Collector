package com.spring.project.restful.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.project.restful.vo.Location;
import com.spring.project.restful.vo.Message;
import com.spring.project.restful.vo.ResponseData;
import com.spring.project.share.vo.Major;

public interface RestfulService {
	public Map<String, List<Message>> getMessages(Map<String, Object> map,
			HttpServletRequest request, Logger logger);
	public Message showMessage(Map<String, Object> map, Logger logger);
	
	// 학과 조회
	public List<Major> getMajors(Map<String, Object> map);
	
	// 메세지 전송
	public Map<String, Object> sendMessage(Map<String, Object> map);
	
	//---------------------------Android-START---------------------------------
	public ResponseData studentLogin(Map<String, Object> map);
	// 지역 정보 검색
	public ResponseData getLocation(Location location); 
	// 학생의 요일별 시간표 검색
	public ResponseData getLectureTime(String stdNumber, int day);
	// 학생의 과제 조회
	public ResponseData getStdReports(String stdNumber);
	//---------------------------Android-END---------------------------------
}
