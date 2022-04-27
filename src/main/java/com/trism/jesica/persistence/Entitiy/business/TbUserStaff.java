package com.trism.jesica.persistence.Entitiy.business;

import com.trism.jesica.persistence.type.DataStatus;
import com.trism.jesica.persistence.type.UserType;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;


/**
 * 사용자 직원
 */
@Entity
@Table(name = "tb_user_staff")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
@PrimaryKeyJoinColumn(name = "staff_no", referencedColumnName = "user_no")
public class TbUserStaff extends TbUser {

    /**
     * 수정 일시
     */
    @LastModifiedDate
    @Column(name = "update_date")
    private LocalDateTime updateDate;

    /**
     * 수정 사용자 고유 아이디
     */
    @Column(name = "update_user_id")
    private String updateUserId;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    @Column(name = "data_status")
    @Enumerated(EnumType.ORDINAL)
    private DataStatus dataStatus;

    /**
     * 정지_사유_코드 (SYS_TYPE = BL)
     */
    @Column(name = "block_type_code")
    private String blockTypeCode;

    /**
     * 제휴본사 번호 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "head_no" , insertable = false, updatable = false)
    private TbHead head;

    /**
     * 총판 번호 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "branch_no" , insertable = false, updatable = false)
    private TbBranch branch;

    /**
     * 가맹점 번호 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_no" , insertable = false, updatable = false)
    private TbStore store;

    @Column(name = "head_no")
    private Integer headNo;

    @Column(name = "branch_no")
    private Integer branchNo;

    @Column(name = "store_no")
    private Integer storeNo;

    /**
     * 이름
     */
    @Column(name = "name")
    private String name;

    /**
     * 전화번호
     */
    @Column(name = "phone")
    private String phone;

    /**
     * 메모
     */
    @Column(name = "memo")
    private String memo;

    /**
     * 권한 구분 (1:마스터 , 2:사용자)
     */
    @Column(name = "role_type")
    private Integer roleType;


    @PrePersist
    private void defaultInit() {
        this.dataStatus = DataStatus.OK;
    }

    @Builder
    public TbUserStaff(Long userNo, String insertUserId, String userId, String userPwd, UserType userType, Integer headNo,
                       Integer branchNo, Integer storeNo, LocalDateTime updateDate, String updateUserId, List<TbUserDevice> userDevices,
                       Boolean pushOrderYn, Boolean pushNoticeYn, Boolean pushMarketingYn,
                       DataStatus dataStatus, String blockTypeCode, String name, String phone, String memo,
                       LocalDateTime lastLoginDtm, Integer pwdFailCount, Integer isFirstLogin, LocalDateTime pwdUpdateDtm) {
        super(userNo, insertUserId, userId, userPwd, userType, pushOrderYn, pushNoticeYn, pushMarketingYn, userDevices,lastLoginDtm, pwdFailCount, isFirstLogin, pwdUpdateDtm);
        this.updateDate = updateDate;
        this.updateUserId = updateUserId;
        this.dataStatus = dataStatus;
        this.blockTypeCode = blockTypeCode;
        this.headNo = headNo;
        this.branchNo = branchNo;
        this.storeNo = storeNo;
        this.name = name;
        this.phone = phone;
        this.memo = memo;
    }

}
