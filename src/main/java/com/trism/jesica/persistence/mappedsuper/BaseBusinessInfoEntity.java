package com.trism.jesica.persistence.mappedsuper;

import com.trism.jesica.persistence.core.entity.BaseEntity;
import com.trism.jesica.persistence.type.AuthStatus;
import com.trism.jesica.persistence.type.CorpType;
import com.trism.jesica.persistence.type.GroupType;
import lombok.*;
import lombok.experimental.Accessors;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Getter
@AllArgsConstructor
@MappedSuperclass
public abstract class BaseBusinessInfoEntity extends BaseEntity implements Serializable {

    @Id
    @Column(name = "group_no", nullable = false)
    private Long groupNo;

    /**
     * 입력 사용자 ID
     */
    @Column(name = "insert_user_id", length = 20)
    private String insertUserId;

    /**
     * 수정 일시
     */
    @Column(name = "update_date")
    @LastModifiedDate
    private LocalDateTime updateDate;

    /**
     * 수정사용자 ID
     */
    @Column(name = "update_user_id", length = 20)
    private String updateUserId;

    /**
     * 업무그룹_구분 (1: 제휴본사, 2: 총판, 3: 가맹점)
     */
    @Column(name = "group_type", length = 4)
    @Enumerated
    private GroupType groupType;

    /**
     * 법인_구분 (0: 알수없음, 1: 일반, 2: 간이, 3: 법인)
     */
    @Column(name = "corp_type")
    @Enumerated(EnumType.ORDINAL)
    private CorpType corpType;

    /**
     * 인증_상태 (0: 미인증, 1: 신청, 2: 승인, 3: 거절)
     */
    @Column(name = "auth_status")
    @Enumerated(EnumType.ORDINAL)
    private AuthStatus authStatus;

    /**
     * 인증일
     */
    @Column(name = "auth_date")
    private LocalDateTime authDate;

    /**
     * 사업자번호
     */
    @Column(name = "biz_num", length = 20)
    private String bizNum;

    /**
     * 사업자 상호명
     */
    @Column(name = "biz_name", length = 100)
    private String bizName;

    /**
     * 사업자 대표명
     */
    @Column(name = "biz_owner", length = 50)
    private String bizOwner;

    /**
     * 사업자 업태
     */
    @Column(name = "biz_type", length = 100)
    private String bizType;
    /**
     * 사업자 업종
     */
    @Column(name = "biz_item", length = 100)
    private String bizItem;

    /**
     * 사업자 주소
     */
    @Column(name = "biz_addr", length = 200)
    private String bizAddr;

    /**
     * 사업자 전화번호
     */
    @Column(name = "biz_tel", length = 40)
    private String bizTel;

    /**
     * 사업자 이메일
     */
    @Column(name = "biz_email", length = 50)
    private String bizEmail;

    @PrePersist
    public void init() {
        this.corpType = CorpType.UNKNOWN;
        this.authStatus = AuthStatus.UNCERTIFIED;
    }

    public void setGroupNo(Long groupNo) {
        this.groupNo = groupNo;
    }
}
