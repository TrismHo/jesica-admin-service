package com.trism.jesica.dto;

import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreCategoryFo;
import com.trism.jesica.persistence.mysql.type.CatLevel;
import lombok.Data;

@Data
public class TbStoreCategoryFoData {

    Long storeNo;

    String catCode;

    CatLevel catLevel;

    String parentCatCode;


    public TbStoreCategoryFo insertData() {
        return TbStoreCategoryFo.builder()
                .storeNo(this.storeNo)
                .catCode(this.catCode)
                .catLevel(this.catLevel)
                .parentCatCode(this.parentCatCode)
                .build();
    }

}
