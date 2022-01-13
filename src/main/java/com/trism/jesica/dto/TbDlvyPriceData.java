package com.trism.jesica.dto;

import lombok.Data;

import java.time.LocalDateTime;


@Data
public class TbDlvyPriceData {

    private Long priceNo;

    private Long groupNo;

    private Integer groupType;

    private Integer day;

    private Integer startTime;

    private Integer endTime;

    private LocalDateTime insertDate;

    private String insertUserId;

    private LocalDateTime updateDate;

    private String updateUserId;

    private Integer dataStatus;

    private Integer radius;

    private Integer custPrice;

    private Integer dlvyPrice;

  /*  public TbDlvyPrice insertData() {
        return TbDlvyPrice.builder()
                .priceNo(this.priceNo)
                .groupNo(this.groupNo)
                .groupType(this.groupType)
                .day(this.day)
                .startTime(this.startTime)
                .endTime(this.endTime)
                .insertDate(this.insertDate)
                .insertUserId(this.insertUserId)
                .updateDate(this.updateDate)
                .updateUserId(this.updateUserId)
                .dataStatus(this.dataStatus)
                .radius(this.radius)
                .custPrice(this.custPrice)
                .dlvyPrice(this.dlvyPrice)
                .build();
    }*/


}
