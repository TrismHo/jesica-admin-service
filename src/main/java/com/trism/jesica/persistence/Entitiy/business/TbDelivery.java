package com.trism.jesica.persistence.Entitiy.business;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.core.entity.BaseEntity;
import com.trism.jesica.persistence.type.DataStatus;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 배송원
 */
@Entity
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
public class TbDelivery extends BaseEntity {

    /**
     * 제휴본사
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "dlvy_no", nullable = false)
    private Long dlvyNo;

    @Column(name = "head_no" ,insertable = true, updatable = false)
    private Integer headNo;

    @Column(name = "branch_no" ,insertable = true, updatable = false)
    private Integer branchNo;

    @Column(name = "store_no" ,insertable = true, updatable = false)
    private Integer storeNo;

    /**
     * 제휴본사
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "head_no", insertable = false, updatable = false)
    @JsonManagedReference
    private TbHead head;

    /**
     * 브랜드 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "branch_no", insertable = false, updatable = false)
    @JsonManagedReference
    private TbBranch branch;

    /**
     * 가맹점 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_no", insertable = false, updatable = false)
    @JsonManagedReference
    private TbStore store;

    /**
     * 입력 사용자 고유 ID
     */
    @Column(name = "insert_user_id", length = 20)
    private String insertUserId;

    /**
     * 수정 사용자 고유 ID
     */
    @Column(name = "update_user_id", length = 20)
    private String updateUserId;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    @Column(name = "data_status")
    @Enumerated(EnumType.ORDINAL)
    private DataStatus dataStatus;

    /**
     * 배달대행 이름
     */
    @Column(name = "dlvy_name", length = 40, nullable = false)
    private String dlvyName;

    /**
     * 배달대행그룹 구분 (1: 발주전용, 2: 수주전용, 3: 발주 + 수주)
     */
    @Column(name = "dlvy_group_type", length = 4)
    private Integer dlvyGroupType;

    /**
     * 운영 상태(1: 운영중, 2:  일시중지)
     */
    @Column(name = "open_status", length = 4)
    private Integer openStatus;

    /**
     * 운영 시간 사용여부
     */
    @Column(name = "open_time_yn")
    private Integer openTimeYn;

    /**
     * 운영 시작시간
     */
    @Column(name = "open_time_start")
    private String openTimeStart;

    /**
     * 운영 종료시간
     */
    @Column(name = "open_time_end")
    private String openTimeEnd;

    /**
     * 배송지연시간
     */
    @Column(name = "delay_time")
    private Integer delayTime;

    /**
     * 구간요금제 번호
     */
    @Column(name = "price_charge_no")
    private Integer priceChargeNo;

    /**
     * 눈비할증 사용여부(0: 미사용, 1:사용)
     */
    @Column(name = "weather_charge_yn")
    private Integer weatherChargeYn;

    /**
     *  눈비할증 요금
     */
    @Column(name = "weather_charge")
    private Integer weatherCharge;

    /**
     *  배달건당 관리비
     */
    @Column(name = "mng_price")
    private Integer mngPrice;

    /**
     *  배달관리비 정산 구분 (1: 정액 , 2:정률) - 건당 관리비 기준
     */
    @Column(name = "mng_rate_type")
    private Integer mngRateType;

    /**
     *  배달관리비 플랫폼사 (
     */
    @Column(name = "mng_rate_platform")
    private Integer mngRatePlatform;

    /**
     *  배달관리비 발주그룹 (
     */
    @Column(name = "mng_rate_give")
    private Integer mngRateGive;

    /**
     *  배달관리비 수주그룹 (
     */
    @Column(name = "mng_rate_accept")
    private Integer mngRateAccept;




    @Builder
    public TbDelivery(Long dlvyNo,
                      String insertUserId,
                      String updateUserId,
                      Integer headNo,
                      Integer branchNo,
                      Integer storeNo,
                      DataStatus dataStatus,
                      Integer openStatus,
                      String dlvyName,
                      Integer dlvyGroupType,
                      Integer openTimeYn,
                      String openTimeStart,
                      String openTimeEnd,

                      Integer delayTime,
                      Integer priceChargeNo,
                      Integer weatherChargeYn,
                      Integer weatherCharge,
                      Integer mngPrice,
                      Integer mngRateType,
                      Integer mngRatePlatform,
                      Integer mngRateGive,
                      Integer mngRateAccept
                     ) {
                this.dlvyNo = dlvyNo;
                this.insertUserId = insertUserId;
                this.updateUserId = updateUserId;
                this.headNo = headNo;
                this.branchNo = branchNo;
                this.storeNo = storeNo;
                this.dataStatus = dataStatus;
                this.openStatus = openStatus;
                this.dlvyName = dlvyName;
                this.dlvyGroupType = dlvyGroupType;
                this.openTimeYn = openTimeYn;
                this.openTimeStart = openTimeStart;
                this.openTimeEnd = openTimeEnd;

                this.delayTime = delayTime;
                this.priceChargeNo = priceChargeNo;
                this.weatherChargeYn = weatherChargeYn;
                this.weatherCharge = weatherCharge;
                this.mngPrice = mngPrice;
                this.mngRateType = mngRateType;
                this.mngRatePlatform = mngRatePlatform;
                this.mngRateGive = mngRateGive;
                this.mngRateAccept = mngRateAccept;
    }
}
