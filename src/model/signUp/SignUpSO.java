package model.signUp;

import java.util.*;
import model.dataObject.*;

public class SignUpSO {
	private SignUpDAO dao;
	
	public SignUpSO() {
		this.dao = new SignUpDAO();
	}

	public boolean setSignUp(MemberDO memberDO) {
		boolean result = false;
		
		dao.setAutoCommit(false);
		
		if(memberDO.getId() != null) {
			if(this.dao.signUp(memberDO) == 1) {
				dao.commit();
				result = true;
			} else {
				dao.rollback();
			}
		}
		
		return result;
	}
}
