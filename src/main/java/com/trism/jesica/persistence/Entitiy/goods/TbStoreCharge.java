package com.trism.jesica.persistence.Entitiy.goods;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 가맹점_수수료
 */
@Table(name = "tb_store_charge")
@Data
@Entity
public class TbStoreCharge implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 가맹점_번호
     */
    @Id
    @Column(insertable = false, name = "store_no", nullable = false)
    private Long storeNo;

    /**
     * 선결제 수수료
     */
    @Column(name = "pg_charge")
    private BigDecimal pgCharge = BigDecimal.ZERO;

    /**
     * 1: 정액(flat rate), 2: 정률(fixed rate)
     */
    @Column(name = "pg_rate_type")
    private Integer pgRateType = 1;

    /**
     * 인수대행_사용여부(0:미사용, 1:사용)
     */
    @Column(name = "takeover_use_yn")
    private Integer takeoverUseYn = 0;

    /**
     * 인수대행_선결제수수료
     */
    @Column(name = "takeover_charge")
    private BigDecimal takeoverCharge = BigDecimal.ZERO;

    /**
     * 1: 정액(flat rate), 2: 정률(fixed rate)
     */
    @Column(name = "takeover_rate_type")
    private Integer takeoverRateType = 1;

    /**
     * 반납대행_사용여부(0:미사용, 1:사용)
     */
    @Column(name = "return_use_yn")
    private Integer returnUseYn = 0;

    /**
     * 반납대행_선결제수수료
     */
    @Column(name = "return_charge")
    private BigDecimal returnCharge = BigDecimal.ZERO;

    /**
     * 1: 정액(flat rate), 2: 정률(fixed rate)
     */
    @Column(name = "return_rate_type")
    private Integer returnRateType = 1;

    /**
     * 마이카탁송_사용여부(0:미사용, 1:사용)
     */
    @Column(name = "mycar_use_yn")
    private Integer mycarUseYn = 0;

    /**
     * 마이카탁송_선결제수수료
     */
    @Column(name = "mycar_charge")
    private BigDecimal mycarCharge = BigDecimal.ZERO;

    /**
     * 1: 정액(flat rate), 2: 정률(fixed rate)
     */
    @Column(name = "mycar_rate_type")
    private Integer mycarRateType = 1;

    /**
     * 올레길탁송_사용여부(0:미사용, 1:사용)
     */
    @Column(name = "olle_use_yn")
    private Integer olleUseYn = 0;

    /**
     * 올레길탁송_선결제수수료
     */
    @Column(name = "olle_charge")
    private BigDecimal olleCharge = BigDecimal.ZERO;

    /**
     * 1: 정액(flat rate), 2: 정률(fixed rate)
     */
    @Column(name = "olle_rate_type")
    private Integer olleRateType = 1;

    
}