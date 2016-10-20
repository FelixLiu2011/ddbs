package com.ddas.common.util.jdbc;


import javax.sql.DataSource;
import java.sql.*;
import java.util.List;

/**
 * JDBC工具包
 * 
 * @author Administrator
 * 
 */
public class JDBCUtil {
	/** 控制类的实例数 */
	private JDBCUtil() {
	}

	/**
	 * 关闭连接
	 * 
	 * @param connection
	 *            数据库连接
	 * */
	public static void closeConnection(Connection connection) {
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 关闭PreparedStatement
	 * 
	 * @param preparedStatement
	 */
	public static void closePreparestament(PreparedStatement preparedStatement) {
		if (preparedStatement != null) {
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	/**
	 * 关闭CallStatement
	 * @param callableStatement
	 */
	public static void closePreparecall(CallableStatement callableStatement){
		if(callableStatement!=null){
			try {
				callableStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 关闭ResultSet
	 * 
	 * @param resultSet
	 */
	public static void closeResultSet(ResultSet resultSet) {
		if (resultSet != null) {
			try {
				resultSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 
	 * @param dataSource
	 * @return
	 */
	public static Connection getConnection(DataSource dataSource) {
		try {
			return dataSource == null ? null : dataSource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 返回resultSet
	 * 
	 * @param dataSource
	 * @param sql
	 * @param params
	 * @return
	 */
	public static ResultSet getResultSet(DataSource dataSource, String sql,
			Object... params) {
		Connection connection = getConnection(dataSource);
		PreparedStatement preparedStatement = getPreparedStatement(connection,
				sql, params);
		return getResultSet(preparedStatement);

	}

	public static PreparedStatement getPreparedStatement(Connection connection,
			String sql, Object... params) {
		try {
			if (connection != null) {
				PreparedStatement preparedStatement = connection
						.prepareStatement(sql);
				if(params!=null&&params.length>0){
					for (int i = 0; i < params.length; i++) {
						preparedStatement.setObject(i + 1, params[i]);
					}
				}
				return preparedStatement;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static ResultSet getResultSet(PreparedStatement preparedStatement) {
		try {
			return preparedStatement == null ? null : preparedStatement
					.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 解析ResultSet
	 * 
	 * @param dataSource
	 * @param sql
	 * @param clazz
	 * @param params
	 * @return
	 */
	public static <T> List<T> parseResultSet(DataSource dataSource, String sql,
			Class<T> clazz, Object... params) {
		if (dataSource == null) {
			return null;
		}
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection(dataSource);
			preparedStatement = getPreparedStatement(connection, sql, params);
			resultSet = preparedStatement.executeQuery();
			List<T> list = AutomaticSetProperty.parseProperties(resultSet,
					clazz);
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeResultSet(resultSet);
			closePreparestament(preparedStatement);
			closeConnection(connection);
		}
		return null;
	}

}
