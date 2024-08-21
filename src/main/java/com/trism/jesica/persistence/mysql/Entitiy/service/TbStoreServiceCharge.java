package com.trism.jesica.persistence.mysql.Entitiy.service;

import com.trism.jesica.persistence.mysql.id.TbStoreServiceChargeID;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 가맹점_서비스_이용료(건당)
 */
@Entity
@Data
@Table(name = "tb_store_service_charge")
@NoArgsConstructor
@IdClass(TbStoreServiceChargeID.class)
public class TbStoreServiceCharge implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 가맹점_번호
     */
    @Id
    @Column(insertable = false, name = "store_no", nullable = false)
    private Long storeNo;

    /**
     * 플랫폼_타입(0:외부플랫폼, 1:잇수다)
     */
    @Id
    @Column(name = "platform_type", insertable = false, nullable = false)
    private Integer platformType;

    /**
     * 플랫폼_사용여부(0:미사용, 1:사용)
     */
    @Column(name = "platform_use_yn", nullable = false)
    private Integer platformUseYn = 0;

    /**
     * 정산그룹_번호(tb_service_charge_group)
     */
    @Column(name = "charge_no")
    private Integer chargeNo = null;

    /**
     * 차감시작일(YYYYMMDD)
     */
    @Column(name = "charge_start")
    private String chargeStart = null;

    /**
     * 서비스이용료_정산_구분(1: 정액, 2: 정률) - 주문금액 기준
     */
    @Column(name = "svc_rate_type", nullable = false)
    private Integer svcRateType = 1;

    /**
     * 이용료(원/%)
     */
    @Column(name = "svc_price")
    private Integer svcPrice = 0;

    @Builder
    private TbStoreServiceCharge(
            Long storeNo ,
            Integer platformType,
            Integer platformUseYn,
            Integer chargeNo,
            String chargeStart,
            Integer svcRateType,
            Integer svcPrice
    ) {
        this.storeNo = storeNo;
        this.platformType = platformType;
        this.platformUseYn = platformUseYn;
        this.chargeNo = chargeNo;
        this.chargeStart = chargeStart;
        this.svcRateType = svcRateType;
        this.svcPrice = svcPrice;
    }
}
