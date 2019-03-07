package com.spring.project.restful.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.restful.vo.Location;
import com.spring.project.restful.vo.Message;
import com.spring.project.restful.vo.RestUser;
import com.spring.project.restful.vo.StdReport;
import com.spring.project.restful.vo.StdScore;
import com.spring.project.share.dao.ShareDAO;
import com.spring.project.student.vo.LectureVO;

@Repository
public class RestfulDAOImpl implements RestfulDAO{
	@Autowired
	SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(RestfulDAOImpl.class);
	
	@Override
	public List<Message> getMessages(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.project.restful.dao"
				+ ".RestfulDAO.getMessages", map);
	}

	@Override
	public int messageReadSet(Map<String, Object> map) {
		return sqlSession.update("com.spring.project.restful.dao"
				+ ".RestfulDAO.messageReadSet", map);
	}

	@Override
	public Message getMessage(Map<String, Object> map) {
		System.out.println(ShareDAO.getQuery(sqlSession, "getMessage", map));
		return sqlSession.selectOne("com.spring.project.restful.dao"
				+ ".RestfulDAO.getMessage", map);
	}

	@Override
	public Message showMessage(Map<String, Object> map) {
		if(messageReadSet(map)==0) return null; 
		return getMessage(map);
	}
	
	@Override
	public List<Message> getAllmessages(Map<String, Object> map){
		return null;
	}

	@Override
	public int sendMessage(Map<String, Object> map) {
		return sqlSession.insert("com.spring.project.restful.dao"
				+ ".RestfulDAO.sendMessage", map);
	}
	
	//---------------------------Android-START---------------------------------
	@Override
	public RestUser getUser(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.project.restful.dao"
				+ ".RestfulDAO.getUser", map);
	}

	@Override
	public Location getLocation(Location location) {
		return sqlSession.selectOne("com.spring.project.restful.dao"
				+ ".RestfulDAO.getLocation", location);
	}

	@Override
	public List<Object> getStdLectureTime_test(LectureVO vo) {
		return sqlSession.selectList("com.spring.project.restful.dao"
				+ ".RestfulDAO.getStdLectureTime_test", vo);
	}

	@Override
	public List<Object> getStdLectureTime(LectureVO vo) {
		return sqlSession.selectList("com.spring.project.restful.dao"
				+ ".RestfulDAO.getStdLectureTime", vo);
	}

	@Override
	public List<StdReport> getReports(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.project.restful.dao"
				+ ".RestfulDAO.getReports", map);
	}

	@Override
	public List<Object> getTotalScore(String stdNumber) {
		return sqlSession.selectList("com.spring.project.restful.dao"
				+ ".RestfulDAO.getTotalScore", stdNumber);
	}
	
	
	
	//---------------------------Android-END---------------------------------
}
