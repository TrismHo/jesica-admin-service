package com.trism.jesica.persistence.mysql.Entitiy.order;

import com.trism.jesica.persistence.mysql.mappedsuper.BaseOrderExtraEntity;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 주문배달 전체 추가정보
 */
@Entity
@Table(name = "tb_order_all_extra")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
/*@AllArgsConstructor*/
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbOrderAllExtra extends BaseOrderExtraEntity {

  /*  @MapsId
    @OneToOne(optional = false)
    @JoinColumn(name = "order_no", referencedColumnName = "order_no")
    private TbOrderAll order;*/

}
