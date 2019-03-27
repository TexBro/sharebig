package model.myPage;

import model.dataObject.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.*;

public class MyPageDAO {

		private DataSource ds;
		private Connection conn;
		private Statement stmt;
		private PreparedStatement pstmt;
		private ResultSet rs;
		
		public MyPageDAO() {
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
		
		public MemberDO selectMemberInfo(String id) {

			MemberDO memberDO= new MemberDO();
			try {
				String sql = "select member_no.member_name, member.hp, member.email,dept.dept_name" + 
								" from member ,dept, member_no " + 
								" where dept.dept_no = member.dept_no and member_no.member_no=member.member_no and member.id=?";
				
				this.conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				rs.next();	
				memberDO.setMember_name(rs.getString(1));
				memberDO.setHp(rs.getString(2));
				memberDO.setEmail(rs.getString(3));
				memberDO.setDept_name(rs.getString(4));
			
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
			
			
			return memberDO;
		}
		
		public ArrayList<ItemDO> selectSaleItem(String id) {
			
			ArrayList<ItemDO> saleItemList= new ArrayList<ItemDO>();
			//ItemDO itemDo= new ItemDO();
			try {
				String sql = "select category.cata_name, item.register_type, item.item_type,item.item_name,item.price, item.item_info,item.item_file,sale_info.sale_date,item.item_no"
							+" from item, item_sale,sale_info,category"
							+" where item.cata_no=category.cata_no and"
							+ 	" item.item_no = item_sale.item_no and"
							+ 	" item_sale.item_sale_no=sale_info.item_sale_no and "
							+ 	" item.member_no=(select member_no from member where id=?)";
						

				this.conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
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
					itemDO.setSale_date(rs.getDate(8));
					itemDO.setItem_no(rs.getInt(9));
					saleItemList.add(itemDO);
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
			
			return saleItemList;
		}
		
	public ArrayList<ItemDO> selectShareItem(String id) {

		ArrayList<ItemDO> shareItemList = new ArrayList<ItemDO>();
		// ItemDO itemDo= new ItemDO();
		try {
			String sql= "select category.cata_name, item.register_type, item.item_type,item.item_name,item.price, item.item_info,item.item_file,item_share.share_final_date, item.item_no"
					+" from item,item_share,category"
			        +" where item.member_no=(select member_no from member where id=?)"
					+"        and item.item_no= item_share.item_no"
			        +"        and item.cata_no= category.cata_no";
			
			this.conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				ItemDO itemDO = new ItemDO();

				itemDO.setCata_name(rs.getString(1));
				itemDO.setRegister_type(rs.getInt(2));
				itemDO.setItem_type(rs.getInt(3));
				itemDO.setItem_name(rs.getString(4));
				itemDO.setPrice(rs.getInt(5));
				itemDO.setItem_info(rs.getString(6));
				itemDO.setItem_file(rs.getString(7));
				itemDO.setShare_final_date(rs.getDate(8));
				itemDO.setItem_no(rs.getInt(9));
				
				shareItemList.add(itemDO);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.pstmt.close();
				this.conn.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		return shareItemList;
	}
	
	public ArrayList<ItemDO> selectInterestItem(String id) {

		ArrayList<ItemDO> intItemList = new ArrayList<ItemDO>();
		// ItemDO itemDo= new ItemDO();
		try {
			String sql ="select category.cata_name, item.register_type, item.item_type,item.item_name,item.price, item.item_info,item.item_file,item.item_no" 
						 +" from item,category"
					     +" where item.item_no in (select item_no from interest_info where interest_info.member_no= "
					     + "									(select member_no from member where id=?)) "
						 + " and item.cata_no = category.cata_no ";
			
			/*String sql = "select category.cata_name, item.register_type, item.item_type,item.item_name,item.price, item.item_info,item.item_file"
					+ " from item, item_share,interest_info,category" 
					+ " where item.cata_no=category.cata_no and"
					+ " item.item_no = interest_info.item_no and"
					+ " item.member_no=(select member_no from member where id=?)";
			 		*/
			this.conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				ItemDO itemDO = new ItemDO();

				itemDO.setCata_name(rs.getString(1));
				itemDO.setRegister_type(rs.getInt(2));
				itemDO.setItem_type(rs.getInt(3));
				itemDO.setItem_name(rs.getString(4));
				itemDO.setPrice(rs.getInt(5));
				itemDO.setItem_info(rs.getString(6));
				itemDO.setItem_file(rs.getString(7));
				itemDO.setItem_no(rs.getInt(8));
				
				intItemList.add(itemDO);
			}

		} 
		catch (Exception e) {
			
			e.printStackTrace();
		} 
		finally {
			try {
				this.pstmt.close();
				this.conn.close();
			} 
			catch (Exception e) {
				System.out.println(e);
			}
		}
		return intItemList;
	}
}

