package com.trism.jesica.persistence.Entitiy.order;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.trism.jesica.persistence.mappedsuper.BaseOrderEntity;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Collection;

@Entity
@Table(name = "tb_order_all")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbOrderAll extends BaseOrderEntity {

    @Builder.Default
    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.PERSIST, mappedBy = "order")
    @JsonBackReference
    private Collection<TbOrderAllHistory> orderHistories = new ArrayList<>();

    @MapsId
    @OneToOne(optional = false)
    @JoinColumn(name = "order_no", referencedColumnName = "order_no")
    private TbOrderAllExtra orderExtra;
}
