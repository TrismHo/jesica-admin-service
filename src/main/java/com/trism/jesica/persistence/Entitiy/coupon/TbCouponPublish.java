package com.trism.jesica.persistence.Entitiy.coupon;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "jesicar_main.tb_coupon_publish")
public class TbCouponPublish implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 쿠폰발급_일련번호
     */
    @Id
    @Column(name = "publish_no", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long publishNo;

    /**
     * 고객_번호
     */
    @Column(name = "cust_no", nullable = false)
    private Integer custNo;

    /**
     * 쿠폰_번호
     */
    @Column(name = "coupon_no", nullable = false)
    private Integer couponNo;

    /**
     * 발급_일자
     */
    @Column(name = "insert_date")
    private LocalDateTime insertDate;

    /**
     * 만료_일자
     */
    @Column(name = "expire_date")
    private LocalDateTime expireDate;

    /**
     * 사용_일자
     */
    @Column(name = "use_date")
    private LocalDateTime useDate;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    @Column(name = "date_status")
    private Integer dateStatus;

    /**
     * 쿠폰사용여부 (0 : 미사용, 1 : 사용)
     */
    @Column(name = "use_yn")
    private Integer useYn = 0;

    /**
     * 서비스타입 (2: 탁송, 3: 맛집, 4: 마트, 5: 맛집예약)
     */
    @Column(name = "service_type")
    private Integer serviceType;

    /**
     * 주문_구분_코드 (SYS_TYPE = OT)
     */
    @Column(name = "order_type_code")
    private String orderTypeCode;

    /**
     * 할인 구분 (1: 할인금액, 2: 할인율)
     */
    @Column(name = "dc_rate_type", nullable = false)
    private Integer dcRateType;

    /**
     * 할인금액/할인율
     */
    @Column(name = "dc_amt")
    private Integer dcAmt;

    /**
     * 최대_할인금액
     */
    @Column(name = "max_dc_amt")
    private Integer maxDcAmt;

    /**
     * 최소_결제금액
     */
    @Column(name = "min_pay_amt")
    private Integer minPayAmt = 0;

}
