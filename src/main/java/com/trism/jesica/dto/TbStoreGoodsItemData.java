package com.trism.jesica.dto;

import com.trism.jesica.persistence.Entitiy.goods.TbStoreGoodsItem;
import com.trism.jesica.persistence.type.ItemStatus;
import lombok.Data;


@Data
public class TbStoreGoodsItemData {

    private Long storeGoodsNo;

    private Integer basicItemNo;

    private Integer viewOrder;

    private ItemStatus itemStatus;

    private String itemName;

    private Integer itemPrice;

    public TbStoreGoodsItem insertData() {
        return TbStoreGoodsItem.builder()
                .storeGoodsNo(this.storeGoodsNo)
                .basicItemNo(this.basicItemNo)
                .viewOrder(this.viewOrder)
                .itemStatus(this.itemStatus)
                .itemName(this.itemName)
                .itemPrice(this.itemPrice)
                .build();
    }


}
