package com.spring.project.admin.dao;

import java.util.List; 
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.admin.vo.AdProVO;
import com.spring.project.admin.vo.AdStdVO;
import com.spring.project.admin.vo.ScholarpkVO;
import com.spring.project.admin.vo.auditVO;
import com.spring.project.admin.vo.payrollVO;
import com.spring.project.share.vo.Major;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	//사용자 등록(학생)
	@Override
	public int insertUsers(AdStdVO vo) {
		return sqlSession.insert("com.spring.project.admin.dao.AdminDAO.insertUsers", vo);
	}
	
	//학생등록(학생)
	@Override
	public int insertStudent(AdStdVO vo) {
		return sqlSession.insert("com.spring.project.admin.dao.AdminDAO.insertStudent", vo);
	}
	
	//학기 등록(학생)
	@Override
	public int insertStudentState(AdStdVO vo) {
		return sqlSession.insert("com.spring.project.admin.dao.AdminDAO.insertStudentState", vo);
	}
	
	// 교수등록
	@Override
	public int insertPUsers(AdProVO vo) {
		return sqlSession.insert("com.spring.project.admin.dao.AdminDAO.insertPUsers", vo);
	}
	
	//교수등록
	@Override
	public int insertEmployees(AdProVO vo) {
		return sqlSession.insert("com.spring.project.admin.dao.AdminDAO.insertEmployees", vo);
	}
	
	//학생리스트 by admin
	@Override
	public List<AdStdVO> getStdList(Map<String, Integer> map) {
		List<AdStdVO> dtos = null;
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		dtos = dao.getStdList(map);
		return dtos;
		//return sqlSession.selectList()
	}
	
	//교수리스트 by admin
	@Override
	public List<AdProVO> getProList(Map<String, Integer> map) {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.getProList", map);
	}
	//학생상세
	@Override
	public AdStdVO stdDetail(int userNum) {
		return sqlSession.selectOne("com.spring.project.admin.dao.AdminDAO.stdDetail", userNum);
	}
	
	//교수상세
	@Override
	public AdProVO proDetail(int userNum) {
		return sqlSession.selectOne("com.spring.project.admin.dao.AdminDAO.proDetail", userNum);
	}
	
	//학생정보 업데이트
	@Override
	public int updateUsers(AdStdVO vo) {
		return sqlSession.update("com.spring.project.admin.dao.AdminDAO.updateUsers", vo);
	}
	
	//학생정보 업데이트
	@Override
	public int updateStudent(AdStdVO vo) {
		return sqlSession.update("com.spring.project.admin.dao.AdminDAO.updateStudent", vo);
	}
	
	//학생정보 업데이트
	@Override
	public int updateStudentState(AdStdVO vo) {
		return sqlSession.update("com.spring.project.admin.dao.AdminDAO.updateStudentState", vo);
	}
	
	//교수정보 업데이트
	@Override
	public int updatePUsers(AdProVO vo) {
		return sqlSession.update("com.spring.project.admin.dao.AdminDAO.updatePUsers", vo);
	}
	
	//교수정보 업데이트
	@Override
	public int updateEmployees(AdProVO vo) {
		return sqlSession.update("com.spring.project.admin.dao.AdminDAO.updateEmployees", vo);
	}

	//학생+교수 삭제
	@Override
	public int stdDelete(String userNum) {
		return sqlSession.update("com.spring.project.admin.dao.AdminDAO.stdDelete", userNum);
	}
	
	//단과대 + 학과 리스트
	@Override
	public List<AdProVO> FandMList(Map<String, Integer> map) {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.FandMList", map);
	}
	
	//휴복학 리스트
	@Override
	public List<AdStdVO> getSchoolLeave(Map<String, Integer> map) {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.getSchoolLeave", map);
	}
	
	//=============================장학금 대그니꺼=======================================
	//장학 글 갯수
	@Override
	public int getArticleCnt() {
		int selectCnt = sqlSession.selectOne("com.spring.project.admin.dao.AdminDAO.getArticleCnt");
		return selectCnt;
	}
	
	//장학 글 목록
	@Override
	public List<ScholarpkVO> getArticleList(Map<String, Object> map) {
		List<ScholarpkVO> dtos = sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.getArticleList",map);
		
		return dtos;
	}
	
	@Override
	//장학금 글 추가
	public int insertjangjag(ScholarpkVO vo) {
		// TODO Auto-generated method stub
		int insertCnt = sqlSession.insert("com.spring.project.admin.dao.AdminDAO.insertjangjag",vo);
		return insertCnt;
	}
	
	@Override
	//장학금 글 상세
	public ScholarpkVO getArticle(int scholarpk) {
		ScholarpkVO dtos = sqlSession.selectOne("com.spring.project.admin.dao.AdminDAO.getArticle",scholarpk);
		return dtos;
	}
	
	//장학금 글 삭제
	@Override
	public int delete(String[] checkbox) {
			
		int updateCnt = sqlSession.update("com.spring.project.admin.dao.AdminDAO.delete",checkbox);
		System.out.println("==================deleteCnt" + updateCnt);
		return updateCnt;
	}
	
	//장학금 심사
	@Override
	public List<auditVO> auditCnt() {
		System.out.println("111111111111");
		List<auditVO> dtos = sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.auditCnt");
		
		return dtos;
	}

	//---------------교직 업무 관리 START-------------------
	// 학과 리스트 갯수 구하기
	@Override
	public int majorListCount(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.project.admin.dao.AdminDAO.majorListCount", map);
	}
	
	// 학과 조회
	@Override
	public List<Major> majorList(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.majorList", map);
	}
	
	// 학과 폐지
	@Override
	public int deleteMajor(Map<String, Object> map) {
		return sqlSession.update("com.spring.project.admin.dao.AdminDAO.deleteMajor", map);
	}
	// 학과 개설
	@Override
	public int addMajor(Major major) {
		return sqlSession.insert("com.spring.project.admin.dao.AdminDAO.addMajor", major);
	}
	// 학과 수정
	@Override
	public int modifyMajor(Major major) {
		return sqlSession.update("com.spring.project.admin.dao.AdminDAO.modifyMajor", major);
	}
	@Override
	public List<Object> emptyLecTime(String empNumber) {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.emptyLecTime", empNumber);
	}
	//---------------교직 업무 관리 END-------------------
	
	@Override
	public List<payrollVO> payrollList() {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.payrollList");
	}
}
