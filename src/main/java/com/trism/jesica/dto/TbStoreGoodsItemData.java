package com.trism.jesica.dto;

import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreGoodsItem;
import com.trism.jesica.persistence.mysql.type.ItemStatus;
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
