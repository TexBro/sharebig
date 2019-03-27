package model.detail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.dataObject.ItemCommentDO;
import model.dataObject.ItemDO;
import model.dataObject.MemberDO;

public class DetailDAO {
	private DataSource ds;
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public DetailDAO() {
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
	
	
	public ItemDO selectItemDetail(int item_id ) {
		ItemDO itemDO= new ItemDO();

		try {
			String sql = "select category.cata_name , item.register_type, item.item_type, item.item_name,item.price,item.item_info,item.item_file,item.member_no"
						+" from item, category"
					    +" where category.cata_no=item.cata_no and item.item_no = ?";
					

			this.conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, item_id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				itemDO.setCata_name(rs.getString(1));
				itemDO.setRegister_type(rs.getInt(2));
				itemDO.setItem_type(rs.getInt(3));
				itemDO.setItem_name(rs.getString(4));
				itemDO.setPrice(rs.getInt(5));
				itemDO.setItem_info(rs.getString(6));
				itemDO.setItem_file(rs.getString(7));
				itemDO.setMember_no(8);
				
			}
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
		
		return itemDO;
	}
	public ArrayList<ItemCommentDO> selectComment(int item_id ) {
		 ArrayList<ItemCommentDO> commentlist= new ArrayList<ItemCommentDO>();

		try {
			
			String sql= "select item_comment.comment_date,item_comment.comment_info,item_comment.member_no,member_no.member_name"
					   +" from item_comment left outer join member_no"
					   +" on item_comment.member_no=member_no.member_no"
					   +" where item_comment.item_no = ?"
					   +" order by item_comment.comment_date";
		
		

			this.conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, item_id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ItemCommentDO itemcomt = new ItemCommentDO();
				itemcomt.setComment_date(rs.getDate(1));
				itemcomt.setComment_info(rs.getString(2));
				itemcomt.setMember_no(rs.getInt(3));
				itemcomt.setMember_name(rs.getString(4));

				commentlist.add(itemcomt);
				
			}
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
		
		return commentlist;
	}
	
}
