package com.trism.jesica.dto;

import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreCategory;
import com.trism.jesica.persistence.mysql.type.CatLevel;
import com.trism.jesica.persistence.mysql.type.DataStatus;
import lombok.Data;

@Data
public class TbStoreCategoryData {

    private Long storeCatNo;

    private Integer storeNo;

    private Long parentCatNo;

    private CatLevel catLevel;

    private String catName;

    private String catValue;

    private Integer viewOrder;

    private DataStatus dataStatus;

    private String memo;

    public TbStoreCategory insertData() {
        return TbStoreCategory.builder()
                .storeCatNo(this.storeCatNo)
                .storeNo(this.storeNo)
                .parentCatNo(this.parentCatNo)
                .catLevel(this.catLevel)
                .catName(this.catName)
                .catValue(this.catValue)
                .viewOrder(this.viewOrder)
                .dataStatus(this.dataStatus)
                .memo(this.memo)
                .build();
    }

}
