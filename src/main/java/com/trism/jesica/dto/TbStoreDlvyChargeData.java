package com.trism.jesica.dto;

import com.trism.jesica.persistence.mysql.Entitiy.storedlvy.TbStoreDlvyCharge;
import lombok.Data;


@Data
public class TbStoreDlvyChargeData {

    private Long storeNo;

    private Integer dlvyChargeType;

    private Integer useYn;

    private Long priceChargeNo;

    private Long areaChargeNo;

    private Integer weatherChargeYn;

    private Integer weatherCharge;



    public TbStoreDlvyCharge insertData() {
        return TbStoreDlvyCharge.builder()
                .storeNo(this.storeNo)
                .useYn(this.useYn)
                .dlvyChargeType(this.dlvyChargeType)
                .priceChargeNo(this.priceChargeNo)
                .areaChargeNo(this.areaChargeNo)
                .weatherChargeYn(this.weatherChargeYn)
                .weatherCharge(this.weatherCharge)
                .build();
    }



}
