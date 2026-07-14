package com.trism.jesica.persistence.mysql.Entitiy.common;

import com.trism.jesica.persistence.mysql.Entitiy.business.TbUserStaff;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
public class LoginSession implements Serializable {
	private static final long serialVersionUID = 1L;
	public static final String KEY = "sessionKey";

	private int userStaffNo;
	private String userStaffName;
	private String userLoginId;
	private Integer userId;
	private Integer userRole;
	private Integer userDataStatus;
	private Integer headNo;
	private Integer branchNo;
	private Integer storeNo;
	private String loginKey;
	private Integer roleType;
	private Integer userType;
	private LocalDateTime insertTime;
	private String company;
	private String appCode;
	private String appCodeName;


	public static LoginSession from(TbUserStaff tbUserStaff, String appCodeName) {
		LoginSession session = new LoginSession();
		session.setUserStaffNo(tbUserStaff.getUserNo().intValue());
		session.setUserStaffName(tbUserStaff.getName());
		session.setUserLoginId(tbUserStaff.getUserId());
		session.setHeadNo(tbUserStaff.getHeadNo());
		session.setBranchNo(tbUserStaff.getBranchNo());
		session.setStoreNo(tbUserStaff.getStoreNo());
		session.setUserDataStatus(tbUserStaff.getDataStatus().ordinal());
		session.setInsertTime(tbUserStaff.getInsertDate());
		session.setRoleType(tbUserStaff.getRoleType());
		session.setUserType(tbUserStaff.getUserType().ordinal());
		session.setCompany("yangpa");
		session.setAppCode(tbUserStaff.getAppCode());
		session.setAppCodeName(appCodeName);
		return session;
	}
}
