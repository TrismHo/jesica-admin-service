package com.trism.jesica.dto;

import java.time.LocalDateTime;

public interface TbCustCouponDTO {

    Long getCouponNo();

    Integer getServiceType();

    String getOrderTypeCode();

    String getTitle();

    Integer getDcRateType();

    Integer getDcAmt();

    LocalDateTime getInsertDate();

    LocalDateTime getExpireDate();

    LocalDateTime getUseDate();

    Integer getUseYn();
}
