package com.trism.jesica.persistence.mysql.Entitiy.storedlvy;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbStore;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 가맹점_배송_요금
 */
@Entity
@Table(name ="tb_store_dlvy_charge")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@DynamicInsert
@DynamicUpdate
public class TbStoreDlvyCharge implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 가맹점_번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "store_no",insertable = true, updatable = false)
    private Long storeNo;

    /**
     * 제휴본사 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_no" , insertable = false, updatable = false)
    @JsonManagedReference
    private TbStore store;

    /**
     * 가맹점 요금설정 설정여부
     */
    @Column(name = "use_yn", nullable = false)
    private Integer useYn = null;

    /**
     * 1: 거리구간요금제, 2: 블럭요금제
     */
    @Column(name = "dlvy_charge_type", nullable = false)
    private Integer dlvyChargeType = null;

    /**
     * 구간요금제_번호
     */
    @Column(name = "price_charge_no")
    private Long priceChargeNo = null;

    /**
     * 블럭요금제_번호
     */
    @Column(name = "area_charge_no")
    private Long areaChargeNo = null;

    /**
     * 눈비할증_사용여부(0:미사용, 1:사용)
     */
    @Column(name = "weather_charge_yn")
    private Integer weatherChargeYn = null;

    /**
     * 눈비할증_요금
     */
    @Column(name = "weather_charge")
    private Integer weatherCharge = null;


}
