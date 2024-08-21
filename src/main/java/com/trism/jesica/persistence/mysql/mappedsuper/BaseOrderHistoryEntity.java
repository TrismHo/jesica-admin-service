package com.trism.jesica.persistence.mysql.mappedsuper;

import com.trism.jesica.persistence.mysql.type.DlvyPayMethodType;
import com.trism.jesica.persistence.mysql.type.PayMethodType;
import com.trism.jesica.persistence.mysql.type.UserType;
import lombok.*;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * 주문배달 수정이력
 */
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@Getter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@MappedSuperclass
public abstract class BaseOrderHistoryEntity {

    /**
     * 수정 일련번호
     */
    @Id
    @Column(name = "update_scn")
    private Integer updateScn;


    /**
     * 수정 일시
     */
    @Column(name = "update_date")
    private LocalDateTime updateDate;


    /**
     * 수정 사용자 고유 ID
     */
    @Column(name = "update_user_no")
    private Long updateUserNo;

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
     * 테이크아웃_여부 (0: no, 1: yes)
     */
    @Column(name = "takeout_yn")
    private Boolean takeoutYn;

    /**
     * 테이크아웃_예정일시
     */
    @Column(name = "takeout_date")
    private LocalDateTime takeoutDate;

    /**
     * 주문금액 (총액)
     */
    @Column(name = "order_amt")
    private Integer orderAmt;

    /**
     * 할인금액 (총액)
     */
    @Column(name = "discount_amt")
    private Integer discountAmt;

    /**
     * 봉사료 금액
     */
    @Column(name = "service_amt")
    private Integer serviceAmt;

    /**
     * 배달대행 일련번호
     */
    @Column(name = "dlvy_no")
    private Integer dlvyNo;

    /**
     * 배달대행 건수
     */
    @Column(name = "dlvy_cnt")
    private Integer dlvyCnt;

    /**
     * 배달대행 금액
     */
    @Column(name = "dlvy_amt")
    private Integer dlvyAmt;

    /**
     * 배차 배송원
     */
    @Column(name = "worker_no")
    private Long workerNo;

    /**
     * 배차 배송원 이름
     */
    @Column(name = "worker_name", length = 40)
    private String workerName;

    /**
     * 도착_주소_5 (사용자 입력주소)
     */
    @Column(name = "dest_addr_5", length = 200)
    private String destAddr5;

    /**
     * 수정_메모
     */
    @Column(name = "update_memo", length = 500)
    private String updateMemo;

    /**
     * 수정_사용자_구분 (0: 마스터/시스템, 1: 제휴본사, 2: 총판, 3: 가맹점, 4: 배송원, 5: 고객, 6: 상담원)
     */
    @Column(name = "update_user_type")
    @Enumerated(EnumType.ORDINAL)
    private UserType updateUserType;

    /**
     * 요금결제_방식 (1: 현금, 2: 카드, 3: 캐시)
     */
    @Column(name = "pay_method")
    @Enumerated(EnumType.ORDINAL)
    private PayMethodType payMethod;

    /**
     * 배달대행_요금결제_방식 (1: 현금, 2: 카드, 3: 캐시)
     */
    @Column(name = "dlvy_pay_method")
    @Enumerated(EnumType.ORDINAL)
    private DlvyPayMethodType dlvyPayMethod;

    @PrePersist
    private void defaultInit() {
        this.updateScn = 1;
        this.updateDate = LocalDateTime.now();
    }

}
