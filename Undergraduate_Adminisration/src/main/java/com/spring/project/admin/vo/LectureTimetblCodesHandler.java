package com.spring.project.admin.vo;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

import oracle.jdbc.driver.OracleConnection;
import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;

@SuppressWarnings("deprecation")
public class LectureTimetblCodesHandler implements TypeHandler<Object> {

	@Override
	public Object getResult(ResultSet rs, String columnName) throws SQLException {
		return rs.getInt(columnName);
	}

	@Override
	public Object getResult(ResultSet rs, int columnIndex) throws SQLException {
		return rs.getInt(columnIndex);
	}

	@Override
	public Object getResult(CallableStatement cs, int columnIndex) throws SQLException {
		return cs.getInt(columnIndex);
	}

	@Override
	public void setParameter(PreparedStatement ps, int i, Object parameter, JdbcType jdbcType) throws SQLException {
		Connection conn = null;
		if(ps.getConnection().isWrapperFor(OracleConnection.class)) {
			conn = ps.getConnection().unwrap(OracleConnection.class);
		}
		
		ArrayDescriptor desc = ArrayDescriptor.createDescriptor("ARRAY_INT", conn);
		parameter = new ARRAY(desc, conn, (int[]) parameter);
		ps.setArray(i, (oracle.sql.ARRAY) parameter);
	}

}
