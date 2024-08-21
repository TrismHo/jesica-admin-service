package com.trism.jesica.dto;

import com.trism.jesica.persistence.mysql.Entitiy.coupon.TbCoupon;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class TbCouponData {

    private Long couponNo;
    private String insertUserId;
    private String updateUserId;
    private Integer serviceType;
    private String orderTypeCode;
    private Integer validityType;
    private LocalDateTime expireDate;
    private Integer validDay;
    private LocalDateTime publishStartDate;
    private LocalDateTime publishEndDate;
    private Integer dcRateType;
    private Integer dcAmt;
    private Integer maxDcAmt;
    private Integer minPayAmt;
    private Integer maxPublishCount;
    private Integer multiPublishCount;
    private String couponCode;
    private String title;
    private String body;

    public TbCoupon insertData() {

        return TbCoupon.builder()
                .insertUserId(insertUserId)
                .serviceType(serviceType)
                .orderTypeCode(orderTypeCode)
                .validityType(validityType)
                .expireDate(expireDate)
                .validDay(validDay)
                .publishStartDate(publishStartDate)
                .publishEndDate(publishEndDate)
                .dcRateType(dcRateType)
                .dcAmt(dcAmt)
                .maxDcAmt(maxDcAmt)
                .minPayAmt(minPayAmt)
                .maxPublishCount(maxPublishCount)
                .multiPublishCount(multiPublishCount)
                .couponCode(couponCode)
                .title(title)
                .body(body)
                .build();
    }

    public TbCoupon updateData() {

        return TbCoupon.builder()
                .couponNo(couponNo)
                .insertUserId(insertUserId)
                .updateUserId(updateUserId)
                .serviceType(serviceType)
                .orderTypeCode(orderTypeCode)
                .validityType(validityType)
                .expireDate(expireDate)
                .validDay(validDay)
                .publishStartDate(publishStartDate)
                .publishEndDate(publishEndDate)
                .dcRateType(dcRateType)
                .dcAmt(dcAmt)
                .maxDcAmt(maxDcAmt)
                .minPayAmt(minPayAmt)
                .maxPublishCount(maxPublishCount)
                .multiPublishCount(multiPublishCount)
                .couponCode(couponCode)
                .title(title)
                .body(body)
                .build();
    }
}
