package com.trism.jesica.persistence.Entitiy.street;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.Entitiy.business.TbBranch;
import com.trism.jesica.persistence.Entitiy.business.TbHead;
import com.trism.jesica.persistence.core.entity.CreatedDateEntity;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 배송_거리구간요금제
 */
@Entity
@Table(name = "tb_dlvy_price_charge")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbDlvyPriceCharge extends CreatedDateEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 구간요금제_번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "price_charge_no", insertable = false, nullable = false)
    private Long priceChargeNo;


    /**
     * 입력_사용자ID
     */
    @Column(name = "insert_user_id")
    private String insertUserId = null;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    @Column(name = "data_status", nullable = false)
    private Integer dataStatus = 1;

    /**
     * 요금제_이름
     */
    @Column(name = "price_charge_name")
    private String priceChargeName = null;

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

    @Builder
    public TbDlvyPriceCharge(Long priceChargeNo, Long branchNo, Long headNo, String insertUserId, Integer dataStatus, String priceChargeName) {
        this.priceChargeNo = priceChargeNo;
        this.branchNo = branchNo;
        this.headNo = headNo;
        this.insertUserId = insertUserId;
        this.dataStatus = dataStatus;
        this.priceChargeName = priceChargeName;
    }

    
}