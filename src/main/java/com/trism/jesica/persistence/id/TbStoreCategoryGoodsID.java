package com.trism.jesica.persistence.id;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
public class TbStoreCategoryGoodsID implements Serializable {
    private Long storeCategory;
    private Long storeGoods;
}
