package com.trism.jesica.dto;

import java.time.LocalDateTime;

public interface TbCustLocationDTO {

    Long getCustNo();

    String getAddr1();

    String getCodeName1();

    String getAddr2();

    String getCodeName2();

    LocalDateTime getInsertDate();

    LocalDateTime getUpdateDate();

}
