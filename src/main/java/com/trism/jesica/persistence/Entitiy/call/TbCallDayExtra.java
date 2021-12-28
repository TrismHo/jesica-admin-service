package com.trism.jesica.persistence.Entitiy.call;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 탁송_당일_추가정보
 */
@Table(name = "tb_call_day_extra")
@Entity
@Data
public class TbCallDayExtra implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 주문_일련번호
     */
    @Id
    @Column(name = "order_no", insertable = false, nullable = false)
    private Long orderNo;

    /**
     * 고객_전화번호_2
     */
    @Column(name = "cust_tel_2")
    private String custTel2 =null;

    /**
     * 주문_제휴본사_번호
     */
    @Column(name = "order_head_no")
    private Integer orderHeadNo = null;

    /**
     * 주문_총판_번호
     */
    @Column(name = "order_branch_no")
    private Integer orderBranchNo = null;

    /**
     * 수주_제휴본사
     */
    @Column(name = "accept_head_no")
    private Integer acceptHeadNo = null;

    /**
     * 수주_총판
     */
    @Column(name = "accept_branch_no")
    private Integer acceptBranchNo = null;

    /**
     * 수주_가맹점
     */
    @Column(name = "accept_store_no")
    private Integer acceptStoreNo = null;

    /**
     * 수주_가맹점_연락처
     */
    @Column(name = "accept_store_tel")
    private String acceptStoreTel = null;

    /**
     * 출발_주소_1 (레벨1)
     */
    @Column(name = "depart_addr_1")
    private String departAddr1 = null;

    /**
     * 출발_주소_2 (레벨2)
     */
    @Column(name = "depart_addr_2")
    private String departAddr2 = null;

    /**
     * 출발_주소_5 (사용자 입력주소)
     */
    @Column(name = "depart_addr_5")
    private String departAddr5 = null;

    /**
     * 도착_주소_1 (레벨1)
     */
    @Column(name = "dest_addr_1")
    private String destAddr1 = null;

    /**
     * 도착_주소_2 (레벨2)
     */
    @Column(name = "dest_addr_2")
    private String destAddr2 = null;

    /**
     * 도착_주소_5 (사용자 입력주소)
     */
    @Column(name = "dest_addr_5")
    private String destAddr5 = null;

    /**
     * 출발_연락처
     */
    @Column(name = "depart_tel")
    private String departTel = null;

    /**
     * 출발_메모 (담당자 등)
     */
    @Column(name = "depart_memo")
    private String departMemo = null;

    /**
     * 도착_연락처
     */
    @Column(name = "dest_tel")
    private String destTel = null;

    /**
     * 도착_메모 (담당자 등)
     */
    @Column(name = "dest_memo")
    private String destMemo = null;

    /**
     * 고객_요청메모
     */
    @Column(name = "cust_memo")
    private String custMemo = null;

    /**
     * 주문_메모 (내부 사용자용)
     */
    @Column(name = "order_memo")
    private String orderMemo = null;

    /**
     * 취소_메모
     */
    @Column(name = "cancel_memo")
    private String cancelMemo = null;

    /**
     * 취소사유_구분_코드 (SYS_TYPE = OC)
     */
    @Column(name = "order_cancel_code")
    private String orderCancelCode = null;

    /**
     * 렌터차 인수/반납 예정시간
     */
    @Column(name = "car_use_date")
    private LocalDateTime carUseDate;

    /**
     * 차량모델
     */
    @Column(name = "car_model")
    private String carModel = null;

    /**
     * 차량번호
     */
    @Column(name = "car_num")
    private String carNum = null;

    
}