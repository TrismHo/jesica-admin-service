package com.trism.jesica.persistence.id;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
public class TbStoreServiceChargeID implements Serializable {
    private Long storeNo;
    private Integer platformType;

}
