package com.trism.jesica.dto;

import com.trism.jesica.persistence.Entitiy.block.TbDlvyAreaCharge;
import com.trism.jesica.persistence.type.DataStatus;
import lombok.Data;


@Data
public class TbDlvyAreaChargeData {

    private Long areaChargeNo;

    private Long branchNo;

    private Long headNo;

    private String insertUserId;

    private DataStatus dataStatus;

    private String areaChargeName;

    private Integer areaChargeType;

    public TbDlvyAreaCharge insertData() {
        return TbDlvyAreaCharge.builder()
                .areaChargeNo(this.areaChargeNo)
                .branchNo(this.branchNo)
                .headNo(this.headNo)
                .insertUserId(this.insertUserId)
                .dataStatus(this.dataStatus)
                .areaChargeName(this.areaChargeName)
                .areaChargeType(this.areaChargeType)
                .build();
    }


}
