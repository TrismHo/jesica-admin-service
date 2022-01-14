package com.trism.jesica.persistence.Entitiy.goods;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * 가맹점_수수료
 */
@Data
@Table(name = "tb_store_price")
@Entity
public class TbStorePrice implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 가맹점_번호
     */
    @Id
    @Column(insertable = false, name = "store_no", nullable = false)
    private Long storeNo;

    /**
     * 가맹점설정_사용여부(0:총판설정 사용, 1:가맹점설정 사용)
     */
    @Column(name = "use_yn")
    private Integer useYn = 0;

    /**
     * 거리구간요금_사용여부(0:거리구간요금 사용, 1:미터요금 사용)
     */
    @Column(name = "meter_use_yn")
    private Integer meterUseYn = 1;

    /**
     * [고객요금]기본요금
     */
    @Column(name = "meter_price")
    private Integer meterPrice = 0;

    /**
     * [고객요금]추가요금
     */
    @Column(name = "meter_addition")
    private Integer meterAddition = 0;

    /**
     * [고객요금]최대요금
     */
    @Column(name = "meter_maximum")
    private Integer meterMaximum = 0;

    /**
     * [고객요금]기본거리
     */
    @Column(name = "meter_base_distance")
    private Integer meterBaseDistance = 0;

    /**
     * [고객요금]추가거리
     */
    @Column(name = "meter_add_distance")
    private Integer meterAddDistance = 0;

    /**
     * [배송요금]기본요금
     */
    @Column(name = "dlvy_price")
    private Integer dlvyPrice = 0;

    /**
     * [배송요금]추가요금
     */
    @Column(name = "dlvy_addition")
    private Integer dlvyAddition = 0;

    /**
     * [배송요금]최대요금
     */
    @Column(name = "dlvy_maximum")
    private Integer dlvyMaximum = 0;

    /**
     * [배송요금]기본거리
     */
    @Column(name = "dlvy_base_distance")
    private Integer dlvyBaseDistance = 0;

    /**
     * [배송요금]추가거리
     */
    @Column(name = "dlvy_add_distance")
    private Integer dlvyAddDistance = 0;

    /**
     * 요일할증_사용여부(0:사용안함, 1:할증사용)
     */
    @Column(name = "day_charge_yn")
    private Integer dayChargeYn = 0;

    /**
     * 요일할증_금액
     */
    @Column(name = "day_charge")
    private Integer dayCharge = 0;

    /**
     * 적용요일(일월화수목금토)
     */
    @Column(name = "day_filter")
    private String dayFilter = "'0000000'";

    /**
     * 시간할증_사용여부(0:사용안함, 1:할증사용)
     */
    @Column(name = "time_charge_yn")
    private Integer timeChargeYn = 0;

    /**
     * 시간할증_금액
     */
    @Column(name = "time_charge")
    private Integer timeCharge = 0;

    /**
     * 시간할증_시작시간(HHMM)
     */
    @Column(name = "time_start")
    private String timeStart = "'0000'";

    /**
     * 시간할증_종료시간(HHMM)
     */
    @Column(name = "time_end")
    private String timeEnd = "'0000'";

    /**
     * 눈비할증_사용여부(0:사용안함, 1:할증사용)
     */
    @Column(name = "weather_charge_yn")
    private Integer weatherChargeYn = 0;

    /**
     * 눈비할증_금액
     */
    @Column(name = "weather_charge")
    private Integer weatherCharge = 0;

    /**
     * 서비스지역 블럭설정 사용여부
     */
    @Column(name = "service_area_yn")
    private Integer serviceAreaYn = 0;

    
}