package com.trism.jesica.persistence.Entitiy.coupon;

import com.trism.jesica.persistence.core.entity.BaseEntity;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "tb_coupon")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbCoupon extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 쿠폰_일련번호
     */
    @Id
    @Column(name = "coupon_no", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long couponNo;

    /**
     * 등록_사용자_ID
     */
    @Column(name = "insert_user_id")
    private String insertUserId;

    /**
     * 변경_사용자_ID
     */
    @Column(name = "update_user_id")
    private String updateUserId;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    @Column(name = "data_status", nullable = false)
    private Integer dataStatus = 1;

    /**
     * 서비스타입 (2: 탁송, 3: 맛집, 4: 마트, 5: 맛집예약)
     */
    @Column(name = "service_type")
    private Integer serviceType;

    /**
     * 쿠폰_코드
     */
    @Column(name = "coupon_code")
    private String couponCode;

    /**
     * 제목
     */
    @Column(name = "title")
    private String title;

    /**
     * 유효기간_타입 (1: 만료일자, 2: 발급일기준)
     */
    @Column(name = "validity_type", nullable = false)
    private Integer validityType;

    /**
     * 만료일자
     */
    @Column(name = "expire_date")
    private LocalDateTime expireDate;

    /**
     * 발급일기준 n일후 만료
     */
    @Column(name = "valid_day")
    private Integer validDay;

    /**
     * 발급가능_시작일
     */
    @Column(name = "publish_start_date")
    private LocalDateTime publishStartDate;

    /**
     * 발급가능_종료일
     */
    @Column(name = "publish_end_date")
    private LocalDateTime publishEndDate;

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

    /**
     * 쿠폰발급_개수
     */
    @Column(name = "publish_count")
    private Integer publishCount = 0;

    /**
     * 최대_쿠폰발급가능_개수
     */
    @Column(name = "max_publish_count")
    private Integer maxPublishCount = 0;

    /**
     * (고객당)중복_발급가능_개수
     */
    @Column(name = "multi_publish_count")
    private Integer multiPublishCount = 1;

    /**
     * 내용
     */
    @Column(name = "body")
    private String body;

    @Builder
    public TbCoupon(
            Long couponNo,
            String insertUserId,
            String updateUserId,
            Integer serviceType,
            Integer validityType,
            LocalDateTime expireDate,
            Integer validDay,
            LocalDateTime publishStartDate,
            LocalDateTime publishEndDate,
            Integer dcRateType,
            Integer dcAmt,
            Integer maxDcAmt,
            Integer minPayAmt,
            Integer maxPublishCount,
            Integer multiPublishCount,
            String couponCode,
            String title,
            String body
    ) {
        this.couponNo = couponNo;
        this.insertUserId = insertUserId;
        this.updateUserId = updateUserId;
        this.serviceType = serviceType;
        this.validityType = validityType;
        this.expireDate = expireDate;
        this.validDay = validDay;
        this.publishStartDate = publishStartDate;
        this.publishEndDate = publishEndDate;
        this.dcRateType = dcRateType;
        this.dcAmt = dcAmt;
        this.maxDcAmt = maxDcAmt;
        this.minPayAmt = minPayAmt;
        this.maxPublishCount = maxPublishCount;
        this.multiPublishCount = multiPublishCount;
        this.couponCode = couponCode;
        this.title = title;
        this.body = body;
    }

    public void updateDisabledTbCoupon() {
        this.dataStatus = 0;
    }
}
