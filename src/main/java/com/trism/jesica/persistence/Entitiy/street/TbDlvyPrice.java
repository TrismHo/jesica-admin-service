package com.trism.jesica.persistence.Entitiy.street;

import com.trism.jesica.persistence.core.entity.CreatedDateEntity;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * 배송_요금설정
 */
@Entity
@Table(name = "tb_dlvy_price")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbDlvyPrice extends CreatedDateEntity {
    private static final long serialVersionUID = 1L;
    /**
     * 요금_번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "price_no", insertable = false, nullable = false)
    private Long priceNo;

    /**
     * 구간요금제_번호
     */
    @Column(name = "price_charge_no", nullable = false)
    private Long priceChargeNo;

    /**
     * 요일(1~7;월~일)
     */
    @Column(name = "day", nullable = false)
    private Integer day;

    /**
     * 시작시간(0~23)
     */
    @Column(name = "start_time", nullable = false)
    private Integer startTime;

    /**
     * 종료시간(1~24)
     */
    @Column(name = "end_time", nullable = false)
    private Integer endTime;

    /**
     * 입력_사용자ID
     */
    @Column(name = "insert_user_id")
    private String insertUserId = null;

    /**
     * 수정_일시
     */
    @Column(name = "update_date")
    private Timestamp updateDate;

    /**
     * 수정_사용자ID
     */
    @Column(name = "update_user_id")
    private String updateUserId = null;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    @Column(name = "data_status", nullable = false)
    private Integer dataStatus = 1;

    /**
     * 거리반경(meter) - 미만
     */
    @Column(name = "radius")
    private Integer radius = null;

    /**
     * 요금_1건
     */
    @Column(name = "price_1")
    private Integer price1 = null;

    /**
     * 요금_2건
     */
    @Column(name = "price_2")
    private Integer price2 = null;

    /**
     * 요금_3건
     */
    @Column(name = "price_3")
    private Integer price3 = null;

    
}