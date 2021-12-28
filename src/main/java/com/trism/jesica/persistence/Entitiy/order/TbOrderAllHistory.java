package com.trism.jesica.persistence.Entitiy.order;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.id.TbOrderHistoryID;
import com.trism.jesica.persistence.mappedsuper.BaseOrderHistoryEntity;
import lombok.*;
import lombok.experimental.Accessors;

import javax.persistence.*;

/**
        * 주문배달 전체 수정이력
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
public class TbOrderAllHistory extends BaseOrderHistoryEntity {

    /**
     * 주문 (FK)
     */
    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_no", referencedColumnName = "order_no")
    @JsonManagedReference
    private TbOrderAll order;
}
