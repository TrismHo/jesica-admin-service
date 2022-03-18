package com.trism.jesica.persistence.Entitiy.call;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.trism.jesica.persistence.Entitiy.order.TbOrderDayHistory;
import com.trism.jesica.persistence.mappedsuper.BaseOrderEntity;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Collection;

/**
 * 탁송_전체_추가정보
 */
/**
 * 주문배달_오늘
 */
@Entity
@Table(name = "tb_order_day")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbCallDay extends BaseOrderEntity {

    @Builder.Default
    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.PERSIST, mappedBy = "order")
    @JsonBackReference
    private Collection<TbOrderDayHistory> orderHistories = new ArrayList<>();
/*
    @MapsId
    @OneToOne(optional = false ,fetch = FetchType.LAZY)
    @JoinColumn(name = "order_no", referencedColumnName = "order_no",nullable = true  )
    private TbCallDayExtra_Del callDayExtra;*/

}