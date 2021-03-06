package com.spring.project.student.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.admin.vo.ScholarpkVO;
import com.spring.project.share.dao.ShareDAO;
import com.spring.project.student.vo.GpaVO;
//github.com/KimJeongnam/Project_Garbage_Collector.git
import com.spring.project.student.vo.LectureVO;
import com.spring.project.student.vo.Report_subVO;
import com.spring.project.student.vo.S_informationVO;
import com.spring.project.student.vo.middle_classVO;
import com.spring.project.student.vo.report_tblVO;

@Repository
public class StudentDAOImpl implements StudentDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	// 수강신청 목록 갯수 구하기
	@Override
	public int getLectureCnt(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.getLectureCnt", map);
	}

	// 수강신청 목록 조회
	@Override
	public List<LectureVO> lectureList(Map<String, Object> map) {
		System.out.println(ShareDAO.getQuery(sqlSession, "lectureList", map));
		return sqlSession.selectList("com.spring.project.student.dao.StudentDAO.lectureList", map);
	}

	// 시간표 조회
	@Override
	public List<LectureVO> schoolTimeTable(String userNumber) {
		return sqlSession.selectList("com.spring.project.student.dao.StudentDAO.schoolTimeTable", userNumber);
	}
		
	// 시간표 Hover
	@Override
	public List<LectureVO> lectureHover(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.project.student.dao.StudentDAO.lectureHover", map);
	}
	
	// 강의 검색 리스트 갯수
	@Override
	public int getLectureSearchCnt(String keyword) {
		return sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.getLectureSearchCnt", keyword);
	}
	
	// 강의 검색
	@Override
	public List<LectureVO> lectureSearch(String keyword) {
		return sqlSession.selectList("com.spring.project.student.dao.StudentDAO.lectureSearch", keyword);
	}
	
	// 강의 체크
	@Override
	public int checkLecture(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.checkLecture", map);
	}
	
	// 강의 인원수 체크
	@Override
	public int checkStudentInLecture(String lecCode) {
		return sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.checkStudentInLecture", lecCode);
	}
	
	// 강의 인원수 체크
	@Override
	public int checkStudentInLecture2(Map<String, Object> map2) {
		return sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.checkStudentInLecture2", map2);
	}
	
	// 듣고자 하는 강의 학점 합 
	@Override
	public int getLectureScoreSum(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.getLectureScoreSum", map);
	}
	
	// 강의 신청
	@Override
	public int applyLecture(Map<String, Object> map) {
		return sqlSession.insert("com.spring.project.student.dao.StudentDAO.applyLecture", map);
	}
	//프로필 이미지 변경
	@Override
	public int s_imageUpload(S_informationVO vo) {
		
		System.out.println(vo);
		
		int imageUpload=0;
		
		StudentDAO dao = sqlSession.getMapper(StudentDAO.class);
		
		imageUpload=dao.s_imageUpload(vo);
		
		System.out.println(imageUpload==1?"프로필 이미지 변경 성공!":"프로필 이미지 변경 실패!");
		
		return imageUpload;
	}
	
	//마이페이지
	@Override
	public S_informationVO personalProfile(String userNumber) {
		return sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.personalProfile",userNumber);
		
	}
	
	//개인정보 업데이트
	public int s_infoupdate(Map<String, Object> map) {
		int Cnt = sqlSession.update("com.spring.project.student.dao.StudentDAO.s_infoupdate",map);
		return Cnt;
	}
	
	//수강중 강의
	public List<middle_classVO> s_Lecture(String userNumber) {
		return sqlSession.selectList("com.spring.project.student.dao.StudentDAO.s_Lecture",userNumber);
	}
	//수강중 과제
	@Override
	public List<report_tblVO> s_report(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.project.student.dao.StudentDAO.s_report",map);
	}
	//과제 내용
	@Override
	public report_tblVO reportcontent(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.reportcontent",map);
	}
	
	//과제 제출
	@Override
	public Report_subVO reportsub(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.reportsub",map);
		
	}
	//과제 제출 확인 
	public int reportCheck(Map<String, Object> map) {
		int checkCnt = sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.reportCheck",map);
		return checkCnt;
	}
	
	//과제 제출 완료
	@Override
	public int s_fileUpload(Report_subVO vo) {
		int insertCnt = sqlSession.insert("com.spring.project.student.dao.StudentDAO.s_fileUpload",vo);
		return insertCnt;
	}
	
	//장학금 글 갯수
	@Override
	public int getArticleCnt(Map<String, Object> map) {
		int selectCnt = sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.getArticleCnt",map);
		return selectCnt;
	}
	//장학금 글 목록
	@Override
	public List<ScholarpkVO> getArticleList(Map<String, Object> map) {
		List<ScholarpkVO> dtos = sqlSession.selectList("com.spring.project.student.dao.StudentDAO.getArticleList",map);
		return dtos;
	}
	//장학금 수혜 내역 갯수
	@Override
	public int management_cnt(Map<String, Object> map) {
		int selectCnt = sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.management_cnt",map);
		return selectCnt;
	}
	//장학금 수혜 내역 목록
	@Override
	public List<Object> managementList(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.project.student.dao.StudentDAO.managementList",map);
	}
	//장학금 상세 
	@Override
	public ScholarpkVO getArticle(int scholarpk) {
		ScholarpkVO dtos = sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.getArticle",scholarpk);
		return dtos;
	}
	//장학금 중복확인 검사
	@Override
	public int scholarpk(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.scholarpk", map);
	}
	
	//장학금 신청완료 
	public int scholarshipinsert(Map<String, Object> map) {
		int Cnt = sqlSession.insert("com.spring.project.student.dao.StudentDAO.scholarshipinsert",map);
		return Cnt;
	}

	@Override
	public List<LectureVO> studentMyLecture(String userNumber) {
		return sqlSession.selectList("com.spring.project.student.dao.StudentDAO.studentMyLecture", userNumber);
	}

	@Override
	public int cancelLecture(Map<String, Object> map) {
		return sqlSession.delete("com.spring.project.student.dao.StudentDAO.cancelLecture", map);
	}
	
	// 강의 목록 조회(전공)
	@Override
	public List<LectureVO> getMajor() {
		return sqlSession.selectList("com.spring.project.student.dao.StudentDAO.getMajor");
	}

	// 내 학점 조회
	@Override
	public List<GpaVO> GPA(String userNumber) {
		return sqlSession.selectList("com.spring.project.student.dao.StudentDAO.GPA", userNumber);
	}
	
	// 신청 학점
	@Override
	public int ApplyCredit(String userNumber) {
		return sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.ApplyCredit", userNumber);
	}
	// 이수 학점
	@Override
	public List<GpaVO> grantedCredit(String userNumber) {
		return sqlSession.selectList("com.spring.project.student.dao.StudentDAO.grantedCredit", userNumber);
	}

	@Override
	public int getBachelorStatus() {
		return sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.getBachelorStatus");
	}

	@Override
	public int getTotalLecPoint(String userNumber) {
		return sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.getTotalLecPoint", userNumber);
	}

	

}
