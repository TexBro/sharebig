package model.login;

import model.DO.LoginDO;
import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;

public class LoginDAO {

	private DataSource ds;
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public LoginDAO() {
		try {
			Context initContext = new InitialContext();
			this.ds = (DataSource) initContext.lookup("java:/comp/env/jdbc/oracle");
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public int selectUser(LoginDO loginDO) {
		int count = 0;
		try {
			String sql = "select id,passwd from member where id = ? and passwd = ?";

			this.conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginDO.getUserid());
			pstmt.setString(2, loginDO.getPasswd());

			count = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		return count;
	}
/*
	public ArrayList<LoginDO> selectAllJdbcTest() {
		ArrayList<LoginDO> list = new ArrayList<LoginDO>();

		LoginDO jdbcTestDO = null;
		String sql = "select * from jdbc_test";

		try {
			this.conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				jdbcTestDO = new LoginDO();
				jdbcTestDO.setUsername(rs.getString("username"));
				jdbcTestDO.setEmail(rs.getString("email"));

				list.add(jdbcTestDO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.rs.close();
				this.stmt.close();
				this.conn.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		return list;
	}*/

}
