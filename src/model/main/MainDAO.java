package model.main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.dataObject.ItemDO;
import model.dataObject.ItemInterestDO;

public class MainDAO {
	static final int MAX_ITEM_NUM=9;
	private DataSource ds;
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
		public MainDAO() {
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
		public int deleteFavorite(int itemid,String id) {
			int count=0;
			try {
				String sql="delete from interest_info where member_no=(select member_no from member where id = ?) and item_no=?";

				this.conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, id);
				pstmt.setInt(2, itemid);
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
		
		public int addFavorite(int itemid,String id) {
			int count=0;
			try {
				String sql="insert into interest_info(item_interest_no,item_no,member_no) "
						+ " values (INTEREST_INFO_SEQ.NEXTVAL, ? ,(select member_no from member where id = ?))";

				this.conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, itemid);
				pstmt.setString(2,id);
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
		public int selectFavorite(int itemid,String id) {
			int count=0;
			try {
				String sql="select * "
						+ " from interest_info "
						+ " where item_no=? and member_no= "
						+ " (select member_no from member where id=?)";

				this.conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, itemid);
				pstmt.setString(2, id);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					count++;
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
			return count;
		}
		public ArrayList<ItemDO> selectMainItemList(String opt, int page ) {
			ArrayList<ItemDO> itemlist = new ArrayList<ItemDO>();
			int start_row = (page-1)*MAX_ITEM_NUM +1;
			int end_row = page*MAX_ITEM_NUM ;
			int register_type =1;
			
			if(opt.equals("sale")) {
				register_type =1;
			}
			else if (opt.equals("rent")) {
				register_type=2;
			}
			
			try {
				String sql="select * from "
						+"(select category.cata_name , item.register_type, item.item_type, item.item_name,item.price,item.item_info,item.item_file,item.member_no,item.item_no,rownum rnum "
						+"from item, category "	
						+"where item.cata_no = category.cata_no and item.register_type = ?) "
						+"where rnum between ? and ? ";

				this.conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, register_type);
				pstmt.setInt(2, start_row);
				pstmt.setInt(3, end_row);
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					ItemDO itemDO= new ItemDO();
					itemDO.setCata_name(rs.getString(1));
					itemDO.setRegister_type(rs.getInt(2));
					itemDO.setItem_type(rs.getInt(3));
					itemDO.setItem_name(rs.getString(4));
					itemDO.setPrice(rs.getInt(5));
					itemDO.setItem_info(rs.getString(6));
					itemDO.setItem_file(rs.getString(7));
					itemDO.setMember_no(rs.getInt(8));
					itemDO.setItem_no(rs.getInt(9));
					itemlist.add(itemDO);
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
			
			return itemlist;
		}
		public ArrayList<ItemDO> selectAllMainItemList(int page ) {
			ArrayList<ItemDO> itemlist = new ArrayList<ItemDO>();
			int start_row = (page-1)*MAX_ITEM_NUM +1;
			int end_row = page*MAX_ITEM_NUM ;
			
			try {
							
				String sql="select * from" + 
						"	 (select category.cata_name , item.register_type, item.item_type, item.item_name,item.price,item.item_info,item.item_file,item.member_no, item.item_no,rownum rnum" + 
						"	from item, category" + 
						"	where item.cata_no = category.cata_no and item.register_type != 3)" + 
						" where rnum between ? and ?";
				
				this.conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, start_row);
				pstmt.setInt(2, end_row);
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					ItemDO itemDO= new ItemDO();
					itemDO.setCata_name(rs.getString(1));
					itemDO.setRegister_type(rs.getInt(2));
					itemDO.setItem_type(rs.getInt(3));
					itemDO.setItem_name(rs.getString(4));
					itemDO.setPrice(rs.getInt(5));
					itemDO.setItem_info(rs.getString(6));
					itemDO.setItem_file(rs.getString(7));
					itemDO.setMember_no(rs.getInt(8));
					itemDO.setItem_no(rs.getInt(9));
					itemlist.add(itemDO);
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
			
			return itemlist;
		}
		public int countItemList(int i) {
			int row_count=0;
			
			try {
				String sql="select count(item_no) from item where register_type= ? ";
				
				this.conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,i);
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					row_count=rs.getInt(1);
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
			
			return row_count;
		}
		public int countItemList() {
			int row_count=0;
			
			try {
				String sql="select count(item_no) from item where register_type=1 or register_type = 2 ";
				
				this.conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					row_count=rs.getInt(1);
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
			
			return row_count;
		}

		public ArrayList<Integer> selectInterestlist(String id) {
			ArrayList<Integer> interestlist = new ArrayList<Integer>();
			try {
							
				String sql="select item_no from interest_info where member_no = (select member_no from member where member.id =?)";
				
				this.conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1,id );
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					interestlist.add(rs.getInt(1));
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
			
			return interestlist;
		}
		
		
}
