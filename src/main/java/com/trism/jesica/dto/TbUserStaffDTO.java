package com.trism.jesica.dto;

import java.time.LocalDateTime;

public interface TbUserStaffDTO {


    Long getStaffNo();
    String getUserId();
    String getInsertUserId();

    Integer getHeadNo();
    Integer getBranchNo();
    Integer getStoreNo();
    Integer getDataStatus();
    Integer getUserType();

    String getBlockTypeCode();
    String getName();
    String getPhone();
    String getMemo();
    Integer getRoleType();
    String getAppCode();
    String getAppName();

    LocalDateTime getUpdateDate();
    LocalDateTime getLastLoginDtm();
    LocalDateTime getInsertDate();


}
