package model.register;
import javax.servlet.http.HttpServletRequest;

import model.dataObject.FileUploadDO;
import model.dataObject.ItemDO;
import model.dataObject.MemberDO;

public class RegisterSO {
	private RegisterDAO dao;

	public RegisterSO() {
		this.dao = new RegisterDAO();
	}

	public boolean setUploadItem(ItemDO itemDO, MemberDO memberDO, FileUploadDO fileDO, HttpServletRequest request) 
	{
		boolean result = false;

		dao.setAutoCommit(false);

		if(this.dao.uploadItem(itemDO, memberDO, fileDO, request) == 2) {
			dao.commit();
			result=true;
		} else {
			dao.rollback();
		}

		return result;	
	}


}
