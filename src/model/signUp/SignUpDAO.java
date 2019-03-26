package model.signUp;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.*;

import model.dataObject.*;
public class SignUpDAO {
	private DataSource ds;
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public SignUpDAO() {
		try{
			Context initContext = new InitialContext();
	        this.ds = (DataSource)initContext.lookup("java:/comp/env/jdbc/oracle");
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
	
	public void setAutoCommit(boolean commit) {
		try {
			this.conn = ds.getConnection();
			this.conn.setAutoCommit(commit);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		finally {
			try {
				this.conn.close();
			}
			catch(Exception e) {
				System.out.println(e);
			}
		}
	}
	
	public void commit() {
		try {
			this.conn = ds.getConnection();
			conn.commit();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		finally {
			try {
				this.conn.close();
			}
			catch(Exception e) {
				System.out.println(e);
			}
		}
	}
	
	public void rollback() {
		try {
			this.conn = ds.getConnection();
			conn.rollback();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		finally {
			try {
				this.conn.close();
			}
			catch(Exception e) {
				System.out.println(e);
			}
		}
	}
	
	public int signUp(MemberDO memberDO) {
		int count = 0;
		
		try {
			String sql = "insert into member values (201904,?,?,?,?,?)";
//			String sql = "insert into member values('201901',?,?,-1234-1234','hong@naver.com','1')";
//			String sql = "insert into member_test values(?)";
			
			this.conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberDO.getId());
			pstmt.setString(2, memberDO.getPw());
			pstmt.setString(3, memberDO.getHp());
			pstmt.setString(4, memberDO.getEmail());
			pstmt.setInt(5, memberDO.getDept_no());
			
			count = pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				this.pstmt.close();
				this.conn.close();
			}
			catch(Exception e) {
				System.out.println(e);
			}
		}
		
		
		return count;
	}
}
