package com.trism.jesica.dto;


import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class TbCallDayRelayDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 주문_일련번호
     */
    private Long orderNo;


    /**
     * 릴레이_단계(1 or 2)
     */
    private Integer relayStep;


    /**
     * 출발_장소_구분 (0:일반, 1:제시카존, 2:공항, 2:여객터미널, 4:올레길)
     */
    private Integer departPlaceType;


    /**
     * 출발_명칭
     */
    private String departPoi;


    /**
     * 출발_주소_1 (시도)
     */
    private String departAddr1;


    /**
     * 출발_주소_2 (시군구)
     */
    private String departAddr2;


    /**
     * 출발_주소_3 (읍면동/도로명)
     */
    private String departAddr3;


    /**
     * 출발_주소_4 (나머지 주소)
     */
    private String departAddr4;


    /**
     * 출발_주소_5 (사용자입력)
     */
    private String departAddr5;


    /**
     * 출발_위도
     */
    private BigDecimal departLat;


    /**
     * 출발_경도
     */
    private BigDecimal departLng;


    /**
     * 도착_장소_구분(0 : 일반, 1 : 제시카존, 2 : 공항, 2 : 여객터미널, 4 : 올레길)
     */
    private Integer destPlaceType;


    /**
     * 도착_명칭
     */
    private String destPoi;


    /**
     * 도착_주소_1(시도)
     */
    private String destAddr1;


    /**
     * 도착_주소_2(시군구)
     */
    private String destAddr2;


    /**
     * 도착_주소_3(읍면동/도로명)
     */
    private String destAddr3;


    /**
     * 도착_주소_4(나머지 주소)
     */
    private String destAddr4;


    /**
     * 도착_주소_5(사용자입력)
     */
    private String destAddr5;


    /**
     * 도착_위도
     */
    private BigDecimal destLat;


    /**
     * 도착_경도
     */
    private BigDecimal destLng;


    /**
     * 경유_장소_구분 (0:일반, 1:제시카존, 2:공항, 2:여객터미널, 4:올레길)
     */
    private Integer viaPlaceType;


    /**
     * 경유지_명칭
     */
    private String viaPoi;


    /**
     * 경유지_위도
     */
    private BigDecimal viaLat;


    /**
     * 경유지_경도
     */
    private BigDecimal viaLng;


    /**
     * 배달_거리 (미터단위)
     */
    private Integer dlvyDistance;


    /**
     * 배달_기본금액
     */
    private Integer dlvyAmt;


    /**
     * 배달_할증_요금
     */
    private Integer dlvyExtraCharge;


    /**
     * 배달_총금액
     */
    private Integer dlvyTotalAmt;


    /**
     * 배달취소_패널티_금액
     */
    private Integer dlvyPenaltyAmt;


    /**
     * 출발_연락처
     */
    private String departTel;


    /**
     * 출발_메모
     */
    private String departMemo;


    /**
     * 도착_연락처
     */
    private String destTel;


    /**
     * 도착_메모
     */
    private String destMemo;

}
