package com.trism.jesica.persistence.Entitiy.worker;

import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 드라이버_수수료
 */

@Entity
@Table(name = "tb_worker_charge")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@Getter
@ToString(callSuper = true, exclude = {})
@DynamicInsert
@DynamicUpdate
public class TbWorkerCharge implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 사용자_일련번호
     */
    @Id
    @Column(name = "worker_no", nullable = false)
    private Integer workerNo;

    /**
     * 일_관리비(원)
     */
    @Column(name = "daily_charge")
    private Integer dailyCharge = 0;

    /**
     * 월_관리비(원)
     */
    @Column(name = "monthly_charge")
    private Integer monthlyCharge = 0;

    /**
     * 인수대행 수수료
     */
    @Column(name = "takeover_charge")
    private BigDecimal takeoverCharge;

    /**
     * 1: 정액(flat rate), 2: 정률(fixed rate)
     */
    @Column(name = "takeover_rate_type")
    private Integer takeoverRateType = 1;

    /**
     * 인수대행 릴레이콜 수수료(인수)
     */
    @Column(name = "takeover_charge_1")
    private Integer takeoverCharge1 = 1;

    /**
     * 1:정액 , 2:정률
     */
    @Column(name = "takeover_rate_type_1")
    private Integer takeoverRateType1 = 1;

    /**
     * 인수대행 릴레이콜 수수료(마중)
     */
    @Column(name = "takeover_charge_2")
    private Integer takeoverCharge2 = 1;

    /**
     * 1:정액 , 2:정률
     */
    @Column(name = "takeover_rate_type_2")
    private Integer takeoverRateType2 = 1;

    /**
     * 반납대행 수수료
     */
    @Column(name = "return_charge")
    private BigDecimal returnCharge;

    /**
     * 1: 정액(flat rate), 2: 정률(fixed rate)
     */
    @Column(name = "return_rate_type")
    private Integer returnRateType = 1;

    /**
     * 마이카탁송 수수료
     */
    @Column(name = "mycar_charge")
    private BigDecimal mycarCharge;

    /**
     * 1: 정액(flat rate), 2: 정률(fixed rate)
     */
    @Column(name = "mycar_rate_type")
    private Integer mycarRateType = 1;

    /**
     * 올레길탁송 수수료
     */
    @Column(name = "olle_charge")
    private BigDecimal olleCharge;

    /**
     * 1: 정액(flat rate), 2: 정률(fixed rate)
     */
    @Column(name = "olle_rate_type")
    private Integer olleRateType = 1;

    @Builder
    public TbWorkerCharge(
            Integer workerNo,
            Integer dailyCharge,
            Integer monthlyCharge,
            BigDecimal takeoverCharge,
            Integer takeoverRateType,
            BigDecimal returnCharge,
            Integer returnRateType,
            BigDecimal mycarCharge,
            Integer mycarRateType,
            BigDecimal olleCharge,
            Integer olleRateType
    ) {
        this.workerNo = workerNo;
        this.dailyCharge = dailyCharge;
        this.monthlyCharge = monthlyCharge;
        this.takeoverCharge = takeoverCharge;
        this.takeoverRateType = takeoverRateType;
        this.returnCharge = returnCharge;
        this.returnRateType = returnRateType;
        this.mycarCharge = mycarCharge;
        this.mycarRateType = mycarRateType;
        this.olleCharge = olleCharge;
        this.olleRateType = olleRateType;
    }
    
}