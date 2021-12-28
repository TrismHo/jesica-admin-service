package com.trism.jesica.persistence.Entitiy.call;

import com.trism.jesica.persistence.mappedsuper.BaseCallExtraEntity;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 탁송_전체_추가정보
 */
@Entity
@Table(name = "tb_call_all_extra")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
/*@AllArgsConstructor*/
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbCallAllExtra extends BaseCallExtraEntity {

  /*  @MapsId
    @OneToOne(optional = false)
    @JoinColumn(name = "order_no", referencedColumnName = "order_no")
    private TbOrderAll order;*/

}
