package com.trism.jesica.persistence.Entitiy.goods;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
public class TbStoreGoodsItemId implements Serializable {
    private Long storeGoodsNo;
    private Integer basicItemNo;

}
