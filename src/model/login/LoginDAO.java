package model.login;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.*;

import model.dataObject.*;

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

	public void setAutoCommit(boolean commit) {
		try {
			this.conn = ds.getConnection();
			this.conn.setAutoCommit(commit);
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				this.conn.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}

	public void commit() {
		try {
			this.conn = ds.getConnection();
			conn.commit();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				this.conn.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}

	public void rollback() {
		try {
			this.conn = ds.getConnection();
			conn.rollback();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				this.conn.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}

	public int login(LoginDO loginDO) {

		int count = 0;

		String sql = "select * from member where id=? and passwd=?";
		try {

			this.conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginDO.getUserid());
			pstmt.setString(2, loginDO.getPasswd());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				count = 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.rs.close();
				this.pstmt.close();
				this.conn.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		System.out.println(count);
		return count;
	}

	public int checkMember(MemberNoDO memberNoDO) {

		int count = 0;

		String sql = "select * from member_no where member_name = ? and member_no = ? ";
		try {

			this.conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberNoDO.getMember_name());
			pstmt.setInt(2, memberNoDO.getMember_no());

			System.out.println(memberNoDO.getMember_name());
			System.out.println(memberNoDO.getMember_no());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				count = 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.rs.close();
				this.pstmt.close();
				this.conn.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		System.out.println(count);
		return count;
	}
}