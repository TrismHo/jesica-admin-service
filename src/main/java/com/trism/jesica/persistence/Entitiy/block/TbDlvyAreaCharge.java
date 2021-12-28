package com.trism.jesica.persistence.Entitiy.block;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.Entitiy.business.TbBranch;
import com.trism.jesica.persistence.Entitiy.business.TbHead;
import com.trism.jesica.persistence.core.entity.CreatedDateEntity;
import com.trism.jesica.persistence.type.DataStatus;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 배송_블럭요금제
 */
@Entity
@Table(name = "tb_dlvy_area_charge")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbDlvyAreaCharge extends CreatedDateEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 블럭요금제_번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "area_charge_no", insertable = false, nullable = false)
    private Long areaChargeNo;


    @Column(name = "head_no",insertable = true, updatable = false)
    private Long headNo;

    @Column(name = "branch_no",insertable = true, updatable = false )
    private Long branchNo;

    /**
     * 제휴본사 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "head_no" , insertable = false, updatable = false)
    @JsonManagedReference
    private TbHead head;

    /**
     * 총판 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "branch_no" , insertable = false, updatable = false)
    @JsonManagedReference
    private TbBranch branch;

    /**
     * 입력_사용자ID
     */
    @Column(name = "insert_user_id")
    private String insertUserId = null;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    @Column(name = "data_status", nullable = false)
    private DataStatus dataStatus = null;

    /**
     * 요금제_이름
     */
    @Column(name = "area_charge_name")
    private String areaChargeName = null;

    /**
     * 블럭_요금_구분(1:고정요금, 2:추가요금)
     */
    @Column(name = "area_charge_type")
    private Integer areaChargeType = 1;

    @Builder
    public TbDlvyAreaCharge(Long areaChargeNo, Long branchNo, Long headNo, String insertUserId, DataStatus dataStatus, String areaChargeName, Integer areaChargeType) {
        this.areaChargeNo = areaChargeNo;
        this.branchNo = branchNo;
        this.headNo = headNo;
        this.insertUserId = insertUserId;
        this.dataStatus = dataStatus;
        this.areaChargeName = areaChargeName;
        this.areaChargeType = areaChargeType;
    }

    
}