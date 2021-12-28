package com.trism.jesica.dto;

import com.trism.jesica.persistence.Entitiy.street.TbDlvyPriceCharge;
import lombok.Data;


@Data
public class TbDlvyPriceChargeData {

    private Long priceChargeNo;

    private Long branchNo;

    private Long headNo;

    private String insertUserId;

    private Integer dataStatus;

    private String priceChargeName;


    public TbDlvyPriceCharge insertData() {
        return TbDlvyPriceCharge.builder()
                .priceChargeNo(this.priceChargeNo)
                .branchNo(this.branchNo)
                .headNo(this.headNo)
                .insertUserId(this.insertUserId)
                .dataStatus(this.dataStatus)
                .priceChargeName(this.priceChargeName)
                .build();
    }


}
