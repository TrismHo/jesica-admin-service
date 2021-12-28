package com.trism.jesica.persistence.mappedsuper;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.Entitiy.business.TbStoreSub;
import com.trism.jesica.persistence.core.entity.BaseEntity;
import com.trism.jesica.persistence.type.DlvyPayMethodType;
import com.trism.jesica.persistence.type.PayMethodType;
import lombok.*;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 주문배달
 */
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true,exclude = {} )
@Getter
@AllArgsConstructor
@MappedSuperclass
public abstract class BaseOrderEntity extends BaseEntity implements Serializable {
    /**
     * 주문 일련번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_no", nullable = false)
    private Long orderNo;

    /**
     * 수정 일련번호
     */
    @Column(name = "update_scn", nullable = false)
    private Integer updateScn;

    /**
     * 주문_구분_코드 (SYS_TYPE = OT)
     */
    @Column(name = "order_type_code", length = 4)
    private String orderTypeCode;

    /**
     * 주문_상태_코드 (SYS_TYPE = OS)
     */
    @Column(name = "order_status_code", length = 4)
    private String orderStatusCode;

    /**
     * 주문_경로_코드 (SYS_TYPE = OP)
     */
    @Column(name = "order_path_code", length = 4)
    private String orderPathCode;

    /**
     * 가맹점번호
     */
    @Column(name = "store_no", nullable = false)
    private Integer storeNo;

    /**
     * 가맹점번호
     */
/*    @ManyToOne(fetch = FetchType.LAZY)
    @JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class)
    @JoinColumn(name = "store_no", nullable = false, insertable= false, updatable = false)
    @JsonManagedReference
    private TbStore store;*/

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_no", nullable = false, insertable= false, updatable = false)
    @JsonManagedReference
    private TbStoreSub store;

    /**
     * 가맹점 이름
     */
    @Column(name = "store_name", length = 40)
    private String storeName;

    /**
     * 가맹점 전화번호
     */
    @Column(name = "store_tel", length = 15)
    private String storeTel;

    /**
     * 고객번호
     */
 /*   @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cust_no", nullable = false)
    private TbCust cust;
*/
    @Column(name = "cust_no", nullable = false)
    private Integer custNo;

    /**
     * 고객전화번호
     */
    @Column(name = "cust_tel", length = 15)
    private String custTel;

    /**
     * 테이크 아웃 여부
     */
    @Column(name = "takeout_yn")
    private Boolean takeoutYn;

    /**
     * 테이크아웃 예정일시
     */
    @Column(name = "takeout_date")
    private LocalDateTime takeoutDate;

    /**
     * 준비_시간 (단위: 분, 조리시간)
     */
    @Column(name = "ready_time")
    private Integer readyTime;

    /**
     * 도착_예정시간 (단위: 분, 고객앱주문 시 고객알림, 테이크아웃 시 주방발주시간)
     */
    @Column(name = "expect_arr_time")
    private LocalDateTime expectArrTime;

    /**
     * 배달대행_일련번호
     */
    @Column(name = "dlvy_no")
    private Integer dlvyNo;

    @Column(name = "worker_no", nullable = false)
    private Integer workerNo;

    /**
     * 배송원_(FK)
     */
/*    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "worker_no", referencedColumnName = "worker_no")
    @JsonManagedReference
    private TbUserWorker userWorker;*/

    /**
     * 배송원 이름
     */
    @Column(name = "worker_name", length = 40)
    private String workerName;

    /**
     * 베송원 전화번호
     */
    @Column(name = "worker_tel", length = 15)
    private String workerTel;

    /**
     * 주문 일시
     */
    @Column(name = "order_date", nullable = false)
    private LocalDateTime orderDate;

    /**
     * 준비_일시 (준비중으로로 변경된)
     */
    @Column(name = "ready_date")
    private LocalDateTime readyDate;

    /**
     * 배송 요청 일시
     */
    @Column(name = "dlvy_req_date")
    private LocalDateTime dlvyReqDate;

    /**
     * 배송_배차_일시
     */
    @Column(name = "dlvy_acc_date")
    private LocalDateTime dlvyAccDate;

    /**
     * 배송_도착_일시
     */
    @Column(name = "dlvy_arr_date")
    private LocalDateTime dlvyArrDate;

    /**
     * 출발 일시
     */
    @Column(name = "pickup_date")
    private LocalDateTime pickupDate;

    /**
     * 완료 일시
     */
    @Column(name = "finish_date")
    private LocalDateTime finishDate;

    /**
     * 취소일시
     */
    @Column(name = "cancel_date")
    private LocalDateTime cancelDate;

    /**
     * 출발 명칭
     */
    @Column(name = "depart_poi", length = 100)
    private String departPoi;

    /**
     * 출발 위도
     */
    @Column(name = "depart_lat")
    private BigDecimal departLat;

    /**
     * 출발 경도
     */
    @Column(name = "depart_lng")
    private BigDecimal departLng;

    /**
     * 도착 명칭
     */
    @Column(name = "dest_poi", length = 100)
    private String destPoi;

    /**
     * 도착 위도
     */
    @Column(name = "dest_lat")
    private BigDecimal destLat;

    /**
     * 도착 경도
     */
    @Column(name = "dest_lng")
    private BigDecimal destLng;

    /**
     * 도착주소 3 (레벨3)
     */
    @Column(name = "dest_addr_3", length = 100)
    private String destAddr3;

    /**
     * 도착주소 4 (나머지 주소)
     */
    @Column(name = "dest_addr_4", length = 100)
    private String destAddr4;

    /**
     * 상품이름 (표시이름)
     */
    @Column(name = "goods_name", length = 100)
    private String goodsName;

    /**
     * 주문금액(총액)
     */
    @Column(name = "order_amt", nullable = false)
    private Integer orderAmt;

    /**
     * 할인금액(총액)
     */
    @Column(name = "discount_amt")
    private Integer discountAmt;

    /**
     * 봉사료 금액
     */
    @Column(name = "service_amt")
    private Integer serviceAmt;

    /**
     * 배달거리 (미터단위)
     */
    @Column(name = "dlvy_distance")
    private Integer dlvyDistance;

    /**
     * 배달 거리(미터단위)
     */
    @Column(name = "dlvy_cnt")
    private Integer dlvyCnt;

    /**
     * 배달대행 금액
     */
    @Column(name = "dlvy_amt")
    private Integer dlvyAmt;

    /**
     * 배달대행 할증 요금
     */
    @Column(name = "dlvy_extra_charge")
    private Integer dlvyExtraCharge;

    /**
     * 배달대행 취소 시간(자동 취소)
     */
    @Column(name = "dlvy_cancel_time")
    private Integer dlvyCancelTime;

    /**
     * 주문 취소 패널티 금액
     */
    @Column(name = "dlvy_penalty_amt")
    private Integer dlvyPenaltyAmt;

    /**
     * 요금결제 방식 (1: 현금, 2: 카드, 3: 캐시)
     */
    @Column(name = "pay_method", length = 4)
    @Enumerated(EnumType.ORDINAL)
    private PayMethodType payMethod;


    /**
     * 배달대행_요금결제_방식 (1: 현금, 2: 카드, 3: 캐시)
     */
    @Column(name = "dlvy_pay_method", length = 4)
    @Enumerated(EnumType.ORDINAL)
    private DlvyPayMethodType dlvyPayMethod;

    /**
     * 외부 주문 번호(만나)
     */
    @Column(name = "ex_order_no")
    private Long exOrderNo;

    /**
     * 외부 가맹점 코드(만나)
     */
    @Column(name = "ex_store_cd")
    private String exStoreCd;



    @PrePersist
    private void defaultInit() {
        this.updateScn = 1;
        this.takeoutYn = false;
        this.orderDate = LocalDateTime.now();
        this.orderAmt = 0;
        this.discountAmt = 0;
        this.serviceAmt = 0;
        this.dlvyDistance = 0;
        this.dlvyCnt = 0;
        this.dlvyAmt = 0;
        this.dlvyExtraCharge = 0;
    }



}
