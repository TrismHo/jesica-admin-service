package com.trism.jesica.persistence.Entitiy.business;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.type.AttendStatusType;
import com.trism.jesica.persistence.type.DataStatus;
import com.trism.jesica.persistence.type.UserType;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Where;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;


@Entity
@Table(name = "tb_user_worker")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
@PrimaryKeyJoinColumn(name = "worker_no", referencedColumnName = "user_no")
public class TbUserWorker extends TbUser {
/**
 * 배송원
 */
/*@Entity
@Data
@Table(name = "tb_user_worker")
public class TbUserWorker implements Serializable {
    private static final long serialVersionUID = 1L;*/

    /**
     * 사용자_일련번호 (tb_user.user_no)
     */
 /*   @Id
    @Column(insertable = false, name = "worker_no", nullable = false)
    private Long workerNo;*/
    /**
     * 수정_일시
     */
    @Column(name = "update_date")
    private LocalDateTime updateDate;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    @Column(name = "data_status", nullable = false)
    private DataStatus dataStatus;

    /**
     * 출근_상태 (0: 퇴근, 1: 출근, 2: 휴식)
     */
    @Column(name = "attend_status", nullable = false)
    private AttendStatusType attendStatus;

    /**
     * 정지_사유_코드 (SYS_TYPE = BL)
     */
    @Column(name = "block_type_code")
    private String blockTypeCode = null;

    /**
     * 제휴본사_번호
     */
    @Column(name = "head_no")
    private Integer headNo = null;

    /**
     * 총판_번호
     */
    @Column(name = "branch_no")
    private Integer branchNo = null;

    /**
     * 가맹점_번호
     */
    @Column(name = "store_no")
    private Integer storeNo = null;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_no", insertable = false, updatable = false, nullable = false)
    @Where(clause = "data_status = 1")
    @JsonManagedReference
    private TbStore store;

    /**
     * 사원_번호
     */
    @Column(name = "regist_num")
    private String registNum = null;

    /**
     * 이름
     */
    @Column(name = "name")
    private String name = null;

    /**
     * 전화번호
     */
    @Column(name = "phone")
    private String phone = null;

    /**
     * 성별 (N: 알수없음, M: 남성, F: 여성)
     */
    @Column(name = "gender")
    private String gender ;

    /**
     * 승인_일자 (YYYYMMDD)
     */
    @Column(name = "join_date")
    private String joinDate = null;

    /**
     * 퇴사_일자 (YYYYMMDD)
     */
    @Column(name = "retire_date")
    private String retireDate = null;

    /**
     * 주소
     */
    @Column(name = "addr")
    private String addr = null;

    /**
     * 예치금
     */
    @Column(name = "deposit", nullable = false)
    private Integer deposit = 0;

    /**
     * 캐시
     */
    @Column(name = "cash", nullable = false)
    private Integer cash = 0;

    /**
     * 캐시_체납금
     */
    @Column(name = "cash_default", nullable = false)
    private Integer cashDefault = 0;

    /**
     * 가상계좌_구분_코드 (SYS_TYPE = CBT)
     */
    @Column(name = "cybank_type_code")
    private String cybankTypeCode = null;

    /**
     * 가상계좌_번호
     */
    @Column(name = "cybank_account")
    private String cybankAccount = null;

    /**
     * PIN_번호 (출금비밀번호)
     */
    @Column(name = "pin_num")
    private String pinNum = null;

    /**
     * 인출은행_구분_코드 (SYS_TYPE = BT)
     */
    @Column(name = "bank_type_code")
    private String bankTypeCode = null;

    /**
     * 인출은행_계좌번호
     */
    @Column(name = "bank_account")
    private String bankAccount = null;

    /**
     * 인출은행_예금주
     */
    @Column(name = "bank_owner")
    private String bankOwner = null;

    /**
     * 프로필_사진
     */
    @Column(name = "profile_file")
    private String profileFile = null;

    /**
     * 프로필_사진_썸네일
     */
    @Column(name = "profile_file_small")
    private String profileFileSmall = null;

    /**
     * 면허증_사진
     */
    @Column(name = "license_file")
    private String licenseFile = null;

    /**
     * 면허_번호
     */
    @Column(name = "license_num")
    private String licenseNum = null;

    /**
     * 면허_종류 (SYS_TYPE = LC)
     */
    @Column(name = "license_type")
    private String licenseType = null;

    /**
     * 면허_갱신_마감일(YYYYMMDD)
     */
    @Column(name = "license_exp_date")
    private String licenseExpDate = null;

    /**
     * 면허_만료_여부 (0: 유효, 1: 만료)
     */
    @Column(name = "license_exp_yn")
    private Integer licenseExpYn = 0;

    /**
     * 메모
     */
    @Column(name = "memo")
    private String memo = null;

    @PrePersist
    private void defaultInit() {
        this.dataStatus = DataStatus.OK;
    }


    @Builder
    public TbUserWorker(
            LocalDateTime updateDate,
            DataStatus dataStatus,
            AttendStatusType attendStatus,
            String blockTypeCode,
            Integer headNo,
            Integer branchNo,
            Integer storeNo,
            String registNum,
            String name,
            String phone,
            String gender,
            String joinDate,
            String retireDate,
            String addr,
            Integer deposit,
            Integer cash,
            Integer cashDefault,
            String cybankTypeCode,
            String cybankAccount,
            String pinNum,
            String bankTypeCode,
            String bankAccount,
            String bankOwner,
            String profileFile,
            String profileFileSmall,
            String licenseFile,
            String licenseNum,
            String licenseType,
            String licenseExpDate,
            Integer licenseExpYn,
            String memo,
            Long userNo,
            String insertUserId, String userId, String userPwd, UserType userType, Boolean pushOrderYn, Boolean pushNoticeYn, Boolean pushMarketingYn, List<TbUserDevice> userDevices,LocalDateTime lastLoginDtm, Integer pwdFailCount, Integer isFirstLogin, LocalDateTime pwdUpdateDtm
            ) {
                super(userNo, insertUserId, userId, userPwd, userType, pushOrderYn, pushNoticeYn, pushMarketingYn, userDevices,lastLoginDtm, pwdFailCount, isFirstLogin, pwdUpdateDtm);
                this.updateDate = updateDate;
                this.dataStatus = dataStatus;
                this.attendStatus = attendStatus;
                this.blockTypeCode = blockTypeCode;
                this.headNo = headNo;
                this.storeNo = storeNo;
                this.branchNo = branchNo;
                this.name = name;
                this.phone = phone;
                this.gender = gender;
                this.registNum = registNum;
                this.joinDate = joinDate;
                this.retireDate = retireDate;
                this.addr = addr;
                this.deposit = deposit;
                this.cash = cash;
                this.cashDefault = cashDefault;
                this.cybankTypeCode = cybankTypeCode;
                this.cybankAccount = cybankAccount;
                this.pinNum = pinNum;
                this.bankTypeCode = bankTypeCode;
                this.bankAccount = bankAccount;
                this.bankOwner = bankOwner;
                this.profileFile = profileFile;
                this.profileFileSmall = profileFileSmall;
                this.licenseFile = licenseFile;
                this.licenseNum = licenseNum;
                this.licenseType = licenseType;
                this.licenseExpDate = licenseExpDate;
                this.licenseExpYn = licenseExpYn;
                this.memo = memo;
    }



}