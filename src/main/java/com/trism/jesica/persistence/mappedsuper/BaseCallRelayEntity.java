package com.trism.jesica.persistence.mappedsuper;

import com.trism.jesica.persistence.id.TbCallRelayID;
import lombok.*;
import lombok.experimental.Accessors;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.MappedSuperclass;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 릴레이콜관리
 */
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@ToString(callSuper = true)
@IdClass(TbCallRelayID.class)
@Getter
@AllArgsConstructor
@MappedSuperclass
public abstract class BaseCallRelayEntity  implements Serializable {
    /**
     * 주문_일련번호
     */
    @Id
    @Column(name = "order_no", nullable = false)
    private Long orderNo;

    /**
     * 릴레이_단계(1 or 2)
     */
    @Id
    @Column(name = "relay_step", nullable = false)
    private Long relayStep;

    /**
     * 출발_장소_구분 (0:일반, 1:제시카존, 2:공항, 2:여객터미널, 4:올레길)
     */
    @Column(name = "depart_place_type")
    private Integer departPlaceType = 0;

    /**
     * 출발_명칭
     */
    @Column(name = "depart_poi")
    private String departPoi;

    /**
     * 출발_주소_1 (시도)
     */
    @Column(name = "depart_addr_1")
    private String departAddr1;

    /**
     * 출발_주소_2 (시군구)
     */
    @Column(name = "depart_addr_2")
    private String departAddr2;

    /**
     * 출발_주소_3 (읍면동/도로명)
     */
    @Column(name = "depart_addr_3")
    private String departAddr3;

    /**
     * 출발_주소_4 (나머지 주소)
     */
    @Column(name = "depart_addr_4")
    private String departAddr4;

    /**
     * 출발_주소_5 (사용자입력)
     */
    @Column(name = "depart_addr_5")
    private String departAddr5;

    /**
     * 출발_위도
     */
    @Column(name = "depart_lat")
    private BigDecimal departLat;

    /**
     * 출발_경도
     */
    @Column(name = "depart_lng")
    private BigDecimal departLng;

    /**
     * 도착_장소_구분(0 : 일반, 1 : 제시카존, 2 : 공항, 2 : 여객터미널, 4 : 올레길)
     */
    @Column(name = "dest_place_type")
    private Integer destPlaceType = 0;

    /**
     * 도착_명칭
     */
    @Column(name = "dest_poi")
    private String destPoi;

    /**
     * 도착_주소_1(시도)
     */
    @Column(name = "dest_addr_1")
    private String destAddr1;

    /**
     * 도착_주소_2(시군구)
     */
    @Column(name = "dest_addr_2")
    private String destAddr2;

    /**
     * 도착_주소_3(읍면동/도로명)
     */
    @Column(name = "dest_addr_3")
    private String destAddr3;

    /**
     * 도착_주소_4(나머지 주소)
     */
    @Column(name = "dest_addr_4")
    private String destAddr4;

    /**
     * 도착_주소_5(사용자입력)
     */
    @Column(name = "dest_addr_5")
    private String destAddr5;

    /**
     * 도착_위도
     */
    @Column(name = "dest_lat")
    private BigDecimal destLat;

    /**
     * 도착_경도
     */
    @Column(name = "dest_lng")
    private BigDecimal destLng;

    /**
     * 경유_장소_구분 (0:일반, 1:제시카존, 2:공항, 2:여객터미널, 4:올레길)
     */
    @Column(name = "via_place_type")
    private Integer viaPlaceType = 0;

    /**
     * 경유지_명칭
     */
    @Column(name = "via_poi")
    private String viaPoi;

    /**
     * 경유지_위도
     */
    @Column(name = "via_lat")
    private BigDecimal viaLat;

    /**
     * 경유지_경도
     */
    @Column(name = "via_lng")
    private BigDecimal viaLng;

    /**
     * 배달_거리 (미터단위)
     */
    @Column(name = "dlvy_distance")
    private Integer dlvyDistance = 0;

    /**
     * 배달_기본금액
     */
    @Column(name = "dlvy_amt")
    private Integer dlvyAmt = 0;

    /**
     * 배달_할증_요금
     */
    @Column(name = "dlvy_extra_charge")
    private Integer dlvyExtraCharge = 0;

    /**
     * 배달_총금액
     */
    @Column(name = "dlvy_total_amt")
    private Integer dlvyTotalAmt = 0;

    /**
     * 배달취소_패널티_금액
     */
    @Column(name = "dlvy_penalty_amt")
    private Integer dlvyPenaltyAmt = 0;

    /**
     * 출발_연락처
     */
    @Column(name = "depart_tel")
    private String departTel;

    /**
     * 출발_메모
     */
    @Column(name = "depart_memo")
    private String departMemo;

    /**
     * 도착_연락처
     */
    @Column(name = "dest_tel")
    private String destTel;

    /**
     * 도착_메모
     */
    @Column(name = "dest_memo")
    private String destMemo;

}
