package model.main;

import java.util.ArrayList;

import model.dataObject.ItemDO;
import model.dataObject.ItemInterestDO;

public class MainSO {
	MainDAO dao;
	
	public MainSO() {
		dao=new MainDAO();
	}
	
	public ArrayList<ItemDO> getMainItemlist(String opt,int page){
		return this.dao.selectMainItemList(opt, page);
	}
	
	public ArrayList<ItemDO> getAllMainItemlist(int page){
		return this.dao.selectAllMainItemList(page);
	}
	public ArrayList<Integer> getInterestlist(String id){
		return this.dao.selectInterestlist(id);
	}
	
	public int  getCountItemList(String option){
		if(option == null) {
			return this.dao.countItemList();
		}
		else if(option.equals("sale")) {
			return this.dao.countItemList(1);
		}
		else {
			return this.dao.countItemList(2);
		}			
	}
	public boolean checkFavorite(int itemid,String id) {
		if(this.dao.selectFavorite(itemid,id)>=1) {
			return true;
		}
		return false;
	}
	public boolean removeFavorite(int itemid,String id) {
		dao.deleteFavorite(itemid,id);
		return true;
	}
public boolean addFavorite(int itemid,String id) {
		dao.addFavorite(itemid, id);
		return true;
	}
	
}
