package com.trism.jesica.dto;

import com.trism.jesica.persistence.Entitiy.business.TbDelivery;
import com.trism.jesica.persistence.type.DataStatus;
import lombok.Data;

import java.time.LocalDateTime;


@Data
public class TbDeliveryData {

    private Long dlvyNo;

    private String insertUserId;
    private String updateUserId;
    private Integer headNo;
    private Integer branchNo;
    private Integer storeNo;

    private LocalDateTime updateDate;
    private LocalDateTime insertDate;
    private DataStatus dataStatus;
    private String dlvyName;
    private Integer dlvyGroupType;
    private Integer openStatus;
    private Integer openTimeYn;
    private String openTimeStart;
    private String openTimeEnd;

    private Integer delayTime;
    private Integer priceChargeNo;
    private Integer weatherChargeYn;
    private Integer weatherCharge;
    private Integer mngPrice;
    private Integer mngRateType;
    private Integer mngRatePlatform;
    private Integer mngRateGive;
    private Integer mngRateAccept;


    public TbDelivery insertData() {
        return TbDelivery.builder()
                .dlvyNo(this.dlvyNo)
                .insertUserId(this.insertUserId)
                .updateUserId(this.updateUserId)
                .headNo(this.headNo)
                .branchNo(this.branchNo)
                .storeNo(this.storeNo)
                .dataStatus(this.dataStatus)
                .openStatus(this.openStatus)
                .dlvyName(this.dlvyName)
                .dlvyGroupType(this.dlvyGroupType)
                .openTimeYn(this.openTimeYn)
                .openTimeStart(this.openTimeStart)
                .openTimeEnd(this.openTimeEnd)
                .delayTime(this.delayTime)
                .priceChargeNo(this.priceChargeNo)
                .weatherChargeYn(this.weatherChargeYn)
                .weatherCharge(this.weatherCharge)
                .mngPrice(this.mngPrice)
                .mngRateType(this.mngRateType)
                .mngRatePlatform(this.mngRatePlatform)
                .mngRateGive(this.mngRateGive)
                .mngRateAccept(this.mngRateAccept)
                .build();
    }
}
