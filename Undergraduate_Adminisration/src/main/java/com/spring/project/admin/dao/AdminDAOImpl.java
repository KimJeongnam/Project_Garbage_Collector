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
import com.spring.project.share.vo.Major;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	//사용자 등록
	@Override
	public int insertUsers(AdStdVO vo) {
		return sqlSession.insert("com.spring.project.admin.dao.AdminDAO.insertUsers", vo);
	}
	//단과대 등록
	@Override
	public int insertFaculty(AdStdVO vo) {
		return sqlSession.insert("com.spring.project.admin.dao.AdminDAO.insertFaculty", vo);
	}
	//학과 등록
	@Override
	public int insertMajor(AdStdVO vo) {
		return sqlSession.insert("com.spring.project.admin.dao.AdminDAO.insertMajor", vo);
	}
	//학생등록
	@Override
	public int insertStudent(AdStdVO vo) {
		return sqlSession.insert("com.spring.project.admin.dao.AdminDAO.insertStudent", vo);
	}
	//휴복학 등록
	@Override
	public int insertSchoolLeave(AdStdVO vo) {
		return sqlSession.insert("com.spring.project.admin.dao.AdminDAO.insertSchoolLeave", vo);
	}
	//학기 등록
	@Override
	public int insertStudentState(AdStdVO vo) {
		return sqlSession.insert("com.spring.project.admin.dao.AdminDAO.insertStudentState", vo);
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
	@Override
	public List<Major> getMajors(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.getMajors", map);
	}
	
	@Override
	public int deleteMajor(Map<String, Object> map) {
		return sqlSession.update("com.spring.project.admin.dao.AdminDAO.deleteMajor", map);
	}
	@Override
	public int addMajor(Major major) {
		return sqlSession.insert("com.spring.project.admin.dao.AdminDAO.addMajor", major);
	}
	//---------------교직 업무 관리 END-------------------
}
