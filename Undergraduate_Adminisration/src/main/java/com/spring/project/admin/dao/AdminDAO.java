package com.spring.project.admin.dao;

import org.springframework.stereotype.Repository;

import com.spring.project.admin.vo.AdStdVO;

@Repository
public interface AdminDAO {
	//학생등록 처리페이지
	public int insertUsers(AdStdVO vo);
	public int insertAuthority(AdStdVO vo);
	public int insertStudent(AdStdVO vo);
	public int insertStdState(AdStdVO vo);
	public int insertMajor(AdStdVO vo);
	public int insertSchoolLeave(AdStdVO vo);
	public int insertFaculty(AdStdVO vo);
}
