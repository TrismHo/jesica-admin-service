package com.trism.jesica.dto;

import com.trism.jesica.persistence.mysql.Entitiy.block.TbDlvyArea;
import lombok.Data;


@Data
public class TbDlvyAreaData {

    private Long areaNo;
    private Long groupNo;
    private Integer groupType;

    private String insertUserId;

    private Integer dataStatus;

    private String areaName;

    private Integer areaChargeType;
    private Integer custPrice;
    private Integer dlvyPrice;

    public TbDlvyArea insertData() {
        return TbDlvyArea.builder()
                .areaNo(this.areaNo)
                .groupNo(this.groupNo)
                .groupType(this.groupType)
                .insertUserId(this.insertUserId)
                .dataStatus(this.dataStatus)
                .areaName(this.areaName)
                .areaChargeType(this.areaChargeType)
                .custPrice(this.custPrice)
                .dlvyPrice(this.dlvyPrice)
                .build();
    }


}
