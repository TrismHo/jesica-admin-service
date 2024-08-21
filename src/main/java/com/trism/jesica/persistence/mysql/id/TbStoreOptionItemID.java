package com.trism.jesica.persistence.mysql.id;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
public class TbStoreOptionItemID implements Serializable {
    private Long storeOptNo;
    private Integer optItemNo;

}
