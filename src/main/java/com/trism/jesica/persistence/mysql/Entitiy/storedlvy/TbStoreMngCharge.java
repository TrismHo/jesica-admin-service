package com.trism.jesica.persistence.mysql.Entitiy.storedlvy;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbStore;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 가맹점_배송관리비
 */
@Entity
@Table(name = "tb_store_mng_charge")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@DynamicInsert
@DynamicUpdate
public class TbStoreMngCharge implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 가맹점_번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "store_no",insertable = true, updatable = false)
    private Long storeNo;

    /**
     * 제휴본사 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_no" , insertable = false, updatable = false)
    @JsonManagedReference
    private TbStore store;

    /**
     * 배송관리비 부과 여부
     */
    @Column(name = "mng_charge_yn")
    private Integer mngChargeYn = 1;


    /**
     * 관리비_정산_타입(1:월차감, 2:일차감)
     */
    @Column(name = "mng_charge_type")
    private Integer mngChargeType = 1;

    /**
     * 관리비_정산_대상(1:소속총판, 2:소속배송그룹)
     */
    @Column(name = "mng_target_type")
    private Integer mngTargetType = 1;

    /**
     * 금액
     */
    @Column(name = "mng_price")
    private Integer mngPrice = 0;

    /**
     * 차감시작일(YYMMDD)
     */
    @Column(name = "mng_charge_start")
    private String mngChargeStart = null;

    /**
     * 차감일(1~29:말일) - 월차감만 적용
     */
    @Column(name = "mng_charge_day")
    private Integer mngChargeDay = null;

    /**
     * 플랫폼사용료 부과 여부
     */
    @Column(name = "plf_charge_yn")
    private Integer plfChargeYn = 1;

    /**
     * 플랫폼 월사용료
     */
    @Column(name = "plf_price")
    private Integer plfPrice = 1;

    /**
     * 차감시작일(YYYYMMDD)
     */
    @Column(name = "plf_charge_start")
    private String plfChargeStart = null;

    /**
     * 차감일(1~29:말일) - 월차감만 적용
     */
    @Column(name = "plf_charge_day")
    private Integer plfChargeDay = 1;

}
