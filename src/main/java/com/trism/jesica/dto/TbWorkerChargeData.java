package com.trism.jesica.dto;

import com.trism.jesica.persistence.Entitiy.worker.TbWorkerCharge;
import lombok.Data;

import java.math.BigDecimal;


@Data
public class TbWorkerChargeData {

    Integer workerNo;
    Integer dailyCharge;
    Integer monthlyCharge;
    BigDecimal takeoverCharge ;
    Integer takeoverRateType;
    BigDecimal takeoverCharge1 ;
    Integer takeoverRateType1;
    BigDecimal takeoverCharge2 ;
    Integer takeoverRateType2;
    BigDecimal returnCharge;
    Integer returnRateType;
    BigDecimal mycarCharge;
    Integer mycarRateType;
    BigDecimal olleCharge;
    Integer olleRateType;


    public TbWorkerCharge insertData() {
        return TbWorkerCharge.builder()
                .workerNo(this.workerNo)
                .dailyCharge(this.dailyCharge)
                .monthlyCharge(this.monthlyCharge)
                .takeoverCharge(this.takeoverCharge)
                .takeoverRateType(this.takeoverRateType)
                .takeoverCharge1(this.takeoverCharge1)
                .takeoverRateType1(this.takeoverRateType1)
                .takeoverCharge2(this.takeoverCharge2)
                .takeoverRateType2(this.takeoverRateType2)
                .returnCharge(this.returnCharge)
                .returnRateType(this.returnRateType)
                .mycarCharge(this.mycarCharge)
                .mycarRateType(this.mycarRateType)
                .olleCharge(this.olleCharge)
                .olleRateType(this.olleRateType)
                .build();
    }

}
