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
import com.spring.project.admin.vo.lecMVO;
import com.spring.project.admin.vo.payrollVO;
import com.spring.project.share.dao.ShareDAO;
import com.spring.project.share.vo.Major;
import com.spring.project.student.vo.LectureVO;

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
	
	@Override
	public int insertProcedure(AdProVO vo) {
		return sqlSession.selectOne("com.spring.project.admin.dao.AdminDAO.insertProcedure", vo);
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
	public AdStdVO stdDetail(String userNumber) {
		return sqlSession.selectOne("com.spring.project.admin.dao.AdminDAO.stdDetail", userNumber);
	}
	
	//교수상세
	@Override
	public AdProVO proDetail(String userNumber) {
		return sqlSession.selectOne("com.spring.project.admin.dao.AdminDAO.proDetail", userNumber);
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

	//교수 이미지변경
	@Override
	public int proImgUpdate(AdProVO vo) {
		System.out.println(vo);
		
		int proImgUpdate=0;
		
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		
		proImgUpdate=dao.proImgUpdate(vo);
		
		System.out.println(proImgUpdate==1?"프로필 이미지 변경 성공!":"프로필 이미지 변경 실패!");
		
		return proImgUpdate;
	}
	
	//학생 이미지변경
	@Override
	public int stdImgUpdate(AdStdVO vo) {
		System.out.println(vo);
		
		int stdImgUpdate=0;
		
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		
		stdImgUpdate=dao.stdImgUpdate(vo);
		
		System.out.println(stdImgUpdate==1?"프로필 이미지 변경 성공!":"프로필 이미지 변경 실패!");
		
		return stdImgUpdate;
	}

	//학생+교수 삭제
	@Override
	public int stdDelete(String userNum) {
		return sqlSession.update("com.spring.project.admin.dao.AdminDAO.stdDelete", userNum);
	}
	
	//단과대 + 학과 리스트
	@Override
	public List<AdProVO> FandMList(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.FandMList", map);
	}
	
	//휴복학 리스트
	@Override
	public List<AdStdVO> getSchoolLeave(Map<String, Integer> map) {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.getSchoolLeave", map);
	}
	
	//전화번호부 가져오기
	@Override
	public List<String> getUserCellNumList(Map<String, Object> map){
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.getUserCellNumList", map);
	}
	
	
	//교수 - 강의목록
	@Override
	public List<AdProVO> proLectureList(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.proLectureList", map);	
	}

	//학생 - 신청과목
	@Override
	public List<AdStdVO> stdLectureList(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.stdLectureList", map);
	}
	
	//=============================장학금 대그니꺼=======================================
		//장학 글 갯수
		@Override
		public int Jang_getArticleCnt(Map<String,Object> map) {
			int selectCnt = sqlSession.selectOne("com.spring.project.admin.dao.AdminDAO.Jang_getArticleCnt",map);
			return selectCnt;
		}
		
		//장학 글 목록
		@Override
		public List<ScholarpkVO> jang_getArticleList(Map<String, Object> map) {
			List<ScholarpkVO> dtos = sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.jang_getArticleList",map);
			
			return dtos;
		}
		//장학 심사 갯수
		@Override
		public int audit_getArticleCnt(Map<String, Object> map) {
			int selectCnt = sqlSession.selectOne("com.spring.project.admin.dao.AdminDAO.audit_getArticleCnt",map);
			return selectCnt;
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
		public ScholarpkVO content_getArticle(int scholarpk) {
			ScholarpkVO dtos = sqlSession.selectOne("com.spring.project.admin.dao.AdminDAO.content_getArticle",scholarpk);
			return dtos;
		}
		//장학금 글 삭제
		@Override
		public int jang_delete(String[] checkbox) {
				
			int updateCnt = sqlSession.update("com.spring.project.admin.dao.AdminDAO.jang_delete",checkbox);
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
		
		@Override
		public List<auditVO> auditCnt2(int auditct) {
			System.out.println("111111111111");
			List<auditVO> dtos = sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.auditCnt2",auditct);
			
			return dtos;
		}
		//장학금 심사 합격 완료
		@Override
		public int auditupdate(String[] checkbox) {
			int auditupdateCnt = sqlSession.update("com.spring.project.admin.dao.AdminDAO.auditupdate",checkbox);
			return 0;
		}
		
		//장학금 심사 불합격 완료
		@Override
		public int auditupdate2(String[] checkbox) {
			int auditupdateCnt = sqlSession.update("com.spring.project.admin.dao.AdminDAO.auditupdate2",checkbox);
			return 0;
		}
		
		//장학금 심사 심사 완료
		@Override
		public int auditupdate3(String[] checkbox) {
			int auditupdateCnt = sqlSession.selectOne("com.spring.project.admin.dao.AdminDAO.auditupdate3",checkbox);
			return auditupdateCnt;
		}

	//-------------------------------------------------------------교직 업무 관리 START----------------------------------------------
	// 학과 리스트 갯수 구하기
	@Override
	public int majorListCount(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.project.admin.dao.AdminDAO.majorListCount", map);
	}
	
	// 학과 조회
	@Override
	public List<Object> majorList(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.majorList", map);
	}
	
	// 학과 폐지
	@Override
	public void deleteMajor(LectureVO lecture) {
		sqlSession.selectOne("com.spring.project.admin.dao.AdminDAO.deleteMajor", lecture);
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
	public List<Object> emptyLecTime(Map<String, Object>map) {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.emptyLecTime", map);
	}
	
	@Override
	public List<Object> getLecturesTimes(Map<String, Object>map) {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.getLecturesTimes", map);
	}
	
	@Override
	public int getLectureSeqNextval() {
		return sqlSession.selectOne("com.spring.project.admin.dao.AdminDAO.getLectureSeqNextval");
	}
	
	@Override
	public int getLectureCount(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.project.admin.dao.AdminDAO.getLectureCount");
	}
	@Override
	public List<Object> getLectureList(Map<String, Object> map) {
		//System.out.println(ShareDAO.getQuery(sqlSession, "getLectureList", map));
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.getLectureList", map);
	}
	

	@Override
	public int getProfessorCount(Map<String, Object> map) {
		System.out.println(ShareDAO.getQuery(sqlSession, "getProfessorCount", map));
		return sqlSession.selectOne("com.spring.project.admin.dao.AdminDAO.getProfessorCount",map);
	}
	@Override
	public List<Object> getProfessorList(Map<String, Object> map) {
		System.out.println(ShareDAO.getQuery(sqlSession, "getProfessorCount", map));
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.getProfessorList",map);
	}

	@Override
	public void addLecture(LectureVO lecture) {
		sqlSession.selectOne("com.spring.project.admin.dao.AdminDAO.addLecture", lecture);
	}

	@Override
	public LectureVO getLecture(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.project.admin.dao.AdminDAO.getLecture", map);
	}

	@Override
	public void modifyLecture(LectureVO lecture) {
		sqlSession.selectOne("com.spring.project.admin.dao.AdminDAO.modifyLecture", lecture);
	}

	@Override
	public int deleteLecture(Map<String, Object> map) {
		return sqlSession.update("com.spring.project.admin.dao.AdminDAO.deleteLecture", map);
	}
	
	//------------------------------------------------------교직 업무 관리 END----------------------------------------------------------
	
	//------------------------------------------------------회계 관리 START----------------------------------------------------------
	@Override
	public List<payrollVO> payrollList() {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.payrollList");
	}
	@Override
	public List<payrollVO> getFacultyList() {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.getFacultyList");
	}
	@Override
	public List<payrollVO> getPaymentClassfication() {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.getPaymentClassfication");
	}
	@Override
	public List<payrollVO> getFinalPayrollList() {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.getFinalPayrollList");
	}
	@Override
	public List<payrollVO> lookupWorkRecord(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.lookupWorkRecord", map);
	}
	@Override
	public List<payrollVO> getFacultyMajor() {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.getFacultyMajor");
	}
	@Override
	public List<payrollVO> accountFacultyList(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.accountFacultyList", map);
	}
	@Override
	public int insertPayroll(Map<String, Object> map) {
		return sqlSession.insert("com.spring.project.admin.dao.AdminDAO.insertPayroll", map);
	}
	
	@Override
	public int ConfirmationWorkRecord(List<Map<String, Object>> data) {
		return sqlSession.update("com.spring.project.admin.dao.AdminDAO.ConfirmationWorkRecord", data);
	}
	
	@Override
	public int updateOverPay(List<Map<String, Object>> data) {
		return sqlSession.update("com.spring.project.admin.dao.AdminDAO.updateOverPay", data);
	}

	@Override
	public int SaveEnterAmountManually(List<Map<String, Object>> data) {
		return sqlSession.update("com.spring.project.admin.dao.AdminDAO.SaveEnterAmountManually", data);
	}

	@Override
	public List<payrollVO> ConfirmOvertime(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.ConfirmOvertime", map);
	}

	@Override
	public int CopyPayroll(Map<String, Object> map) {
		return sqlSession.insert("com.spring.project.admin.dao.AdminDAO.CopyPayroll", map);
	}

	@Override
	public List<payrollVO> getEmpNumber() {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.getEmpNumber");
	}

	@Override
	public int CopyAllEmployeesDetail(List<payrollVO> empNumber) {
		return sqlSession.insert("com.spring.project.admin.dao.AdminDAO.CopyAllEmployeesDetail", empNumber);
	}


	//------------------------------------------------------회계 관리 END----------------------------------------------------------

	
	
	//---------------학사관리 START-------------------
	@Override
	public List<lecMVO> lecM() {
		return sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.lecM");
	}
	
	
	@Override
	public void delete_sc(lecMVO vo) {
		sqlSession.selectOne("com.spring.project.admin.dao.AdminDAO.delete_sc", vo);
	}
	
	//---------------학사관리 END---------------------

	
	
	
}
