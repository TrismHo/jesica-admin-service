package com.trism.jesica.persistence.mysql.Entitiy.business;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.config.EmptyStringToNullConverter;
import com.trism.jesica.persistence.mysql.core.entity.BaseEntity;
import com.trism.jesica.persistence.mysql.type.DataStatus;
import com.trism.jesica.persistence.mysql.type.ServiceYn;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 총판
 */
@Entity
@Table(name = "tb_branch")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
//@AllArgsConstructor
//@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
//@SecondaryTable(name = "tb_business_info"
//        , pkJoinColumns = @PrimaryKeyJoinColumn(name = "group_no", referencedColumnName = "branch_no"))
public class TbBranchSub extends BaseEntity {
    /**
     * 총판 번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "branch_no")
    private Long branchNo;

/*    @Column(name = "head_no")
    private Integer headNo;*/


    /**
     * 제휴본사 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name ="head_no", insertable = false, updatable = false)
    @JsonManagedReference
    private TbHeadSub head;

    /**
     * 입력 사용자 고유 ID
     */
    @Column(name = "insert_user_id", length = 20)
    private String insertUserId;

    /**
     * 수정 사용자 고유 ID
     */
    @Convert(converter = EmptyStringToNullConverter.class)
    @Column(name = "update_user_id", length = 20)
    private String updateUserId;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    @Column(name = "data_status", nullable = false)
    @Enumerated(EnumType.ORDINAL)
    private DataStatus dataStatus;

    /**
     * 서비스노출_여부 (1: 서비스, 0: 테스트 또는 정산용)
     */
    @Column(name = "service_yn", nullable = false)
    @Enumerated(EnumType.ORDINAL)
    private ServiceYn serviceYn;

    /**
     * 배달대행 번호
     */
    @Column(name = "dlvy_no")
    private Integer dlvyNo;

    /**
     * 총판 이름
     */
    @Convert(converter = EmptyStringToNullConverter.class)
    @Column(name = "branch_name", length = 40, nullable = false)
    private String branchName;

    /**
     * 총판 대표번호
     */
    @Convert(converter = EmptyStringToNullConverter.class)
    @Column(name = "branch_tel", length = 20)
    private String branchTel;

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
     * 메모 주요 지역
     */
    @Convert(converter = EmptyStringToNullConverter.class)
    @Column(name = "memo_area", length = 200)
    private String memoArea;

    /**
     * 메모 기타
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
     * 가상계좌_번호
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
     * 사업자 정보
     */
/*    @OneToOne(mappedBy = "branch", fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH})
    @JsonBackReference
    private TbBranchBusinessInfo businessInfo;*/


    @PrePersist
    public void init() {
        this.dataStatus = DataStatus.OK;
        this.serviceYn = ServiceYn.SERVICE;
        this.deposit = 0;
        this.cash = 0;
        this.cashDefault = 0;
    }

    @Builder
    public TbBranchSub(Long branchNo, Integer headNo, String insertUserId, String updateUserId, DataStatus dataStatus, ServiceYn serviceYn, Integer dlvyNo, String branchName, String branchTel, String authTel, Integer deposit, Integer cash, Integer cashDefault, String memoService, String memoArea, String memoEtc, String cybankTypeCode, String cybankAccount,String cybankOwner, String pinNum, String bankTypeCode, String bankAccount, String bankOwner, String actualOwner, String actualAddr, String actualTel, TbBranchBusinessInfo businessInfo) {
        this.branchNo = branchNo;
        /*this.headNo = headNo;*/
        this.insertUserId = insertUserId;
        this.updateUserId = updateUserId;
        this.dataStatus = dataStatus;
        this.serviceYn = serviceYn;
        this.dlvyNo = dlvyNo;
        this.branchName = branchName;
        this.branchTel = branchTel;
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
        this.actualOwner = actualOwner;
        this.actualAddr = actualAddr;
        this.actualTel = actualTel;
       /* if (ObjectUtils.isNotEmpty(businessInfo)) {
            this.businessInfo = businessInfo;
            this.businessInfo.setBranch(this);
        }*/
    }
}
