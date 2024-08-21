package com.trism.jesica.persistence.mysql.Entitiy.order;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.mysql.mappedsuper.BaseOrderGoodsEntity;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.List;

/**
 * 주문배달_오늘_상품
 */
@Entity
@Table(name = "tb_order_day_goods")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {"orderDayGoodsOptions"})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbOrderDayGoods extends BaseOrderGoodsEntity {
    /**
     * 주문 일련번호(FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_no", referencedColumnName = "order_no")
    @JsonManagedReference
    private TbOrderDay order;

    /**
     * 주문배달 상품 옵션(양방향)
     */
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "orderDayGoods")
    @JsonBackReference
    private List<TbOrderDayGoodsOption> orderDayGoodsOptions;

}
