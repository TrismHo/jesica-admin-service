package com.trism.jesica.persistence.Entitiy.business;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.Entitiy.cust.TbCustFavorite;
import com.trism.jesica.persistence.Entitiy.goods.TbStoreCategory;
import com.trism.jesica.persistence.Entitiy.goods.TbStoreCategoryFo;
import com.trism.jesica.persistence.core.entity.BaseEntity;
import com.trism.jesica.persistence.type.*;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

/**
 * 가맹점(스토어)
 */
@Entity
@Table(name = "tb_store")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
//@AllArgsConstructor
//@Builder
@Getter
@ToString(callSuper = true, exclude = {"storeCategoryFos", "storeCategories", "custFavorites"})
@EqualsAndHashCode(callSuper = true )
@DynamicInsert
@DynamicUpdate
//@SecondaryTable(name = "tb_business_info"
//        , pkJoinColumns = @PrimaryKeyJoinColumn(name = "group_no", referencedColumnName = "store_no"))
public class TbStoreSub extends BaseEntity {

    /**
     * 가맹점 번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "store_no",insertable = true, updatable = false)
    private Long storeNo;

/*    @Column(name = "head_no",insertable = true, updatable = false)
    private Integer headNo;

    @Column(name = "branch_no",insertable = true, updatable = false )
    private Integer branchNo;*/

    /**
     * 제휴본사 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "head_no" , insertable = false, updatable = false)
    @JsonManagedReference
    private TbHeadSub head;

    /**
     * 총판 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "branch_no" , insertable = false, updatable = false)
    @JsonManagedReference
    private TbBranchSub branch;

    /**
     * 입력 사용자 ID
     */
    @Column(name = "insert_user_id", length = 20)
    private String insertUserId;

    /**
     * 수정 사용자 ID
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
     * 정지_사유_코드 (SYS_TYPE = BL)
     */
    @Column(name = "block_type_code")
    private String blockTypeCode;

    /**
     * 서비스노출_여부 (1: 서비스, 0: 테스트 또는 정산용)
     */
    @Column(name = "service_yn")
    @Enumerated(EnumType.ORDINAL)
    private ServiceYn serviceYn;

    /**
     * 가맹점 이름
     */
    @Column(name = "store_name", length = 40, nullable = false)
    private String storeName;

    /**
     * 가맹점 이름 앱 표시명(고객 앱 가맹점명)
     */
    @Column(name = "store_name_inapp", length = 40)
    private String storeNameInapp;

    /**
     * 가맹점 대표번호
     */
    @Column(name = "store_tel", length = 20)
    private String storeTel;

    /**
     * 인증 전화번호
     */
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
     * 영업 담당자 이름
     */
    @Column(name = "mngr_name", length = 40)
    private String mngrName;

    /**
     * 메모 (가맹점관리메모)
     */
    @Column(name = "memo", length = 200)
    private String memo;

    /**
     * 가상계좌_구분_코드 (SYS_TYPE = CBT)
     */
    @Column(name = "cybank_type_code", length = 4)
    private String cybankTypeCode;

    /**
     * 가상계좌 번호
     */
    @Column(name = "cybank_account", length = 20)
    private String cybankAccount;

    /**
     * PIN_번호 (출금비밀번호)
     */
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
    @Column(name = "bank_account", length = 20)
    private String bankAccount;

    /**
     * 인출은행 예금주
     */
    @Column(name = "bank_owner", length = 40)
    private String bankOwner;

    /**
     * 24시 운영어부(true, false)
     */
    @Column(name = "allday_open_yn")
    private Boolean alldayOpenYn;

    /**
     * 매장_타입 (0: 배달전용, 1: 주문배달, 2: 마트, 3: 전통시장)
     */
/*    @Column(name = "store_type")
    @Enumerated(EnumType.ORDINAL)
    private StoreType storeType;*/

    /**
     * 매장_타입 (0: 배달전용, 1: 주문배달, 2: 마트, 3: 전통시장)
     */
    @Column(name = "dlvy_no")
    private Integer dlvyNo;

    /**
     * 멀티가맹점_구분 (0: 사용안함, 1: 종속, 2: 마스터)
     */
    @Column(name = "multi_type")
    @Enumerated(EnumType.ORDINAL)
    private MultiType multiType;

    /**
     * 마스터_정산_방식 (0: 수동정산, 1: 실시간정산) - 종속/마스터가맹점간의 정산여부
     */
    @Column(name = "master_charge_yn")
    @Enumerated(EnumType.ORDINAL)
    private MasterChargeType masterChargeYn;

    /**
     * 마스터_상품_관리여부 (0: 관리안함, 1: 판매관리) - 종속가맹점의 상품을 대행하여 관리,판매
     */
    @Column(name = "master_goods_yn")
    @Enumerated(EnumType.ORDINAL)
    private MasterGoodsType masterGoodsYn;

    /**
     * 마스터_가맹점_번호
     */
    @Column(name = "master_store_no")
    private Long masterStoreNo;

    /**
     * 주소명칭
     */
    @Column(name = "poi", length = 100)
    private String poi;

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
     * 주소_1 (레벨1) - 지도API
     */
    @Column(name = "addr_1", length = 30)
    private String addr1;
    /**
     * 주소_2 (레벨2) - 지도API
     */
    @Column(name = "addr_2", length = 50)
    private String addr2;
    /**
     * 주소_3 (레벨3) - 지도API
     */
    @Column(name = "addr_3", length = 100)
    private String addr3;
    /**
     * 주소_4 (나머지 주소) - 지도API
     */
    @Column(name = "addr_4", length = 100)
    private String addr4;
    /**
     * 주소_5 (상세 주소)
     */
    @Column(name = "addr_5", length = 200)
    private String addr5;

    /**
     * 가맹점_소개말
     */
    @Column(name = "store_intro", length = 200)
    private String storeIntro;

    /**
     * 이미지 파일명 썸네일
     */
    @Column(name = "img_file_small", length = 100)
    private String imgFileSmall;

    /**
     * 이미지_파일1
     */
    @Column(name = "img_file_1", length = 100)
    private String imgFile1;

    /**
     * 조리시간(분)
     */
    @Column(name = "cooking_time", length = 100)
    private Integer cookingTime;

    /**
     * 매장운영상태(0:영업종료, 1:영업, 2:휴식)
     */
    @Column(name = "open_status", length = 100)
    private Integer openStatus;

    /**
     * 배달주문가능여부(0:불가, 1:가능)
     */
    @Column(name = "dlvy_yn", length = 100)
    private Integer dlvyYn;

    /**
     * 포장주문가능여부(0:불가, 1:가능)
     */
    @Column(name = "takeout_yn", length = 100)
    private Integer takeoutYn;

    /**
     * 배달가능 최소금액
     */
    @Column(name = "dlvy_min_amt", length = 100)
    private Integer dlvyMinAmt;

    /**
     * 배달가능지역 설정여부( 블록요금 설정시에만 효력발생)
     */
    @Column(name = "dlvy_area_yn", length = 100)
    private Integer dlvyAreaYn;



    /**
     * 가맹점 카테고리 배달음식 양방향
     */
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "store")
    @JsonBackReference
    private List<TbStoreCategoryFo> storeCategoryFos;

    /**
     * 가맹점 카테고리 양방향
     */
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "store")
    @JsonBackReference
    private List<TbStoreCategory> storeCategories;

    /**
     * 단골 고객매장 양방향
     */
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "store")
    @JsonBackReference
    private List<TbCustFavorite> custFavorites;

 /*   @PostPersist
    public void defaultInit() {
        this.dataStatus = DataStatus.OK;
        this.serviceYn = ServiceType.SERVICE;
        this.alldayOpenYn = false;
        this.multiType = MultiType.INDIVIDUAL;
        this.masterChargeYn = MasterChargeType.MANUAL_CHARGE;
        this.masterGoodsYn = MasterGoodsType.NO_MANAGEMENT;
    }*/


    @Builder
    public TbStoreSub(Long storeNo, Integer headNo, Integer branchNo, Integer dlvyNo,
                      String insertUserId, String updateUserId, DataStatus dataStatus,
                      ServiceYn serviceYn, String storeName, String storeNameInapp,
                      String storeTel, String authTel, Integer deposit, Integer cash,
                      Integer cashDefault, String mngrName, String memo, String cybankTypeCode,
                      String cybankAccount, String pinNum, String bankTypeCode,
                      String bankAccount, String bankOwner, Boolean alldayOpenYn,
                      StoreType storeType, MultiType multiType, MasterChargeType masterChargeYn,
                      MasterGoodsType masterGoodsYn, Long masterStoreNo, String poi, BigDecimal lat,
                      BigDecimal lng, String addr1, String addr2, String addr3, String addr4,
                      String addr5, String storeIntro, String imgFileSmall, String imgFile1,
                      Integer cookingTime, Integer openStatus,
                      Integer dlvyYn, Integer takeoutYn, Integer dlvyMinAmt, Integer dlvyAreaYn) {
        this.storeNo = storeNo;
/*        this.headNo = headNo;
        this.branchNo = branchNo;*/
        this.dlvyNo = dlvyNo;
        this.insertUserId = insertUserId;
        this.updateUserId = updateUserId;
        this.dataStatus = dataStatus;
        this.serviceYn = serviceYn;
        this.storeName = storeName;
        this.storeNameInapp = storeNameInapp;
        this.storeTel = storeTel;
        this.authTel = authTel;
        this.deposit = deposit;
        this.cash = cash;
        this.cashDefault = cashDefault;
        this.mngrName = mngrName;
        this.memo = memo;
        this.cybankTypeCode = cybankTypeCode;
        this.cybankAccount = cybankAccount;
        this.pinNum = pinNum;
        this.bankTypeCode = bankTypeCode;
        this.bankAccount = bankAccount;
        this.bankOwner = bankOwner;
        this.alldayOpenYn = alldayOpenYn;
        this.multiType = multiType;
        this.masterChargeYn = masterChargeYn;
        this.masterGoodsYn = masterGoodsYn;
        this.masterStoreNo = masterStoreNo;
        this.poi = poi;
        this.lat = lat;
        this.lng = lng;
        this.addr1 = addr1;
        this.addr2 = addr2;
        this.addr3 = addr3;
        this.addr4 = addr4;
        this.addr5 = addr5;
        this.storeIntro = storeIntro;
        this.imgFileSmall = imgFileSmall;
        this.imgFile1 = imgFile1;
        this.cookingTime = cookingTime;
        this.openStatus = openStatus;
        this.dlvyYn = dlvyYn;
        this.takeoutYn = takeoutYn;
        this.dlvyMinAmt = dlvyMinAmt;
        this.dlvyAreaYn = dlvyAreaYn;
    }
}
