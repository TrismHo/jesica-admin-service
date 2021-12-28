package com.trism.jesica.persistence.Entitiy.cust;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.core.entity.BaseEntity;
import com.trism.jesica.persistence.type.DataStatus;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "tb_cust_addr")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbCustAddr extends BaseEntity {

    /**
     * 고객 주소 일련번호
     */
    @Id
    @Column(name = "cust_addr_no")
    private Long custAddrNo;

    /**
     * 고객 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cust_no", referencedColumnName = "cust_no")
    @JsonManagedReference
    private TbCust cust;


    /**
     * 데이터 상태(0. 삭제, 1. 정상)
     */
    @Column(name = "data_status")
    @Enumerated(EnumType.ORDINAL)
    private DataStatus dataStatus;

    /**
     * 주소 별칭
     */
    @Column(name = "addr_name")
    private String addrName;

    /**
     * 위도
     */
    @Column(name = "lat")
    private BigDecimal lat;

    /**
     * 경도
     */
    @Column(name = "lng")
    private BigDecimal lng;

    /**
     * 주소_1 (레벨1)
     */
    @Column(name = "addr_1")
    private String addr1;

    /**
     * 주소_2 (레벨2)
     */
    @Column(name = "addr_2")
    private String addr2;

    /**
     * 주소_3 (레벨3)
     */
    @Column(name = "addr_3")
    private String addr3;

    /**
     * 주소_4 (레벨4)
     */
    @Column(name = "addr_4")
    private String addr4;

    /**
     * 주소_5 (사용자 입력주소)
     */
    @Column(name = "addr_5")
    private String addr5;

    @PrePersist
    private void init() {
        this.dataStatus = DataStatus.OK;
    }
}
