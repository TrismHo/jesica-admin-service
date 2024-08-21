package com.trism.jesica.persistence.mysql.Entitiy.paymenthistory;

import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@DynamicInsert
@DynamicUpdate
@Table(name = "tb_pay_card_data")
public class TbPayCardData  {

    private static final long serialVersionUID = 1L;

    /**
     * 결제승인번호
     */
    @Id
    @Column(name = "tid", nullable = false)
    private String tid;

    /**
     * 발급사(은행)코드(2자리 코드)
     */
    @Column(name = "issuer_code")
    private String issuerCode;

    /**
     * 가맹점 번호
     */
    @Column(name = "member_num")
    private String memberNum;

    /**
     * 매입사 코드
     */
    @Column(name = "purchase_code")
    private String purchaseCode;

    /**
     * 부분취소 가능여부(0:불가능, 1:가능)
     */
    @Column(name = "prtc_code")
    private String prtcCode;

    /**
     * 상점부담 무이자 할부여부(1: 상점부담 무이자)
     */
    @Column(name = "interest")
    private String interest;

    /**
     * 카드구분[0:개인, 1: 법인, 9: 구분불가]
     */
    @Column(name = "corp_flag")
    private String corpFlag;

    /**
     * 카드종류(0: 신용, 1:체크, 2: 기프트)
     */
    @Column(name = "check_flag")
    private String checkFlag;

    /**
     * 신용카드 할부개월
     */
    @Column(name = "rmesg2")
    private String rmesg2;

    /**
     * 카드코드
     */
    @Column(name = "fn_cd_1")
    private String fnCd1;

    /**
     * 결제카드사 한글명
     */
    @Column(name = "fn_nm")
    private String fnNm;

    /**
     * 카드번호
     */
    @Column(name = "card_num")
    private String cardNum;

    /**
     * 승인번호
     */
    @Column(name = "auth_no")
    private String authNo;

    /**
     * vp 카드 코드
     */
    @Column(name = "isp_card_code")
    private String ispCardCode;

    /**
     * 쿠폰사용여부(1:사용)
     */
    @Column(name = "coupon_flag")
    private String couponFlag;

    /**
     * 쿠폰사용금액
     */
    @Column(name = "coupon_discount")
    private Integer couponDiscount;

    /**
     * 실제 카드 승인 금액
     */
    @Column(name = "card_appl_price")
    private Integer cardApplPrice;

    /**
     * 간편(앱)결제코드(PAYCO : C, 삼성페이 : B, 삼성페이(체크) : D, SSGPAY : G, KAKAOPAY : O, LPAY : L, 국민앱카드 : K, KPAY : A, 토스페이 : H, 네이버페이 : I (대문자 i)차이페이 : R, 티머니페이 : U)
     */
    @Column(name = "src_code")
    private String srcCode;

    /**
     * 포인트 사용금액
     */
    @Column(name = "use_point")
    private Integer usePoint;

    /**
     * 네이버포인트 무상포인트
     */
    @Column(name = "naver_point_use_free_point")
    private String naverPointUseFreePoint;

    /**
     * 네이버포인트 현금영수증 발행여부(Y: 발행, N: 미발행)
     */
    @Column(name = "naver_point_cshr_appl_yn")
    private String naverPointCshrApplYn;

    /**
     * 네이버포인트 현금영수증 발행금액
     */
    @Column(name = "naver_point_cshr_appl_amt")
    private String naverPointCshrApplAmt;

    /**
     * 롯데카드 임직원 제휴 구분코드(L: 임직원)
     */
    @Column(name = "card_emp_prtn_code")
    private String cardEmpPrtnCode;

    /**
     * 카드세 제휴 구분코드(P: 롯데카드 일반, M : 롯데카드 모바일, H: 현대카드(통합)
     */
    @Column(name = "card_noml_mob_prtn_code")
    private String cardNomlMobPrtnCode;

   /* *//**
     * 결제승인번호
     *//*
    public void setTid(String tid) {
        this.tid = tid;
    }

    *//**
     * 결제승인번호
     *//*
    public String getTid() {
        return tid;
    }

    *//**
     * 발급사(은행)코드(2자리 코드)
     *//*
    public void setIssuerCode(String issuerCode) {
        this.issuerCode = issuerCode;
    }

    *//**
     * 발급사(은행)코드(2자리 코드)
     *//*
    public String getIssuerCode() {
        return issuerCode;
    }

    *//**
     * 가맹점 번호
     *//*
    public void setMemberNum(String memberNum) {
        this.memberNum = memberNum;
    }

    *//**
     * 가맹점 번호
     *//*
    public String getMemberNum() {
        return memberNum;
    }

    *//**
     * 매입사 코드
     *//*
    public void setPurchaseCode(String purchaseCode) {
        this.purchaseCode = purchaseCode;
    }

    *//**
     * 매입사 코드
     *//*
    public String getPurchaseCode() {
        return purchaseCode;
    }

    *//**
     * 부분취소 가능여부(0:불가능, 1:가능)
     *//*
    public void setPrtcCode(String prtcCode) {
        this.prtcCode = prtcCode;
    }

    *//**
     * 부분취소 가능여부(0:불가능, 1:가능)
     *//*
    public String getPrtcCode() {
        return prtcCode;
    }

    *//**
     * 상점부담 무이자 할부여부(1: 상점부담 무이자)
     *//*
    public void setInterest(String interest) {
        this.interest = interest;
    }

    *//**
     * 상점부담 무이자 할부여부(1: 상점부담 무이자)
     *//*
    public String getInterest() {
        return interest;
    }

    *//**
     * 카드구분[0:개인, 1: 법인, 9: 구분불가]
     *//*
    public void setCorpFlag(String corpFlag) {
        this.corpFlag = corpFlag;
    }

    *//**
     * 카드구분[0:개인, 1: 법인, 9: 구분불가]
     *//*
    public String getCorpFlag() {
        return corpFlag;
    }

    *//**
     * 카드종류(0: 신용, 1:체크, 2: 기프트)
     *//*
    public void setCheckFlag(String checkFlag) {
        this.checkFlag = checkFlag;
    }

    *//**
     * 카드종류(0: 신용, 1:체크, 2: 기프트)
     *//*
    public String getCheckFlag() {
        return checkFlag;
    }

    *//**
     * 신용카드 할부개월
     *//*
    public void setRmesg2(String rmesg2) {
        this.rmesg2 = rmesg2;
    }

    *//**
     * 신용카드 할부개월
     *//*
    public String getRmesg2() {
        return rmesg2;
    }

    *//**
     * 카드코드
     *//*
    public void setFnCd1(String fnCd1) {
        this.fnCd1 = fnCd1;
    }

    *//**
     * 카드코드
     *//*
    public String getFnCd1() {
        return fnCd1;
    }

    *//**
     * 결제카드사 한글명
     *//*
    public void setFnNm(String fnNm) {
        this.fnNm = fnNm;
    }

    *//**
     * 결제카드사 한글명
     *//*
    public String getFnNm() {
        return fnNm;
    }

    *//**
     * 카드번호
     *//*
    public void setCardNum(String cardNum) {
        this.cardNum = cardNum;
    }

    *//**
     * 카드번호
     *//*
    public String getCardNum() {
        return cardNum;
    }

    *//**
     * 승인번호
     *//*
    public void setAuthNo(String authNo) {
        this.authNo = authNo;
    }

    *//**
     * 승인번호
     *//*
    public String getAuthNo() {
        return authNo;
    }

    *//**
     * vp 카드 코드
     *//*
    public void setIspCardCode(String ispCardCode) {
        this.ispCardCode = ispCardCode;
    }

    *//**
     * vp 카드 코드
     *//*
    public String getIspCardCode() {
        return ispCardCode;
    }

    *//**
     * 쿠폰사용여부(1:사용)
     *//*
    public void setCouponFlag(String couponFlag) {
        this.couponFlag = couponFlag;
    }

    *//**
     * 쿠폰사용여부(1:사용)
     *//*
    public String getCouponFlag() {
        return couponFlag;
    }

    *//**
     * 쿠폰사용금액
     *//*
    public void setCouponDiscount(Integer couponDiscount) {
        this.couponDiscount = couponDiscount;
    }

    *//**
     * 쿠폰사용금액
     *//*
    public Integer getCouponDiscount() {
        return couponDiscount;
    }

    *//**
     * 실제 카드 승인 금액
     *//*
    public void setCardApplPrice(Integer cardApplPrice) {
        this.cardApplPrice = cardApplPrice;
    }

    *//**
     * 실제 카드 승인 금액
     *//*
    public Integer getCardApplPrice() {
        return cardApplPrice;
    }

    *//**
     * 간편(앱)결제코드(PAYCO : C, 삼성페이 : B, 삼성페이(체크) : D, SSGPAY : G, KAKAOPAY : O, LPAY : L, 국민앱카드 : K, KPAY : A, 토스페이 : H, 네이버페이 : I (대문자 i)차이페이 : R, 티머니페이 : U)
     *//*
    public void setSrcCode(String srcCode) {
        this.srcCode = srcCode;
    }

    *//**
     * 간편(앱)결제코드(PAYCO : C, 삼성페이 : B, 삼성페이(체크) : D, SSGPAY : G, KAKAOPAY : O, LPAY : L, 국민앱카드 : K, KPAY : A, 토스페이 : H, 네이버페이 : I (대문자 i)차이페이 : R, 티머니페이 : U)
     *//*
    public String getSrcCode() {
        return srcCode;
    }

    *//**
     * 포인트 사용금액
     *//*
    public void setUsePoint(Integer usePoint) {
        this.usePoint = usePoint;
    }

    *//**
     * 포인트 사용금액
     *//*
    public Integer getUsePoint() {
        return usePoint;
    }

    *//**
     * 네이버포인트 무상포인트
     *//*
    public void setNaverPointUseFreePoint(String naverPointUseFreePoint) {
        this.naverPointUseFreePoint = naverPointUseFreePoint;
    }

    *//**
     * 네이버포인트 무상포인트
     *//*
    public String getNaverPointUseFreePoint() {
        return naverPointUseFreePoint;
    }

    *//**
     * 네이버포인트 현금영수증 발행여부(Y: 발행, N: 미발행)
     *//*
    public void setNaverPointCshrApplYn(String naverPointCshrApplYn) {
        this.naverPointCshrApplYn = naverPointCshrApplYn;
    }

    *//**
     * 네이버포인트 현금영수증 발행여부(Y: 발행, N: 미발행)
     *//*
    public String getNaverPointCshrApplYn() {
        return naverPointCshrApplYn;
    }

    *//**
     * 네이버포인트 현금영수증 발행금액
     *//*
    public void setNaverPointCshrApplAmt(String naverPointCshrApplAmt) {
        this.naverPointCshrApplAmt = naverPointCshrApplAmt;
    }

    *//**
     * 네이버포인트 현금영수증 발행금액
     *//*
    public String getNaverPointCshrApplAmt() {
        return naverPointCshrApplAmt;
    }

    *//**
     * 롯데카드 임직원 제휴 구분코드(L: 임직원)
     *//*
    public void setCardEmpPrtnCode(String cardEmpPrtnCode) {
        this.cardEmpPrtnCode = cardEmpPrtnCode;
    }

    *//**
     * 롯데카드 임직원 제휴 구분코드(L: 임직원)
     *//*
    public String getCardEmpPrtnCode() {
        return cardEmpPrtnCode;
    }

    *//**
     * 카드세 제휴 구분코드(P: 롯데카드 일반, M : 롯데카드 모바일, H: 현대카드(통합)
     *//*
    public void setCardNomlMobPrtnCode(String cardNomlMobPrtnCode) {
        this.cardNomlMobPrtnCode = cardNomlMobPrtnCode;
    }

    *//**
     * 카드세 제휴 구분코드(P: 롯데카드 일반, M : 롯데카드 모바일, H: 현대카드(통합)
     *//*
    public String getCardNomlMobPrtnCode() {
        return cardNomlMobPrtnCode;
    }*/

    /*@Override
    public String toString() {
        return "TbPayCardData{" +
                "tid=" + tid + '\'' +
                "issuerCode=" + issuerCode + '\'' +
                "memberNum=" + memberNum + '\'' +
                "purchaseCode=" + purchaseCode + '\'' +
                "prtcCode=" + prtcCode + '\'' +
                "interest=" + interest + '\'' +
                "corpFlag=" + corpFlag + '\'' +
                "checkFlag=" + checkFlag + '\'' +
                "rmesg2=" + rmesg2 + '\'' +
                "fnCd1=" + fnCd1 + '\'' +
                "fnNm=" + fnNm + '\'' +
                "cardNum=" + cardNum + '\'' +
                "authNo=" + authNo + '\'' +
                "ispCardCode=" + ispCardCode + '\'' +
                "couponFlag=" + couponFlag + '\'' +
                "couponDiscount=" + couponDiscount + '\'' +
                "cardApplPrice=" + cardApplPrice + '\'' +
                "srcCode=" + srcCode + '\'' +
                "usePoint=" + usePoint + '\'' +
                "naverPointUseFreePoint=" + naverPointUseFreePoint + '\'' +
                "naverPointCshrApplYn=" + naverPointCshrApplYn + '\'' +
                "naverPointCshrApplAmt=" + naverPointCshrApplAmt + '\'' +
                "cardEmpPrtnCode=" + cardEmpPrtnCode + '\'' +
                "cardNomlMobPrtnCode=" + cardNomlMobPrtnCode + '\'' +
                '}';
    }*/
}
