package com.spring.project.share.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.session.SqlSession;

import com.spring.project.restful.vo.Message;
import com.spring.project.share.vo.Major;
import com.spring.project.share.vo.ShareUserInfo;

public interface ShareDAO {
	public ShareUserInfo getStudentInfo(String userNumber);
	public ShareUserInfo getEmployeeInfo(String userNumber);
	public int messageTotalCnt(Map<String, Object> map);
	public List<Message> getMessages(Map<String, Object>map);
	public List<String> getFacultys();
	public int getMajorCurrval();
	public List<Major> getMajors(Map<String, Object> map);
	
	public static String getQuery(SqlSession sqlSession, String queryId, Object sqlParam) {
		BoundSql boundSql = sqlSession.getConfiguration().getMappedStatement(queryId).getSqlSource()
				.getBoundSql(sqlParam);
		String query1 = boundSql.getSql();

		Object paramObj = boundSql.getParameterObject();

		if (paramObj != null) { // 파라미터가 아무것도 없을 경우
			List<ParameterMapping> paramMapping = boundSql.getParameterMappings();
			for (ParameterMapping mapping : paramMapping) {
				String propValue = mapping.getProperty();
				query1 = query1.replaceFirst("\\?", "#{" + propValue + "}");
			}
		}
		return query1;
	}
}
