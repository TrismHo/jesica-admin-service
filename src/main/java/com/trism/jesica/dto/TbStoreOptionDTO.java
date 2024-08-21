package com.trism.jesica.dto;

import com.trism.jesica.persistence.mysql.type.DataStatus;

public interface TbStoreOptionDTO {


     Long  getStoreOptNo();

     Integer getStoreNo();

     DataStatus getDataStatus();

     String getOptName();

     Boolean getMandatoryYn();

     Integer getMinSelectCnt();

     Integer getMaxSelectCnt();

}
