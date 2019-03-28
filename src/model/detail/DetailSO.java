package model.detail;

import java.util.ArrayList;

import com.sun.javafx.collections.MappingChange.Map;

import javafx.util.Pair;
import model.dataObject.*;
public class DetailSO {

	DetailDAO dao = null;
	public DetailSO() {
		dao= new DetailDAO();
	}
	public ItemDO getBasicItemInfo(int item_id) {
		return this.dao.selectItemDetail(item_id);
	}
	public ItemDO getDetailItemInfo(ItemDO itemDO) {
		return itemDO;
	}

	public ArrayList<ItemCommentDO> getItemComment(int item_id) {
		return dao.selectComment(item_id);
	}
	
	public boolean takeItem(ItemDO itemDO) {
		if(itemDO.getRegister_type() == 2) {
			return dao.insertStartEndDate(itemDO);
		}
		else
			return dao.updateItemRegistType(itemDO);
	}
	//Map<E, F>
	public ArrayList<Pair<String, String> > getReservedTime(int item_id){
	
		return null;
	}
}
