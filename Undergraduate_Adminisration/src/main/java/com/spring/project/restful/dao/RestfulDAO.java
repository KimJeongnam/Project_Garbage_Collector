package com.spring.project.restful.dao;

import java.util.List;
import java.util.Map;

import com.spring.project.restful.vo.Location;
import com.spring.project.restful.vo.Message;
import com.spring.project.restful.vo.RestUser;
import com.spring.project.restful.vo.StdReport;
import com.spring.project.restful.vo.StdScore;
import com.spring.project.student.vo.LectureVO;

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
	public List<Object> getStdLectureTime_test(LectureVO vo);
	public List<Object> getStdLectureTime(LectureVO vo);
	public List<StdReport> getReports(Map<String, Object> map);
	public List<Object> getTotalScore(String stdNumber);
	//---------------------------Android-END---------------------------------
}
