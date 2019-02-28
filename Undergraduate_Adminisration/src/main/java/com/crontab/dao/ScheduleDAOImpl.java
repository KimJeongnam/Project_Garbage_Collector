package com.crontab.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
	public int checkStartSelectLecture(LectrueSelectPeriod lectrueSelectPeriod) {
		return sqlSession.selectOne("com.crontab.dao.ScheduleDAO.checkStartSelectLecture", lectrueSelectPeriod);
	}

	@Override
	public int checkEndSelectLecture(LectrueSelectPeriod lectrueSelectPeriod) {
		return sqlSession.selectOne("com.crontab.dao.ScheduleDAO.checkEndSelectLecture", lectrueSelectPeriod);
	}

	@Override
	public int checkOpening(LectrueSelectPeriod lectrueSelectPeriod) {
		return sqlSession.selectOne("com.crontab.dao.ScheduleDAO.checkOpening", lectrueSelectPeriod);
	}

	@Override
	public int checkGradeOpening(LectrueSelectPeriod lectrueSelectPeriod) {
		return sqlSession.selectOne("com.crontab.dao.ScheduleDAO.checkGradeOpening", lectrueSelectPeriod);
	}

	@Override
	public int checkEnding(LectrueSelectPeriod lectrueSelectPeriod) {
		return sqlSession.selectOne("com.crontab.dao.ScheduleDAO.checkEnding", lectrueSelectPeriod);
	}

	@Override
	public void updateLectureStatus(LectrueSelectPeriod lectrueSelectPeriod) {
		sqlSession.selectOne("com.crontab.dao.ScheduleDAO.updateLectureStatus", lectrueSelectPeriod);
	}
}
