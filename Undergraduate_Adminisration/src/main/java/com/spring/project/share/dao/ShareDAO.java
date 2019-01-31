package com.spring.project.share.dao;

import com.spring.project.share.vo.ShareUserInfo;

public interface ShareDAO {
	public ShareUserInfo getStudentInfo(String userNumber);
	public ShareUserInfo getEmployeeInfo(String userNumber);
}
