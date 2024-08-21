
package com.trism.jesica.dto;

import com.trism.jesica.persistence.mysql.Entitiy.service.TbServiceChargeGroup;
import com.trism.jesica.persistence.mysql.type.DataStatus;
import lombok.Data;


@Data
public class TbServiceChargeGroupData {

    private Long chargeNo;

    private String insertUserId;

    private DataStatus dataStatus;

    private String chargeName;

    private Integer headNo;

    private Integer branchNo;

    public TbServiceChargeGroup insertData() {
        return TbServiceChargeGroup.builder()
                .chargeNo(this.chargeNo)
                .insertUserId(this.insertUserId)
                .dataStatus(this.dataStatus)
                .chargeName(this.chargeName)
                .headNo(this.headNo)
                .branchNo(this.branchNo)
                .build();
    }



}

