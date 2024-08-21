package com.trism.jesica.dto;

import com.trism.jesica.persistence.mysql.Entitiy.storedlvy.TbStoreMngCharge;
import lombok.Data;


@Data
public class TbStoreMngChargeData {

    private Long storeNo;

    private Integer mngChargeYn;

    private Integer mngChargeType;

    private Integer mngTargetType;

    private Integer mngPrice;

    private String mngChargeStart;

    private Integer mngChargeDay;

    private Integer plfChargeYn;

    private Integer plfPrice;

    private String plfChargeStart;

    private Integer plfChargeDay;

    public TbStoreMngCharge insertData() {
        return TbStoreMngCharge.builder()
                .storeNo(this.storeNo)
                .mngChargeYn(this.mngChargeYn)
                .mngChargeType(this.mngChargeType)
                .mngTargetType(this.mngTargetType)
                .mngPrice(this.mngPrice)
                .mngChargeStart(this.mngChargeStart)
                .mngChargeDay(this.mngChargeDay)
                .plfChargeYn(this.plfChargeYn)
                .plfPrice(this.plfPrice)
                .plfChargeStart(this.plfChargeStart)
                .plfChargeDay(this.plfChargeDay)
                .build();
    }



}
