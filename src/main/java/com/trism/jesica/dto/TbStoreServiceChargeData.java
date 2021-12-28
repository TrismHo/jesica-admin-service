
package com.trism.jesica.dto;

import com.trism.jesica.persistence.Entitiy.service.TbStoreServiceCharge;
import lombok.Data;


@Data
public class TbStoreServiceChargeData {

    private Long storeNo;

    private Integer platformType;

    private Integer platformUseYn;

    private Integer chargeNo;

    private String chargeStart;

    private Integer svcRateType;

    private Integer svcPrice;

    public TbStoreServiceCharge insertData() {
        return TbStoreServiceCharge.builder()
                .storeNo(this.storeNo)
                .platformType(this.platformType)
                .platformUseYn(this.platformUseYn)
                .chargeNo(this.chargeNo)
                .chargeStart(this.chargeStart)
                .svcRateType(this.svcRateType)
                .svcPrice(this.svcPrice)
                .build();
    }



}

