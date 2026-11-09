package com.trism.jesica.persistence.mysql.Entitiy.cust;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.config.EmptyStringToNullConverter;
import com.trism.jesica.persistence.mysql.core.entity.BaseEntity;
import com.trism.jesica.persistence.mysql.type.DataStatus;
import com.trism.jesica.persistence.mysql.type.GenderType;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.*;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
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
@Setter
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
     * 서비스 번호
     */
    @Column(name = "service_no", nullable = false)
    private Integer serviceNo = null;

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
    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @NotFound(action = NotFoundAction.IGNORE)
    @JoinColumn(name = "cust_addr_no", referencedColumnName = "cust_no")
    @JsonManagedReference
    private TbCustAddr custAddr;


    /**
     * 고객 주소 (기본주소) (FK)
     */
    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @NotFound(action = NotFoundAction.IGNORE)
    @JoinColumn(name = "recomm_cust_no", referencedColumnName = "cust_no" , insertable = false, updatable = false)
    @JsonManagedReference
    private TbCust recommCust;



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
     * 이용횟수
     */
    @Column(name = "use_count")
    private Integer useCount;

    /**
     * 잔여포인트
     */
    @Column(name = "point")
    private Integer point;

    /**
     * 누적포인트
     */
    @Column(name = "acc_point")
    private Integer accPoint;

    /**
     * 외부연동 Id
     */
    @Column(name = "ext_cust_no")
    private Long extCustNo;

    /**
     * 플랫폼 타입(0. 사용안함, 1. 제시카, 2. 양파오더, 3. 세날)
     */
    @Column(name = "platform_type", nullable = false)
    private Integer platformType = 1;


    /**
     * 추천 배송원 코드
     */
    @Column(name = "ext_recomm_wk_code")
    private String extRecommWkCode = null;

    /**
     * 추천 가맹점 코드
     */
    @Column(name = "ext_recomm_st_code")
    private String extRecommStCode = null;


    /**
     * 추천 가맹점명
     */
    @Column(name = "ext_recomm_st_name")
    private String extRecommStName;

    /**
     * 추천 총판코드
     */
    @Column(name = "ext_br_code")
    private String extBrCode = null;

    /**
     * 추천 마스터가맹점 코드
     */
    @Column(name = "ext_master_st_code")
    private String extMasterStCode = null;


    /**
     * 추천인코드
     */
    @Column(name = "recomm_code")
    private String recommCode = null;

    /**
     * 추천인수
     */
    @Column(name = "recomm_count")
    private Integer recommCount;



    /**
     * 추천인
     */
    @Column(name = "recomm_cust_no")
    private String recommCustNo = null;


    /**
     * 추천인 전화번호
     */
    @Column(name = "recomm_cust_tel")
    private String recommCustTel = null;

    @Column(name = "app_code")
    @Convert(converter = EmptyStringToNullConverter.class)
    private String appCode = null;


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



    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @NotFound(action = NotFoundAction.IGNORE)
    @JoinColumn(name = "cust_no", referencedColumnName = "cust_no", insertable = false, updatable = false)
    @JsonManagedReference
    private TbCustLocation custLocation;

    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "cust_no", referencedColumnName = "cust_no", insertable = false, updatable = false)
    private List<TbCustSns> snsList = new ArrayList<>();

    @Transient
    private String recommCustName;

    @Transient
    private String appName = null;


    /**
     * 수정일
     */
    private LocalDateTime updateDate;

    /**
     * 등록일
     */
    private LocalDateTime insertDate;

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
