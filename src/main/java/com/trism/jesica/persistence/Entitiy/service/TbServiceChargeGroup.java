package com.trism.jesica.persistence.Entitiy.service;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.Entitiy.business.TbBranch;
import com.trism.jesica.persistence.Entitiy.business.TbHead;
import com.trism.jesica.persistence.core.entity.CreatedDateEntity;
import com.trism.jesica.persistence.type.DataStatus;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.*;

/**
 * 서비스_이용료_정산그룹
 */
@Table(name = "tb_service_charge_group")
@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
//@AllArgsConstructor
//@Builder
@Getter
@Setter
@ToString(callSuper = true, exclude = {""})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
public class TbServiceChargeGroup extends CreatedDateEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 정산그룹_번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(insertable = false, name = "charge_no", nullable = false)
    private Long chargeNo;

    /**
     * 등록_사용자
     */
    @Column(name = "insert_user_id")
    private String insertUserId = null;


    /**
     * 데이터_상태(0:삭제, 1:정상)
     */
    @Column(name = "data_status", nullable = false)
    private DataStatus dataStatus = null;

    /**
     * 정산그룹_이름
     */
    @Column(name = "charge_name")
    private String chargeName = null;


    @Column(name = "head_no",insertable = true, updatable = false)
    private Integer headNo;

    @Column(name = "branch_no",insertable = true, updatable = false )
    private Integer branchNo;

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


    @Builder
    private TbServiceChargeGroup(Long chargeNo , String insertUserId, DataStatus dataStatus,
                                 String chargeName, Integer headNo, Integer branchNo) {
        this.chargeNo = chargeNo;
        this.insertUserId = insertUserId;
        this.dataStatus = dataStatus;
        this.chargeName = chargeName;
        this.headNo = headNo;
        this.branchNo = branchNo;
    }

}