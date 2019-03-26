package model.myPage;

import java.util.ArrayList;

import model.dataObject.ItemDO;
import model.dataObject.MemberDO;

public class MyPageSO {
	MyPageDAO dao;
	public MyPageSO() {
		dao = new MyPageDAO();
		// TODO Auto-generated constructor stub
	}
	
	public ArrayList<ItemDO> getSaleList(String id) {
		return this.dao.selectSaleItem(id);
	}
	public ArrayList<ItemDO> getInterestList(String id) {
		return this.dao.selectInterestItem(id);
	}
	public ArrayList<ItemDO> getShareList(String id) {
		return this.dao.selectShareItem(id);
	}
	public MemberDO getMember(String id) {
		return this.dao.selectMemberInfo(id);
	}
	
	
}
