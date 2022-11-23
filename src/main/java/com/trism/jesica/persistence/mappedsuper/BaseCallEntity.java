package com.trism.jesica.persistence.mappedsuper;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.Entitiy.business.TbHead;
import com.trism.jesica.persistence.core.entity.BaseEntity;
import lombok.*;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.io.Serializable;
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
public abstract class BaseCallEntity extends BaseEntity implements Serializable {
    /**
     * 주문 일련번호
     */
    @Id
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
     * 결제상태(1 결제완료 , 2 부분결제 , 3 미결제 ,4 결제대기)
     */
    @Column(name = "order_pay_status", length = 4)
    private String orderPayStatus;


    /**
     * 릴레이콜_개수(단일콜인 경우 1)
     */
    @Column(name = "relay_cnt")
    private Integer relayCnt;

    /**
     * 릴레이콜_현재단계
     */
    @Column(name = "relay_step")
    private Integer relayStep;

    /**
     * 발주_제휴본사
     */
    @Column(name = "head_no")
    private Integer headNo;

    /**
     * 발주총판
     */
    @Column(name = "branch_no")
    private Integer branchNo;

    /**
     * 가맹점번호
     */
    @Column(name = "store_no", nullable = false)
    private Integer storeNo;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "head_no", nullable = false, insertable= false, updatable = false)
    @JsonManagedReference
    private TbHead head;


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
     * 가맹점 전화번호
     */
    /*@Column(name = "rental_store_tel", length = 15)
    private String rentalStoreTel;*/


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
     * 고객전화번호
     */
    @Column(name = "cust_tel_2", length = 15)
    private String custTel2;

    /**
     * 주문 일시
     */
    @Column(name = "order_date", nullable = false)
    private LocalDateTime orderDate;

    /**
     * 렌터카업체 인수/반납 예약시간
     */
    @Column(name = "car_use_date")
    private LocalDateTime carUseDate;

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
     * 봉사료 금액
     */
    @Column(name = "total_amt")
    private Integer totalAmt;

    /**
     * 고객쿠폰번호
     */
    @Column(name = "pub_coupon_no")
    private Integer pubCouponNo;

    /**
     * 기사번호
     */
    @Column(name = "worker_no", nullable = false)
    private Integer workerNo;

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
     * 수주 제휴본사
     */
    @Column(name = "accept_head_no")
    private Integer acceptHeadNo;

    /**
     * 수주 총판
     */
    @Column(name = "accept_branch_no")
    private Integer acceptBranchNo;

    /**
     * 수주 가맹점
     */
    @Column(name = "accept_store_no")
    private Integer acceptStoreNo;

    /**
     * 수주 가맹점 연락처
     */
    @Column(name = "accept_store_tel")
    private Integer acceptStoreTel;

    /**
     * 고객요청
     */
    @Column(name = "cust_memo")
    private String custMemo;

    /**
     * 주문메모
     */
    @Column(name = "order_memo")
    private String orderMemo;

    /**
     * 취소메모
     */
    @Column(name = "cancel_memo")
    private String cancelMemo;

    /**
     * 취소사유 구분 코드 (SYS_TYPE = OC)
     */
    @Column(name = "order_cancel_code")
    private String orderCancelCode;

    /**
     * 차량 모델
     */
    @Column(name = "car_model")
    private String carModel;

    /**
     * 차량 모델
     */
    @Column(name = "car_num")
    private String carNum;

    /**
     * 고객 장소_구분 (0:일반, 1:제시카존, 2:제주공항, 3:제주여객터미널, 4:제주국제여객터미널)
     */
    @Column(name = "cust_place_type")
    private Integer custPlaceType;

    /**
     * 계약자명
     */
    @Column(name = "contract_name")
    private String contractName;

    /**
     * 계약자명
     */
    @Column(name = "contract_tel")
    private String contractTel;

    /**
     * 인수안내(N : 사용안함, T: 인수안내완료, F: 인수안내 대기)
     */
    @Column(name = "outbound_flag")
    private String outboundFlag;

    /**
     * 이용횟수
     */
    @Column(name = "use_count")
    private Integer useCount;

    /**
     * 렌터카예약번호
     */
    @Column(name = "reserv_num")
    private String reservNum;

    /**
     * 초기주유량(N : 알수없음, 그외 : 랜토카 업체마다 표기값이 다다름)
     */
    @Column(name = "default_fuel")
    private String defaultFuel;

    /**
     * 사전체크인 여부(0: 알수없음, 1: 사전체크인완료, 2: 사전체크인 안됨)
     */
    @Column(name = "pre_check_in")
    private Integer preCheckIn;


    /**
     * 미납금
     */
    @Column(name = "rental_car_unpaid")
    private Integer rentalCarUnpaid;

    /**
     * 탑승인원
     */
    @Column(name = "passenger_num")
    private Integer passengerNum;

    /**
     * 고객 운전자명
     */
    @Column(name = "cust_driver_name")
    private Integer custDriverName;

    /**
     * 고객 운전자명
     */
    @Column(name = "cust_driver_tel")
    private Integer custDriverTel;


    /**
     * 배송원_(FK)
     */
/*    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "worker_no", referencedColumnName = "worker_no")
    @JsonManagedReference
    private TbUserWorker userWorker;*/

    /**
     * 배송_도착_일시
     */
/*    @Column(name = "dlvy_arr_date")
    private LocalDateTime dlvyArrDate;*/

    @PrePersist
    private void defaultInit() {
        this.updateScn = 1;
        this.orderDate = LocalDateTime.now();
        this.orderAmt = 0;
        this.discountAmt = 0;
        this.serviceAmt = 0;
        /*this.dlvyCnt = 0;*/
    }



}
