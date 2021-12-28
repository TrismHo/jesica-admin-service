package com.trism.jesica.persistence.Entitiy.block;

import com.trism.jesica.persistence.core.entity.BaseEntity;
import lombok.Data;

import javax.persistence.*;

/**
 * 배송_블록설정
 */
@Table(name = "tb_dlvy_area")
@Data
@Entity
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
    @Column(name = "area_charge_no")
    private Long areaChargeNo;


    /**
     * 입력_사용자ID
     */
    @Column(name = "insert_user_id")
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
     * 블럭_요금
     */
    @Column(name = "area_price", nullable = false)
    private Integer areaPrice = 0;

    /**
     * 적용_순서
     */
    @Column(name = "view_order")
    private Integer viewOrder = null;

    
}