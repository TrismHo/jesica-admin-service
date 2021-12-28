package com.trism.jesica.persistence.Entitiy.order;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.Entitiy.goods.TbStoreOption;
import com.trism.jesica.persistence.mappedsuper.BaseOrderGoodsOptionEntity;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Entity
@Table(name = "TB_ORDER_ALL_GOODS_OPTION", schema = "world_lao")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
//@AllArgsConstructor
//@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbOrderAllGoodsOption extends BaseOrderGoodsOptionEntity {

    @MapsId("orderGoodsNo")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_goods_no", referencedColumnName = "order_goods_no")
    @JsonManagedReference
    private TbOrderDayGoods orderDayGoods;

    @Builder
    public TbOrderAllGoodsOption(Long orderGoodsNo, TbStoreOption storeOption, Integer optItemNo, Integer viewOrder, String optName, String itemName, Integer itemPrice, TbOrderDayGoods orderDayGoods) {
        super(orderGoodsNo, storeOption, optItemNo, viewOrder, optName, itemName, itemPrice);
        this.orderDayGoods = orderDayGoods;
    }
}