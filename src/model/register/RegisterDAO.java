package model.register;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;
import javax.websocket.Session;

import model.dataObject.FileUploadDO;
import model.dataObject.ItemDO;
import model.dataObject.MemberDO;

public class RegisterDAO {
	private DataSource ds;
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private PreparedStatement pstmt2;
	private PreparedStatement pstmt3;
	private PreparedStatement pstmt4;
	
	private ResultSet rs;
	
	public RegisterDAO() {
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

	public int uploadItem(ItemDO itemDO, MemberDO memberDO, FileUploadDO fileDO, HttpServletRequest request
) {
		int result = 0;
		
		int count = 0;
		int count2 =0;
		int count3 =0;
		//file
		int count4=0;
		
		try {
			String sql = "insert into item (register_type, item_no, item_type, item_name"
					+ ", price, item_info, item_file, cata_no, member_no)"
					+ " values(?,item_no_seq.nextval,?,?,?,?,?,?,(select member_no from member where id = ?))";
			//register_type item_no item_type item_name price item_info item_file cata_no member_no
			this.conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			//System.out.println(itemDO.getRegister_type());
			
			pstmt.setInt(1, itemDO.getRegister_type());
			pstmt.setInt(2, itemDO.getItem_type());
			pstmt.setString(3, itemDO.getItem_name());
			pstmt.setInt(4, itemDO.getPrice());
			pstmt.setString(5,itemDO.getItem_info());
			//pstmt.setString(6, itemDO.getItem_file());
			
			pstmt.setString(6, fileDO.getSysName());
			pstmt.setInt(7, itemDO.getCata_no());
			pstmt.setString(8,itemDO.getId());
			//session
			System.out.println("REGITYPE : "+ itemDO.getRegister_type());
			
			count = pstmt.executeUpdate();
			
			if(itemDO.getRegister_type() ==1) {
				System.out.println("register type 판매 1로 들어옴");
				String sql2="insert into item_sale (register_type, item_sale_no, item_no)"
						+ " values(1,item_sale_no_seq.nextval,item_no_seq.currval)";
			//register_type item_sale_no item_no
				pstmt2 = conn.prepareStatement(sql2);
				System.out.println("sql2 실행 OK");
				count2 = pstmt2.executeUpdate(); 
			}
			
			else if(itemDO.getRegister_type()==2) {
				System.out.println("register type 공유2로 들어옴");
				String sql3="insert into item_share(register_type, item_share_no, share_final_date, item_no)"
						+ " values(?,item_share_no_seq.nextval,to_date(?,'yyyy-mm-dd'),item_no_seq.currval)";
			//register_type item_share_no share_final_date item_no
				pstmt3 = conn.prepareStatement(sql3);
				System.out.println("sql3 실행 OK");
				System.out.println(itemDO.getShare_final_date());
				pstmt3.setInt(1, 2);
				pstmt3.setString(2, itemDO.getShare_final_date());
				count3 = pstmt3.executeUpdate();
			}
			
			try {

				String sql4 = "insert into fileUpload values (?,?,?)";
				pstmt4 = conn.prepareStatement(sql4);
				pstmt4.setString(1, itemDO.getItem_name());
				pstmt4.setString(2, fileDO.getSysName());
				pstmt4.setString(3, fileDO.getOrgName());
				count4 = pstmt4.executeUpdate();


				} catch (Exception e1) {
				e1.printStackTrace();
				System.out.println("파일업로드 에러 "+ e1);
				}
			
			result = count + count2 + count3;
			
			System.out.println("count : "+count);
			System.out.println("count2 : "+count2);
			System.out.println("count3 : "+count3);
			System.out.println("count4 : "+count4);
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				this.pstmt.close();
				this.pstmt2.close();
				this.pstmt3.close();
				this.pstmt4.close();
				this.conn.close();
			}
			catch(Exception e) {
				System.out.println(e);
			}
		}
	return result;
	}
	
}
