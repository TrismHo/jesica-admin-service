package com.trism.jesica.dto;

import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreOptionItem;
import com.trism.jesica.persistence.mysql.type.ItemStatus;
import lombok.Data;


@Data
public class TbStoreOptionItemData {

    private Long storeOptNo;

    private Integer optItemNo;

    private Integer viewOrder;

    private ItemStatus itemStatus;

    private String itemName;

    private Integer itemPrice;

    public TbStoreOptionItem insertData() {
        return TbStoreOptionItem.builder()
                .storeOptNo(this.storeOptNo)
                .optItemNo(this.optItemNo)
                .viewOrder(this.viewOrder)
                .itemStatus(this.itemStatus)
                .itemName(this.itemName)
                .itemPrice(this.itemPrice)
                .build();
    }


}
