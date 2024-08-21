
package com.trism.jesica.dto;

import com.trism.jesica.persistence.mysql.Entitiy.service.TbServiceCharge;
import lombok.Data;


@Data
public class TbServiceChargeData {

    private Long chargeNo;

    private Integer platformType;

    private Integer serviceType;

    private Integer svcRate0;

    private Integer svcRate1;

    private Integer svcRate2;

    private Integer svcRate3;

    private Integer headNo1;

    private Integer headNo2;

    private Integer headNo3;

    private Integer branchNo1;

    private Integer branchNo2;

    private Integer branchNo3;



    public TbServiceCharge insertData() {
        return TbServiceCharge.builder()
                .chargeNo(this.chargeNo)
                .platformType(this.platformType)
                .serviceType(this.serviceType)
                .svcRate0(this.svcRate0)
                .svcRate1(this.svcRate1)
                .svcRate2(this.svcRate2)
                .svcRate3(this.svcRate3)
                .headNo1(this.headNo1)
                .headNo2(this.headNo2)
                .headNo3(this.headNo3)
                .branchNo1(this.branchNo1)
                .branchNo2(this.branchNo2)
                .branchNo3(this.branchNo3)
                .build();
    }



}

