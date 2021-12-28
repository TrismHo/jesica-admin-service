package com.trism.jesica.persistence.Entitiy.call;

import com.trism.jesica.persistence.mappedsuper.BaseCallEntity;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import javax.persistence.*;

/**
 * 탁송_전체_추가정보
 */
@Entity
@Table(name = "tb_call_all")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbCallAll extends BaseCallEntity {

/*    @Builder.Default
    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.PERSIST, mappedBy = "order")
    @JsonBackReference
    private Collection<TbCallHistory> callHistories = new ArrayList<>();*/

    @MapsId
    @NotFound(action= NotFoundAction.IGNORE)
    @OneToOne(optional = false)
    @JoinColumn(name = "order_no", referencedColumnName = "order_no")
    private TbCallAllExtra callExtra;
}
