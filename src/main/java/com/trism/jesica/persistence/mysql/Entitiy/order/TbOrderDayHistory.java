package com.trism.jesica.persistence.mysql.Entitiy.order;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.mysql.id.TbOrderHistoryID;
import com.trism.jesica.persistence.mysql.mappedsuper.BaseOrderHistoryEntity;
import lombok.*;
import lombok.experimental.Accessors;

import javax.persistence.*;

/**
 * 주문배달 오늘 수정이력
 */
@Entity
@Table(name = "tb_order_history")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {"order"})
@EqualsAndHashCode(callSuper = true)
@IdClass(TbOrderHistoryID.class)
public class TbOrderDayHistory extends BaseOrderHistoryEntity {

    /**
     * 주문 (FK)
     */
    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_no", referencedColumnName = "order_no")
    @JsonManagedReference
    private TbOrderDay order;
}
