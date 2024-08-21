package com.trism.jesica.persistence.mysql.Entitiy.service;

import com.trism.jesica.persistence.mysql.id.TbServiceChargeID;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 서비스_이용료
 */
@Entity
@Table(name = "tb_service_charge")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@Getter
//@AllArgsConstructor
//@Builder
@DynamicInsert
@DynamicUpdate
@IdClass(TbServiceChargeID.class)
public class TbServiceCharge implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 정산그룹_번호
     */
    @Id
    @Column(insertable = true, name = "charge_no", nullable = false)
    private Long chargeNo;

    /**
     * 플랫폼_타입(0:외부플랫폼, 1:잇수다)
     */
    @Id
    @Column(name = "platform_type", insertable = true, nullable = false)
    private Integer platformType;

    /**
     * 서비스_구분(0: 기타, 1: 음식배달, 2: 마트, 3: 전통시장)
     */
    @Id
    @Column(name = "service_type", insertable = true, nullable = false)
    private Integer serviceType;

    /**
     * 서비스_이용료_플랫폼사
     */
    @Column(name = "svc_rate_0")
    private Integer svcRate0 = null;

    /**
     * 서비스_이용료_1차정산
     */
    @Column(name = "svc_rate_1")
    private Integer svcRate1 = null;

    /**
     * 서비스_이용료_2차정산
     */
    @Column(name = "svc_rate_2")
    private Integer svcRate2 = null;

    /**
     * 서비스_이용료_3차정산
     */
    @Column(name = "svc_rate_3")
    private Integer svcRate3 = null;

    /**
     * 본사_번호_1차정산
     */
    @Column(name = "head_no_1")
    private Integer headNo1 = null;

    /**
     * 총판_번호_1차정산
     */
    @Column(name = "branch_no_1")
    private Integer branchNo1 = null;

    /**
     * 본사_번호_2차정산
     */
    @Column(name = "head_no_2")
    private Integer headNo2 = null;

    /**
     * 총판_번호_2차정산
     */
    @Column(name = "branch_no_2")
    private Integer branchNo2 = null;

    /**
     * 본사_번호_3차정산
     */
    @Column(name = "head_no_3")
    private Integer headNo3 = null;

    /**
     * 총판_번호_3차정산
     */
    @Column(name = "branch_no_3")
    private Integer branchNo3 = null;


    @Builder
    private TbServiceCharge(
            Long chargeNo ,
            Integer platformType,
            Integer serviceType,
            Integer svcRate0,
            Integer svcRate1,
            Integer svcRate2,
            Integer svcRate3,
            Integer headNo1,
            Integer headNo2,
            Integer headNo3,
            Integer branchNo1,
            Integer branchNo2,
            Integer branchNo3
            ) {
        this.chargeNo = chargeNo;
        this.platformType = platformType;
        this.serviceType = serviceType;
        this.svcRate0 = svcRate0;
        this.svcRate1 = svcRate1;
        this.svcRate2 = svcRate2;
        this.svcRate3 = svcRate3;
        this.headNo1 = headNo1;
        this.headNo2 = headNo2;
        this.headNo3 = headNo3;
        this.branchNo1 = branchNo1;
        this.branchNo2 = branchNo2;
        this.branchNo3 = branchNo3;
    }
}
