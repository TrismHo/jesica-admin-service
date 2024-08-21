package com.trism.jesica.persistence.mysql.id;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
public class TbStoreGoodsOptionID implements Serializable {
    private Long storeGoods;
    private Long storeOption;

}
