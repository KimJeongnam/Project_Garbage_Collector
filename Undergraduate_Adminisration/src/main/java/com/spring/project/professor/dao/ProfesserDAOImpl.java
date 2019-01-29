package com.spring.project.professor.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.professor.vo.Vo;

@Repository
public class ProfesserDAOImpl implements ProfesserDAO{

	@Autowired
	private SqlSession sql;
	
	
	@Override
	public Vo myPage(String userNumber) {
		return sql.selectOne("com.spring.project.professor.dao.ProfesserDAO.myPage",userNumber);
	}

}
