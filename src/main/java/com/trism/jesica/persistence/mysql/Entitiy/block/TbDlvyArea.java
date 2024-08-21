package com.trism.jesica.persistence.mysql.Entitiy.block;

import com.trism.jesica.persistence.mysql.core.entity.BaseEntity;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 배송_블록설정
 */

@Entity
@Table(name = "tb_dlvy_area")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@Setter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbDlvyArea extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 블록ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(insertable = false, name = "area_no", nullable = false)
    private Long areaNo;

    /**
     * 입력_사용자ID
     */
    @Column(name = "group_no")
    private Long groupNo;

    /**
     * 업무그룹 구분
     */
    @Column(name = "group_type")
    private Integer groupType;

    /**
     * 입력_사용자ID
     */
    @Column(name = "insert_user_id",updatable =  false)
    private String insertUserId = null;

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
     * 블럭_명
     */
    @Column(name = "area_name")
    private String areaName = null;

    /**
     * 블럭요금 구분(0: 서비스 지역 , 1:고정요금 , 2:추가요금)
     */
    @Column(name = "area_charge_type")
    private Integer areaChargeType;

    /**
     * 블럭_요금
     */
    @Column(name = "cust_price", nullable = false)
    private Integer custPrice = 0;

    /**
     * 블럭_요금
     */
    @Column(name = "dlvy_price", nullable = false)
    private Integer dlvyPrice = 0;

    /**
     * 적용_순서
     */
    @Column(name = "view_order")
    private Integer viewOrder = null;

    public TbDlvyArea insertData() {
        return TbDlvyArea.builder()
                .areaNo(this.areaNo)
                .groupNo(this.groupNo)
                .groupType(this.groupType)
                .insertUserId(this.insertUserId)
                .dataStatus(this.dataStatus)
                .areaName(this.areaName)
                .areaChargeType(this.areaChargeType)
                .custPrice(this.custPrice)
                .dlvyPrice(this.dlvyPrice)
                .build();
    }

}
