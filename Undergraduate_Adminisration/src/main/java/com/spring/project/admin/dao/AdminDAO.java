package com.spring.project.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.spring.project.admin.vo.AdProVO;
import com.spring.project.admin.vo.AdStdVO;
import com.spring.project.admin.vo.ScholarpkVO;
import com.spring.project.admin.vo.auditVO;
import com.spring.project.share.vo.Major;


@Repository
public interface AdminDAO {
	//학생등록 처리페이지
	public int insertUsers(AdStdVO vo);
	public int insertStudent(AdStdVO vo);
	public int insertMajor(AdStdVO vo);
	public int insertSchoolLeave(AdStdVO vo);
	public int insertStudentState(AdStdVO vo);
	public int insertFaculty(AdStdVO vo);
	
	//학생 리스트
	public List<AdStdVO> getStdList(Map<String, Integer> map);
	
	//교수 리스트
	public List<AdProVO> getProList(Map<String, Integer> map);
	
	//장학글 갯수
	public int getArticleCnt();
	
	//장학 글 목록
	public List<ScholarpkVO> getArticleList(Map<String,Object> map);
	
	//장학 글 추가 
	public int insertjangjag(ScholarpkVO vo);
	
	//장학 글 상세 
	public ScholarpkVO getArticle(int scholarpk); 
	
	//장학글 삭제
	public int delete(String[] checkbox);
	
	//장학글 심사
	public List<auditVO> auditCnt();
	
	public List<Major> getMajors(Map<String, Object> map);
}
