package com.trism.jesica.persistence.mysql.Entitiy.call;

import com.trism.jesica.persistence.mysql.mappedsuper.BaseCallRelayEntity;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Entity;
import javax.persistence.Table;

@Table(name = "tb_call_all_relay")
@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbCallAllRelay extends BaseCallRelayEntity {

}
