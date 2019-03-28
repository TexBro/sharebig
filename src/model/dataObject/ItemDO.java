package model.dataObject;

import java.sql.Date;

public class ItemDO {
	private int item_no;
	private int cata_no;
	private int member_no;
	private String id;

	private int register_type;
	private int item_type;
	private String item_name;
	private int price;
	private String item_info;
	private String item_file;

	private String cata_name;
	private String sale_date;
	private String start_date;
	private String end_date;
	private String share_final_date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getShare_final_date() {
		return share_final_date;
	}
	public void setShare_final_date(String share_final_date) {
		this.share_final_date = share_final_date;
	}

	public String getSale_date() {
		return this.sale_date;
	}
	public void setSale_date(String sale_date) {
		this.sale_date = sale_date;
	}

	public String getCata_name() {
		return cata_name;
	}
	public void setCata_name(String cata_name) {
		this.cata_name = cata_name;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
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
	//public Date getShare_final_date() {



}
