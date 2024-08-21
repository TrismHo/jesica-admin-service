package com.trism.jesica.persistence.mysql.Entitiy.call;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 탁송_정산
 */
@Data
@Entity
@Table(name = "tb_call_charge")
public class TbCallCharge implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 주문_일련번호
     */
    @Id
    @Column(name = "order_no", insertable = false, nullable = false)
    private Long orderNo;

    /**
     * 입력_일시
     */
    @Column(name = "insert_date")
    private LocalDateTime insertDate;

    /**
     * 취소정산_여부(0:정상, 1:취소)
     */
    @Column(name = "cancel_yn")
    private Integer cancelYn = null;

    /**
     * 주문 구분 코드 (SYS_TYPE = OT)
     */
    @Column(name = "order_type_code")
    private String orderTypeCode = null;

    /**
     * 발주_그룹_번호
     */
    @Column(name = "give_dlvy_no")
    private Integer giveDlvyNo = null;

    /**
     * 발주_총판_번호
     */
    @Column(name = "give_branch_no")
    private Integer giveBranchNo = null;

    /**
     * 발주_가맹점_번호
     */
    @Column(name = "give_store_no")
    private Integer giveStoreNo = null;

    /**
     * 수주_그룹_번호
     */
    @Column(name = "accept_dlvy_no")
    private Integer acceptDlvyNo = null;

    /**
     * 수주_총판_번호
     */
    @Column(name = "accept_branch_no")
    private Integer acceptBranchNo = null;

    /**
     * 수주가맹점_번호
     */
    @Column(name = "accept_store_no")
    private Integer acceptStoreNo = null;


    /**
     * 기사_번호
     */
    @Column(name = "worker_no")
    private Integer workerNo = null;

    /**
     * 기사_이름
     */
    @Column(name = "worker_name")
    private String workerName = null;

    /**
     * 수주_그룹_번호 (콜2)
     */
    @Column(name = "accept_dlvy_no_2")
    private String acceptDlvyNo2 = null;

    /**
     * 수주_총판_번호(콜2)
     */
    @Column(name = "accept_branch_no_2")
    private String acceptBranchNo2 = null;

    /**
     * 수주_총판_번호(콜2)
     */
    @Column(name = "accept_store_no_2")
    private String acceptStoreNo2 = null;

    /**
     * 기사번호(콜2)
     */
    @Column(name = "worker_no_2")
    private String workerNo2 = null;

    /**
     * 기사이름(콜2)
     */
    @Column(name = "worker_name_2")
    private String workerName2 = null;


    /**
     * 주문_금액 (총액)
     */
    @Column(name = "order_amt")
    private Integer orderAmt = 0;

    /**
     * 부가서비스_금액
     */
    @Column(name = "service_amt")
    private Integer serviceAmt = 0;

    /**
     * 할인_금액 (쿠폰 등)
     */
    @Column(name = "discount_amt")
    private Integer discountAmt = 0;

    /**
     * 총금액(주문 + 부가서비스 - 할인금액)
     */
    @Column(name = "total_amt")
    private Integer totalAmt = 0;

    /**
     * 고객지불금액(현금)
     */
    @Column(name = "pay_amt")
    private Integer payAmt = 0;

    /**
     * 고객지불금액(카드)
     */
    @Column(name = "pay_amt_cc")
    private Integer payAmtCc = 0;

    /**
     * 고객지불금액(포인트)
     */
    @Column(name = "pay_amt_pt")
    private Integer payAmtPt = 0;

    /**
     * 배달료_총금액(배달대행료+할증)
     */
    @Column(name = "dlvy_total_amt")
    private Integer dlvyTotalAmt = null;

    /**
     * 기사_정산금액(배달총금액-배달관리비)
     */
    @Column(name = "worker_income")
    private Integer workerIncome = null;

    /**
     * 배달관리비
     */
    @Column(name = "mng_price")
    private Integer mngPrice = null;

    /**
     * 배달관리비_정산_구분(1: 정액, 2: 정률) - 건당관리비 기준
     */
/*    @Column(name = "mng_rate_type")
    private Integer mngRateType = null;*/

    /**
     * 배달료_총금액(배달대행료_할증) (콜2)
     */
    @Column(name = "dlvy_total_amt_2")
    private Integer dlvyTotalAmt2 = null;

    /**
     * 기사_정산금액(배달총금액-배달관리비) (콜2)
     */
    @Column(name = "worker_income_2")
    private Integer workerIncome2 = null;

    /**
     * 배달관리비(기사수수료) (콜2)
     */
    @Column(name = "mng_price_2")
    private Integer mngPrice2 = null;

    /**
     * 선결제_입금액
     */
    @Column(name = "pg_income")
    private Integer pgIncome = null;

    /**
     * PG_수수료
     */
    @Column(name = "pg_charge")
    private Integer pgCharge = null;

    /**
     * 중계_수수료
     */
    @Column(name = "call_charge")
    private Integer callCharge = null;

    /**
     * 쿠폰정산금
     */
    @Column(name = "coupon_income")
    private Integer couponIncome = null;




}
