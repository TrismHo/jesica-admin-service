package com.trism.jesica.persistence.Entitiy.business;

import com.trism.jesica.persistence.core.entity.CreatedDateEntity;
import com.trism.jesica.persistence.type.UserType;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 사용자
 */
@Entity
@Table(name = "tb_user")
@EntityListeners(AuditingEntityListener.class)
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@Getter
@Setter
@ToString(callSuper = true, exclude = {"userDevices"})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class TbUser extends CreatedDateEntity {

    /**
     * 사용자 일련번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_no")
    private Long userNo;

    /**
     * 입력 사용자 고유 ID
     */
    @Column(name = "insert_user_id")
    private String insertUserId;


    /**
     * 사용자_로그인ID
     */
    @Column(name = "user_id", unique = true)
    private String userId;

    /**
     * 사용자 비밀번호
     */
    @Column(name = "user_pwd")
    private String userPwd;


    /**
     * 사용자_구분 (0: 마스터(시스템), 1: 제휴본사, 2: 총판, 3: 가맹점, 4: 배송원, 6: 상담원)
     *
     */
    @Column(name = "user_type")
    private UserType userType;

    /**
     * PUSH_주문_수신여부(0: 거부, 1:동의)
     */
    @Column(name = "push_order_yn")
    private Boolean pushOrderYn;
    /**
     * PUSH_공지이벤트_수신여부(0: 거부, 1: 동의)
     */
    @Column(name = "push_notice_yn")
    private Boolean pushNoticeYn;
    /**
     * PUSH_마케팅_수신여부(0: 거부, 1: 동의)
     */
    @Column(name = "push_marketing_yn")
    private Boolean pushMarketingYn;

    /**
     * 마지막 로그인 시간
     */
    @Column(name = "last_login_dtm", updatable = false, nullable = false)
    private LocalDateTime lastLoginDtm;

    /**
     * 비밀번호 실패 횟수
    */
    @Column(name = "pwd_fail_count")
    private Integer pwdFailCount;

    /**
     * 처음 로그인 사용자 여부
     */
    @Column(name = "is_first_login")
    private Integer isFirstLogin;

    /**
     * 처음 로그인 사용자 여부
     */
    @Column(name = "pwd_update_dtm")
    private LocalDateTime pwdUpdateDtm;



    /**
     * 사용자 디바이스 양방향
     */
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    private List<TbUserDevice> userDevices;


    @PrePersist
    private void defaultInit() {
        this.pushOrderYn = true;
        this.pushNoticeYn = true;
        this.pushMarketingYn = true;
    }

    public TbUser(Long userNo, String insertUserId, String userId, String userPwd, UserType userType, Boolean pushOrderYn, Boolean pushNoticeYn, Boolean pushMarketingYn, List<TbUserDevice> userDevices, LocalDateTime lastLoginDtm, Integer pwdFailCount, Integer isFirstLogin , LocalDateTime pwdUpdateDtm) {
        this.userNo = userNo;
        this.insertUserId = insertUserId;
        this.userId = userId;
        this.userPwd = userPwd;
        this.userType = userType;
        this.pushOrderYn = pushOrderYn;
        this.pushNoticeYn = pushNoticeYn;
        this.pushMarketingYn = pushMarketingYn;
        this.userDevices = userDevices;
        this.lastLoginDtm = lastLoginDtm;
        this.pwdFailCount = pwdFailCount;
        this.isFirstLogin = isFirstLogin;
        this.pwdUpdateDtm = pwdUpdateDtm;
    }


}
