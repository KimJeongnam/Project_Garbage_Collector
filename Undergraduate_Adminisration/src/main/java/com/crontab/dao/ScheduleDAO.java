package com.crontab.dao;

import com.crontab.vo.LectrueSelectPeriod;

public interface ScheduleDAO {
	// 현재 년도 학기
	public LectrueSelectPeriod getYearSemester();
	// 수강 신청 시작 체크 1이면 수강신청 시작
	public int checkStartSelectLecture(LectrueSelectPeriod lectrueSelectPeriod);
	// 수강 신청 종료 체크 1이면 수장신청 기간 종료
	public int checkEndSelectLecture(LectrueSelectPeriod lectrueSelectPeriod);
	
	// 개강일 시작 체크
	public int checkOpening(LectrueSelectPeriod lectrueSelectPeriod);
	
	// 학점 입력일 체크
	public int checkGradeOpening(LectrueSelectPeriod lectrueSelectPeriod);
	
	// 종강일
	public int checkEnding(LectrueSelectPeriod lectrueSelectPeriod);
	
	public void updateLectureStatus(LectrueSelectPeriod lectrueSelectPeriod);
	 
}
