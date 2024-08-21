package com.trism.jesica.persistence.mysql.Entitiy.call;

import com.trism.jesica.persistence.mysql.mappedsuper.BaseCallWkEntity;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Entity;
import javax.persistence.Table;

@Table(name = "tb_call_all_wk")
@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@DynamicInsert
@DynamicUpdate
public class TbCallAllWk extends BaseCallWkEntity {



}
