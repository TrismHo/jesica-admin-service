package com.trism.jesica.persistence.mysql.Entitiy.business;

import com.trism.jesica.persistence.mysql.core.entity.BaseEntity;
import com.trism.jesica.persistence.mysql.id.TbDeliveryShareID;
import lombok.AccessLevel;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 배송그룹
 */
@Entity
@IdClass(TbDeliveryShareID.class)
@Table(name = "tb_delivery")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@Getter
//@AllArgsConstructor
//@Builder
//@ToString(callSuper = true, exclude = {"branches"})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbDeliveryShare extends BaseEntity {

    @Id
    @Column(name = "give_dlvy_no", nullable = false)
    private Long giveDlvyNo;

    @Id
    @Column(name = "accept_dlvy_no" ,  nullable = false)
    private Long acceptDlvyNo;

}
