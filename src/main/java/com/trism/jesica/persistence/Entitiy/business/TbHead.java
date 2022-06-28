package com.trism.jesica.persistence.Entitiy.business;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.config.EmptyStringToNullConverter;
import com.trism.jesica.persistence.core.entity.BaseEntity;
import com.trism.jesica.persistence.type.DataStatus;
import com.trism.jesica.persistence.type.ServiceYn;
import lombok.*;
import lombok.experimental.Accessors;
import org.apache.commons.lang3.ObjectUtils;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.List;

/**
 * 제휴본사
 */
@Entity
@Table(name = "tb_head")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@Getter
//@AllArgsConstructor
//@Builder
@ToString(callSuper = true, exclude = {"branches"})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbHead extends BaseEntity {

    /**
     * 제휴본사
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "head_no", nullable = false)
    private Long headNo;

    @Column(name = "brand_no")
    private Integer brandNo;

    /**
     * 브랜드 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "brand_no", insertable = false, updatable = false)
    @JsonManagedReference
    private TbBrand brand;

    /**
     * 입력 사용자 고유 ID
     */
    @Column(name = "insert_user_id", length = 20)
    private String insertUserId;

    /**
     * 수정 사용자 고유 ID
     */
    @Column(name = "update_user_id", length = 20)
    private String updateUserId;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    @Column(name = "data_status")
    @Enumerated(EnumType.ORDINAL)
    private DataStatus dataStatus;

    /**
     * 서비스노출_여부 (1: 서비스, 0: 테스트 또는 정산용)
     */
    @Column(name = "service_yn")
    @Enumerated(EnumType.ORDINAL)
    private ServiceYn serviceYn;

    /**
     * 제휴본사 이름
     */
    @Column(name = "head_name", length = 40, nullable = false)
    private String headName;

    /**
     * 제휴본사 대표번호
     */
    @Column(name = "head_tel", length = 20)
    private String headTel;

    /**
     * 인증 전화번호
     */
    @Convert(converter = EmptyStringToNullConverter.class)
    @Column(name = "auth_tel", length = 20)
    private String authTel;

    /**
     * 예치금
     */
    @Column(name = "deposit")
    private Integer deposit;

    /**
     * 캐쉬
     */
    @Column(name = "cash")
    private Integer cash;

    /**
     * 캐쉬 체납금
     */
    @Column(name = "cash_default")
    private Integer cashDefault;

    /**
     * 메모 주요업종
     */
    @Convert(converter = EmptyStringToNullConverter.class)
    @Column(name = "memo_service", length = 200)
    private String memoService;

    /**
     * 메모 주요지역
     */
    @Convert(converter = EmptyStringToNullConverter.class)
    @Column(name = "memo_area", length = 200)
    private String memoArea;

    /**
     * 기타
     */
    @Convert(converter = EmptyStringToNullConverter.class)
    @Column(name = "memo_etc", length = 200)
    private String memoEtc;

    /**
     * 가상계좌_은행구분_코드 (SYS_TYPE = CBT)
     */
    @Convert(converter = EmptyStringToNullConverter.class)
    @Column(name = "cybank_type_code", length = 4)
    private String cybankTypeCode;

    /**
     * 가상 계좌 번호
     */
    @Convert(converter = EmptyStringToNullConverter.class)
    @Column(name = "cybank_account", length = 20)
    private String cybankAccount;

    /**
     * PIN_번호 (출금비밀번호)
     */
    @Convert(converter = EmptyStringToNullConverter.class)
    @Column(name = "pin_num", length = 100)
    private String pinNum;

    /**
     * 인출은행_구분_코드 (SYS_TYPE = BT)
     */
    @Convert(converter = EmptyStringToNullConverter.class)
    @Column(name = "bank_type_code", length = 4)
    private String bankTypeCode;

    /**
     * 인출은행 계좌번호
     */
    @Convert(converter = EmptyStringToNullConverter.class)
    @Column(name = "bank_account", length = 20)
    private String bankAccount;

    /**
     * 인출은행 예금주
     */
    @Convert(converter = EmptyStringToNullConverter.class)
    @Column(name = "bank_owner", length = 40)
    private String bankOwner;

    /**
     * 배송그룹 관리기능 여부 (true, false)
     */
    @Column(name = "dlvy_mng_yn")
    private Boolean dlvyMngYn;

    /**
     * 실제 운영자
     */
    @Convert(converter = EmptyStringToNullConverter.class)
    @Column(name = "actual_owner", length = 40)
    private String actualOwner;

    /**
     * 실제 주소
     */
    @Convert(converter = EmptyStringToNullConverter.class)
    @Column(name = "actual_addr", length = 200)
    private String actualAddr;

    /**
     * 실제 연락처
     */
    @Convert(converter = EmptyStringToNullConverter.class)
    @Column(name = "actual_tel", length = 20)
    private String actualTel;

    /**
     * 가상계좌 예금주
     */
    @Convert(converter = EmptyStringToNullConverter.class)
    @Column(name = "cybank_owner ", length = 20)
    private String cybankOwner;

    /**
     * 총판 (양방향 매핑)
     */
    @OneToMany(mappedBy = "head", fetch = FetchType.LAZY)
    @JsonBackReference
    private List<TbBranch> branches;

    /**
     * 사업자 정보
     */
    @OneToOne(fetch = FetchType.LAZY, mappedBy = "head", cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH})
    @JsonBackReference
    private TbHeadBusinessInfo businessInfo;


    @PrePersist
    public void init() {
        this.dataStatus = DataStatus.OK;
        this.serviceYn = ServiceYn.SERVICE;
        this.deposit = 0;
        this.cash = 0;
        this.cashDefault = 0;
        this.dlvyMngYn = true;
    }

    @Builder
    public TbHead(Long headNo, Integer brandNo, String insertUserId, String updateUserId, DataStatus dataStatus, ServiceYn serviceYn, String headName, String headTel, String authTel, Integer deposit, Integer cash, Integer cashDefault, String memoService, String memoArea, String memoEtc, String cybankTypeCode, String cybankAccount, String cybankOwner, String pinNum, String bankTypeCode, String bankAccount, String bankOwner, Boolean dlvyMngYn, String actualOwner, String actualAddr, String actualTel, TbHeadBusinessInfo businessInfo) {
        this.headNo = headNo;
        this.brandNo = brandNo;
        this.insertUserId = insertUserId;
        this.updateUserId = updateUserId;
        this.dataStatus = dataStatus;
        this.serviceYn = serviceYn;
        this.headName = headName;
        this.headTel = headTel;
        this.authTel = authTel;
        this.deposit = deposit;
        this.cash = cash;
        this.cashDefault = cashDefault;
        this.memoService = memoService;
        this.memoArea = memoArea;
        this.memoEtc = memoEtc;
        this.cybankTypeCode = cybankTypeCode;
        this.cybankAccount = cybankAccount;
        this.cybankOwner = cybankOwner;
        this.pinNum = pinNum;
        this.bankTypeCode = bankTypeCode;
        this.bankAccount = bankAccount;
        this.bankOwner = bankOwner;
        this.dlvyMngYn = dlvyMngYn;
        this.actualOwner = actualOwner;
        this.actualAddr = actualAddr;
        this.actualTel = actualTel;
        this.businessInfo = businessInfo;
        if (ObjectUtils.isNotEmpty(businessInfo)) {
            this.businessInfo = businessInfo;
            this.businessInfo.setHead(this);
        }
    }
}
