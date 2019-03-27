package model.detail;

import java.util.ArrayList;

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
}
