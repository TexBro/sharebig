package model.dataObject;

import java.sql.Date;

public class ItemCommentDO {
	private int comment_no;
	private int item_no;
	private Date comment_date;
	private String comment_info;
	private int member_no;
	
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	public String getComment_info() {
		return comment_info;
	}
	public void setComment_info(String comment_info) {
		this.comment_info = comment_info;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	
	
}
