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

@Table(name = "tb_order_day_goods_option")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
//@AllArgsConstructor
//@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbOrderDayGoodsOption extends BaseOrderGoodsOptionEntity {

    @MapsId("orderGoodsNo")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_goods_no", referencedColumnName = "order_goods_no")
    @JsonManagedReference
    private TbOrderDayGoods orderDayGoods;

    @Builder
    public TbOrderDayGoodsOption(Long orderGoodsNo, TbStoreOption storeOption, Integer optItemNo, Integer viewOrder, String optName, String itemName, Integer itemPrice, TbOrderDayGoods orderDayGoods) {
        super(orderGoodsNo, storeOption, optItemNo, viewOrder, optName, itemName, itemPrice);
        this.orderDayGoods = orderDayGoods;
    }
}
