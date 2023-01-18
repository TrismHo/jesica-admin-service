package com.trism.jesica.persistence.Entitiy.cust;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.core.entity.BaseEntity;
import com.trism.jesica.persistence.type.DataStatus;
import com.trism.jesica.persistence.type.GenderType;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Where;

import javax.persistence.*;
import java.util.List;

/**
 * 고객
 */
@Entity
@Table(name = "tb_cust")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {"custFavorites", "custDevices", "custAddrs"})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbCust extends BaseEntity {

    /**
     * 고객 일련번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cust_no")
    private Long custNo;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    @Column(name = "data_status")
    @Enumerated(EnumType.ORDINAL)
    private DataStatus dataStatus;

    /**
     * 앱로그인 ID
     */
    @Column(name = "login_id")
    private String loginId;

    /**
     * 앱 로그인 PWD
     */
    @Column(name = "login_pwd")
    private String loginPwd;

    /**
     * SNS 토큰 1 (외부로그인)
     */
    @Column(name = "sns_token_1")
    private String snsToken1;

    /**
     * SNS 토큰 2 (외부로그인)
     */
    @Column(name = "sns_token_2")
    private String snsToken2;

    /**
     * 고객 이름
     */
    @Column(name = "cust_name")
    private String custName;

    /**
     * 고객 전화번호
     */
    @Column(name = "cust_tel")
    private String custTel;

    /**
     * 캐쉬
     */
    @Column(name = "cash")
    private Integer cash;

    /**
     * 마일리지
     */
    @Column(name = "mileage")
    private Integer mileage;

    /**
     * 고객 주소 (기본주소) (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cust_addr_no", referencedColumnName = "cust_addr_no")
    @JsonManagedReference
    private TbCustAddr custAddr;

    /**
     * 성별 (N: 알수없음, M: 남성, F: 여성)
     */
    @Column(name = "gender")
    @Enumerated(EnumType.STRING)
    private GenderType gender;

    /**
     * SMS_수신여부 (0:거부, 1:동의)
     */
    @Column(name = "sms_yn")
    private Integer smsYn;

    /**
     * PUSH_주문_수신여부(0: 거부, 1:동의)
     */
    @Column(name = "push_order_yn")
    private Integer pushOrderYn;

    /**
     * PUSH_공지이벤트_수신여부(0: 거부, 1: 동의)
     */
    @Column(name = "push_notice_yn")
    private Integer pushNoticeYn;

    /**
     * PUSH_마케팅_수신여부(0: 거부, 1: 동의)
     */
    @Column(name = "push_marketing_yn")
    private Integer pushMarketingYn;

    /**
     * 회원여부(0: 비회원, 1: 회원)
     */
    @Column(name = "is_member")
    private Integer isMember;

    /**
     * 플랫폼 타입(0. 사용안함, 1. 제시카, 2. 어니언맵)
     */
    @Column(name = "platform_type", nullable = false)
    private Integer platformType = 1;

    /**
     * 고객 단골매장 양방향
     */
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "cust")
    @JsonBackReference
    private List<TbCustFavorite> custFavorites;

    /**
     * 고객 디바이스 양방향
     */
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "cust")
    @JsonBackReference
    private List<TbCustDevice> custDevices;

    /**
     * 고객 주소 양방향
     */
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "cust")
    @Where(clause = "dataStatus = 1")
    @JsonBackReference
    private List<TbCustAddr> custAddrs;

    @PrePersist
    private void init() {
        this.dataStatus = DataStatus.OK;
        this.gender = GenderType.N;
        this.smsYn = 0;
        this.pushOrderYn = 0;
        this.pushNoticeYn = 0;
        this.pushMarketingYn = 0;
    }
}
