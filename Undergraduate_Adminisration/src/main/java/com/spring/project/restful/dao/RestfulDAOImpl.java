package com.spring.project.restful.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.restful.vo.Message;
import com.spring.project.share.dao.ShareDAO;

@Repository
public class RestfulDAOImpl implements RestfulDAO{
	@Autowired
	SqlSession sqlSession;
	
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
}
