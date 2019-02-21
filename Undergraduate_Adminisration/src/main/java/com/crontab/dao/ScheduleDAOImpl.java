package com.crontab.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crontab.vo.LectrueSelectPeriod;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public LectrueSelectPeriod getYearSemester() {
		return sqlSession.selectOne("com.crontab.dao.ScheduleDAO.getYearSemester");
	}

	@Override
	public int checkStartSelectLecture() {
		return 0;
	}

	@Override
	public int checkEndSelectLecture() {
		return 0;
	}

	@Override
	public int checkOpening() {
		return 0;
	}

	@Override
	public int checkGradeOpening() {
		return 0;
	}

	@Override
	public int checkEnding() {
		return 0;
	}
	
}
