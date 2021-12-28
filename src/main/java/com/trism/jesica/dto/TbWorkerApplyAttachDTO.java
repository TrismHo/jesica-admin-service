package com.trism.jesica.dto;


import java.time.LocalDateTime;

public interface TbWorkerApplyAttachDTO {

     Integer getAttachNo();

     Integer getApplyNo();

     Integer getApplyAttachType();

     Integer getAuthStatus();

     String getUpdateUserId();

     String getUploadFile();

     String getParam1();

     String getParam2();

     String getParam3();

     LocalDateTime getInsertDate();
     LocalDateTime getUpdateDate();
}