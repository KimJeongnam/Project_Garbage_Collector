package com.crontab;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.crontab.dao.ScheduleDAO;
import com.crontab.vo.LectrueSelectPeriod;

@Component
public class Scheduler {
	private static final Logger logger = LoggerFactory.getLogger(Scheduler.class);

	@Autowired
	ScheduleDAO dao;

	// 초 분 시 일 월 요일
	// 스케줄러
	@Scheduled(cron = "00 * * * * *")
	public void cronScheduler() {

		LectrueSelectPeriod lectrueSelectPeriod = dao.getYearSemester();
		//logger.info("Year :"+lectrueSelectPeriod.getYear()+" semester : "+lectrueSelectPeriod.getSemester());
		// 수강신청 시작!!
		if (dao.checkStartSelectLecture(lectrueSelectPeriod) == 1) {
			logger.info("* * * * * * cronScheduler()");
			logger.info("수강 신청 시작!!!");
			lectrueSelectPeriod.setStatus(0);
			dao.updateLectureStatus(lectrueSelectPeriod);
			if (lectrueSelectPeriod.getResult() == 0)
				logger.info("수강 신청 시작 오류!!!! 확인 요망");
			else
				logger.info("수강 신청 시작 완료!");
		}
		// 수강신청 기간 종료!
		if (dao.checkEndSelectLecture(lectrueSelectPeriod) == 1) {
			logger.info("00 * * * * * cronScheduler()");
			logger.info("수강 신청 종료!!!");
			lectrueSelectPeriod.setStatus(3);
			dao.updateLectureStatus(lectrueSelectPeriod);
			if (lectrueSelectPeriod.getResult() == 0)
				logger.info("수강 신청 종료 오류!!!! 확인 요망");
			else
				logger.info("수강 신청 종료 완료!");
		}

		// 개강!!
		if (dao.checkOpening(lectrueSelectPeriod) == 1) {
			logger.info("00 * * * * * cronScheduler()");
			logger.info("개강!!!");
			lectrueSelectPeriod.setStatus(1);
			dao.updateLectureStatus(lectrueSelectPeriod);
			if (lectrueSelectPeriod.getResult() == 0)
				logger.info("개강 변경 오류!!!! 확인 요망");
			else
				logger.info("개강 완료!");
		}

		// 수강신청 기간 종료!
		if (dao.checkGradeOpening(lectrueSelectPeriod) == 1) {
			logger.info("00 * * * * * cronScheduler()");
			logger.info("학점 입력 기간!!!");
			lectrueSelectPeriod.setStatus(2);
			dao.updateLectureStatus(lectrueSelectPeriod);
			if (lectrueSelectPeriod.getResult() == 0)
				logger.info("학점 입력 기간 오류!!!! 확인 요망");
			else
				logger.info("학점 입력 기간 완료!");
		}

		// 수강신청 기간 종료!
		if (dao.checkEnding(lectrueSelectPeriod) == 1) {
			logger.info("00 * * * * * cronScheduler()");
			logger.info("종강!!!");
			lectrueSelectPeriod.setStatus(3);
			dao.updateLectureStatus(lectrueSelectPeriod);
			if (lectrueSelectPeriod.getResult() == 0)
				logger.info("종강 오류!!!! 확인 요망");
			else
				logger.info("종강 완료!");
		}
	}
	/*
	 * // 수강신청 종료 스케줄러
	 * 
	 * @Scheduled(cron="00 00 22 * * *") public void cronEndSelectLecture() {
	 * logger.info("00 00 22 * * * cronEndSelectLecture()");
	 * 
	 * }
	 * 
	 * // 개강, 학점입력, 종강 스케줄러
	 * 
	 * @Scheduled(cron="00 00 00 * * *") public void cronOpeningANDEndingCheck() {
	 * logger.info("00 00 00 * * * cronOpeningANDEndingCheck()"); }
	 */
}
