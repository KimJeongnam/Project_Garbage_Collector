package com.crontab;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {
	private static final Logger logger = LoggerFactory.getLogger(Scheduler.class);
	
	// 초 분 시 일 월 요일
	// 수강신청 시작 스케줄러
	@Scheduled(cron="00 00 09 * * *")
	public void cronStartSelectLecture() {
		logger.info("00 00 09 * * * cronStartLectureSelect()");
		
	}

	// 수강신청 종료 스케줄러
	@Scheduled(cron="00 00 22 * * *")
	public void cronEndSelectLecture() {
		logger.info("00 00 22 * * * cronEndSelectLecture()");
	}
	
	// 개강, 종강 스케줄러
	@Scheduled(cron="00 00 00 * * *")
	public void cronOpeningANDEndingCheck() {
		logger.info("00 00 00 * * * cronOpeningANDEndingCheck()");
	}
}
