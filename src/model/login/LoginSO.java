package model.login;

import model.dataObject.*;

public class LoginSO {
	private LoginDAO dao;
	
	public LoginSO() {
		this.dao = new LoginDAO();
	}
	
	public boolean checkLogin(LoginDO loginDO) {
		boolean result = false;
		
		dao.setAutoCommit(false);
		
		if(loginDO.getUserid()!=null && loginDO.getPasswd()!=null) {
			if(this.dao.login(loginDO) != 0) {
				//dao.commit();
				result = true;
			} else {
				//dao.rollback();
			}
		}
		
		return result;
	}
}
