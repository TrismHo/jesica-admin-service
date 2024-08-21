package com.trism.jesica.persistence.mysql.Entitiy.call;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.time.LocalDateTime;


/**
 * 탁송_수정이력
 */

@Table(name = "tb_call_history")
@Data
@Entity
public class TbCallHistory implements Serializable {
    private static final long serialVersionUID = 1L;


/**
     * 주문_일련번호
     */

    @Id
    @Column(name = "order_no", nullable = false)
    private Long orderNo;


/**
     * 수정_일시
     */

    @Column(name = "update_date", nullable = false)
    private LocalDateTime updateDate;


/**
     * 수정_일련번호
     */

    @Column(name = "update_scn", nullable = false)
    private Integer updateScn = 1;


/**
     * 수정_사용자_고유ID
     */

    @Column(name = "update_user_no")
    private Integer updateUserNo = null;


/**
     * 수정_사용자_구분 (0: 마스터/시스템, 1: 제휴본사, 2: 총판, 3: 가맹점, 4: 배송원, 5: 고객, 6: 상담원)
     */

    @Column(name = "update_user_type")
    private Integer updateUserType = null;


/**
     * 주문_구분_코드 (SYS_TYPE = OT)
     */

    @Column(name = "order_type_code")
    private String orderTypeCode = null;


/**
     * 주문_상태_코드 (SYS_TYPE = OH)
     */

    @Column(name = "order_status_code")
    private String orderStatusCode = null;


/**
     * 결제상태(1: 결제완료, 2: 부분결제, 3: 미결제, 4: 결제대기)
     */

    @Column(name = "order_pay_status")
    private Integer orderPayStatus = null;


/**
     * 배달그룹_일련번호
     */

    @Column(name = "dlvy_no")
    private Integer dlvyNo = null;


/**
     * 배차_기사번호
     */

    @Column(name = "worker_no")
    private Integer workerNo = null;


/**
     * 배차_기사명
     */

    @Column(name = "worker_name")
    private String workerName = null;


/**
     * 출발_주소_5 (사용자 입력주소)
     */

    @Column(name = "depart_addr_5")
    private String departAddr5 = null;


/**
     * 도착_주소_5 (사용자 입력주소)
     */

    @Column(name = "dest_addr_5")
    private String destAddr5 = null;


/**
     * 주문_금액 (총액)
     */

    @Column(name = "order_amt")
    private Integer orderAmt = null;


/**
     * 할인_금액 (총액)
     */

    @Column(name = "discount_amt")
    private Integer discountAmt = null;


/**
     * 부가서비스_금액
     */

    @Column(name = "service_amt")
    private Integer serviceAmt = null;


/**
     * 배달대행_금액
     */

    @Column(name = "dlvy_amt")
    private Integer dlvyAmt = null;


/**
     * 수정_메모
     */

    @Column(name = "update_memo")
    private String updateMemo = null;


}
