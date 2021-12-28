package com.trism.jesica.persistence.Entitiy.order;

import com.trism.jesica.persistence.mappedsuper.BaseOrderExtraEntity;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 주문배달 오늘 추가정보
 */
@Entity
@Table(name = "tb_order_day_extra")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
/*@AllArgsConstructor*/
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbOrderDayExtra extends BaseOrderExtraEntity {

  /*  @MapsId
    @OneToOne(optional = false)
    @JoinColumn(name = "order_no", referencedColumnName = "order_no")
    private TbOrderDay order;*/
}
