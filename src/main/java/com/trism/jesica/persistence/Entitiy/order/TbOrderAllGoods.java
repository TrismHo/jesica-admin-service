package com.trism.jesica.persistence.Entitiy.order;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.mappedsuper.BaseOrderGoodsEntity;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 주문배달 전체 상품
 */
@Entity
@Table(name = "tb_order_all_goods")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbOrderAllGoods extends BaseOrderGoodsEntity {

    /**
     * 주문 일련번호(FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_no", referencedColumnName = "order_no")
    @JsonManagedReference
    private TbOrderAll order;
}
