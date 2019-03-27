package model.dataObject;

import java.sql.Date;

public class ItemDO {
	private int item_no;
	private int cata_no;
	private int member_no;
	
	private int register_type;
	private int item_type;
	private String item_name;
	private int price;
	private String item_info;
	private String item_file;

	private String cata_name;
	private Date sale_date;
	private Date start_date;
	private Date end_date;
	private Date share_final_date;
	
	public Date getShare_final_date() {
		return share_final_date;
	}
	public void setShare_final_date(Date share_final_date) {
		this.share_final_date = share_final_date;
	}

	public Date getSale_date() {
		return sale_date;
	}
	public void setSale_date(Date sale_date) {
		this.sale_date = sale_date;
	}

	public String getCata_name() {
		return cata_name;
	}
	public void setCata_name(String cata_name) {
		this.cata_name = cata_name;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public int getCata_no() {
		return cata_no;
	}
	public void setCata_no(int cata_no) {
		this.cata_no = cata_no;
	}
	public int getRegister_type() {
		return register_type;
	}
	public void setRegister_type(int register_type) {
		this.register_type = register_type;
	}
	public int getItem_type() {
		return item_type;
	}
	public void setItem_type(int item_type) {
		this.item_type = item_type;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getItem_info() {
		return item_info;
	}
	public void setItem_info(String item_info) {
		this.item_info = item_info;
	}
	public String getItem_file() {
		return item_file;
	}
	public void setItem_file(String item_file) {
		this.item_file = item_file;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	

}
