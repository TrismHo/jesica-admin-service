package com.trism.jesica.persistence.id;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
public class TbServiceChargeID implements Serializable {
    private Long chargeNo;
    private Integer platformType;
    private Integer serviceType;

}
