package com.trism.jesica.dto;

import com.trism.jesica.persistence.Entitiy.business.TbStore;
import com.trism.jesica.persistence.type.*;
import lombok.Data;

import javax.persistence.Column;
import java.math.BigDecimal;

@Data
public class TbStoreData {

    /**
     * 가맹점 번호
     */
    private Long storeNo;

    /**
     * 제휴본사 (FK)
     */
    private Integer headNo;
    private String headName;

    /**
     * 총판 (FK)
     */
    private Integer branchNo;
    private String branchName;

    /**
     * 기본배송그룹
     */
    private Integer dlvyNo;

    /**
     * 입력 사용자 ID
     */
    private String insertUserId;

    /**
     * 수정 사용자 ID
     */
    private String updateUserId;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    private DataStatus dataStatus;

    /**
     * 서비스노출_여부 (1: 서비스, 0: 테스트 또는 정산용)
     */
    private ServiceYn serviceYn;

    /**
     * 직영 가맹점 여부(true, false)
     */
    private MasterChargeType masterYn;

    /**
     * 가맹점 이름
     */
    private String storeName;

    /**
     * 가맹점 이름 앱 표시명(고객 앱 가맹점명)
     */
    private String storeNameInapp;

    /**
     * 가맹점 대표번호
     */
    private String storeTel;

    /**
     * 가맹점 소개
     */
    private String storeIntro;

    /**
     * 인증 전화번호
     */
    private String authTel;

    /**
     * 예치금
     */
    private Integer deposit;

    /**
     * 캐쉬
     */
    private Integer cash;

    /**
     * 캐쉬 체납금
     */
    private Integer cashDefault;

    /**
     * 영업 담당자 이름
     */
    private String mngrName;

    /**
     * 메모 (가맹점관리메모)
     */
    private String memo;

    /**
     * 가상계좌_구분_코드 (SYS_TYPE(this.storeNo)CBT)
     */
    private String cybankTypeCode;

    /**
     * 가상계좌 번호
     */
    private String cybankAccount;

    /**
     * PIN_번호 (출금비밀번호)
     */
    private String pinNum;

    /**
     * 인출은행_구분_코드 (SYS_TYPE(this.storeNo)BT)
     */
    private String bankTypeCode;

    /**
     * 인출은행 계좌번호
     */
    private String bankAccount;

    /**
     * 인출은행 예금주
     */
    private String bankOwner;

    /**
     * 24시 운영어부(true, false)
     */
    private Boolean alldayOpenYn;

    /**
     * 매장_타입 (0: 배달전용, 1: 주문배달, 2: 마트, 3: 전통시장)
     */
    private StoreType storeType;

    /**
     * 멀티가맹점_구분 (0: 사용안함, 1: 종속, 2: 마스터)
     */
    private MultiType multiType;

    /**
     * 마스터_정산_방식 (0: 수동정산, 1: 실시간정산) - 종속/마스터가맹점간의 정산여부
     */
    private MasterChargeType masterChargeYn;

    /**
     * 마스터_상품_관리여부 (0: 관리안함, 1: 판매관리) - 종속가맹점의 상품을 대행하여 관리,판매
     */
    private MasterGoodsType masterGoodsYn;

    /**
     * 마스터_가맹점_번호
     */
    private Long masterStoreNo;

    /**
     * 주소명칭
     */
    private String poi;

    /**
     * 위도
     */
    private BigDecimal lat;

    /**
     * 경도
     */
    private BigDecimal lng;

    /**
     * 주소_1 (레벨1) - 지도API
     */
    private String addr1;

    /**
     * 주소_2 (레벨2) - 지도API
     */
    private String addr2;

    /**
     * 주소_3 (레벨3) - 지도API
     */
    private String addr3;

    /**
     * 주소_4 (나머지 주소) - 지도API
     */
    private String addr4;

    /**
     * 주소_5 (상세 주소)
     */
    private String addr5;

    /**
     * 이미지 파일명 썸네일
     */
    private String imgFileSmall;

    /**
     * 이미지 파일1
     */
    private String imgFile1;

    /**
     * 조리시간(분)
     */
    private Integer cookingTime;

    /**
     * 매장운영상태(0:영업종료, 1:영업, 2:휴식)
     */
    private Integer openStatus;

    /**
     * 배달주문가능여부(0:불가, 1:가능)
     */
    private Integer dlvyYn;

    /**
     * 포장주문가능여부(0:불가, 1:가능)
     */
    private Integer takeoutYn;

    /**
     * 배달가능 최소금액
     */
    private Integer dlvyMinAmt;

    /**
     * 포장주문가능여부(0:불가, 1:가능)
     */
    private Integer dlvyAreaYn;

    /**
     * 외부가맹점코드
     */
    private String exStoreCd;

    /**
     * 온라인매장주소
     */
    private String storeUrl;
    /**
     * 배달가능지역 설정여부( 블록요금 설정시에만 효력발생)
     */
    @Column(name = "dlvy_area_yn", length = 100)

    public TbStore insertData() {
        return TbStore.builder()
                .storeNo(this.storeNo)
                .headNo(this.headNo)
                .branchNo(this.branchNo)
                .dlvyNo(this.dlvyNo)
                .insertUserId(this.insertUserId)
                .updateUserId(this.updateUserId)
                .dataStatus(this.dataStatus)
                .serviceYn(this.serviceYn)
                .storeName(this.storeName)
                .storeNameInapp(this.storeNameInapp)
                .storeTel(this.storeTel)
                .authTel(this.authTel)
                .deposit(this.deposit)
                .cash(this.cash)
                .cashDefault(this.cashDefault)
                .mngrName(this.mngrName)
                .memo(this.memo)
                .cybankTypeCode(this.cybankTypeCode)
                .cybankAccount(this.cybankAccount)
                .pinNum(this.pinNum)
                .bankTypeCode(this.bankTypeCode)
                .bankAccount(this.bankAccount)
                .bankOwner(this.bankOwner)
                .alldayOpenYn(this.alldayOpenYn)
                /*.storeType(this.storeType)*/
                .multiType(this.multiType)
                .masterChargeYn(this.masterChargeYn)
                .masterGoodsYn(this.masterGoodsYn)
                .masterStoreNo(this.masterStoreNo)
                .poi(this.poi)
                .lat(this.lat)
                .lng(this.lng)
                .addr1(this.addr1)
                .addr2(this.addr2)
                .addr3(this.addr3)
                .addr4(this.addr4)
                .addr5(this.addr5)
                .storeIntro(this.storeIntro)
                .imgFileSmall(this.imgFileSmall)
                .imgFile1(this.imgFile1)
                .cookingTime(this.cookingTime)
                .openStatus(this.openStatus)
                .dlvyYn(this.dlvyYn)
                .takeoutYn(this.takeoutYn)
                .dlvyMinAmt(this.dlvyMinAmt)
                .dlvyAreaYn(this.dlvyAreaYn)
                .exStoreCd(this.exStoreCd)
                .storeUrl(this.storeUrl)
                .build();
    }

    public TbStore insertDataEncrypt(String pinNum , String bankAccount, String bankOwner) {
        return TbStore.builder()
                .storeNo(this.storeNo)
                .headNo(this.headNo)
                .branchNo(this.branchNo)
                .dlvyNo(this.dlvyNo)
                .insertUserId(this.insertUserId)
                .updateUserId(this.updateUserId)
                .dataStatus(this.dataStatus)
                .serviceYn(this.serviceYn)
                .storeName(this.storeName)
                .storeNameInapp(this.storeNameInapp)
                .storeTel(this.storeTel)
                .authTel(this.authTel)
                .deposit(this.deposit)
                .cash(this.cash)
                .cashDefault(this.cashDefault)
                .mngrName(this.mngrName)
                .memo(this.memo)
                .cybankTypeCode(this.cybankTypeCode)
                .cybankAccount(this.cybankAccount)
                .pinNum(pinNum)
                .bankTypeCode(this.bankTypeCode)
                .bankAccount(bankAccount)
                .bankOwner(bankOwner)
                .alldayOpenYn(this.alldayOpenYn)
                /*.storeType(this.storeType)*/
                .multiType(this.multiType)
                .masterChargeYn(this.masterChargeYn)
                .masterGoodsYn(this.masterGoodsYn)
                .masterStoreNo(this.masterStoreNo)
                .poi(this.poi)
                .lat(this.lat)
                .lng(this.lng)
                .addr1(this.addr1)
                .addr2(this.addr2)
                .addr3(this.addr3)
                .addr4(this.addr4)
                .addr5(this.addr5)
                .storeIntro(this.storeIntro)
                .imgFileSmall(this.imgFileSmall)
                .imgFile1(this.imgFile1)
                .cookingTime(this.cookingTime)
                .openStatus(this.openStatus)
                .dlvyYn(this.dlvyYn)
                .takeoutYn(this.takeoutYn)
                .dlvyMinAmt(this.dlvyMinAmt)
                .dlvyAreaYn(this.dlvyAreaYn)
                .exStoreCd(this.exStoreCd)
                .storeUrl(this.storeUrl)
                .build();
    }

}
