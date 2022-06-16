package com.trism.jesica.dto;


import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class TbVacsVactDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 은행코드
     */
    private String bankCd;


    /**
     * 계좌번호
     */
    private String acctNo;


    /**
     * 예금주명
     */
    private String cmfNm;


    /**
     * 기관코드
     */
    private String orgCd;


    /**
     * 계좌상태(0:할당전, 1:할당, :9:해지)
     */
    private String acctSt;


    /**
     * 등록일자
     */
    private String regIl;


    /**
     * 할당일자
     */
    private String openIl;


    /**
     * 해지일자
     */
    private String closeIl;


    /**
     * 최초거래일자
     */
    private String fstIl;


    /**
     * 최종거래일자
     */
    private String lstIl;


    /**
     * 총 거래금액
     */
    private BigDecimal trAmt;


    /**
     * 거래금액조건(0 조건없음, 1금액=실금액, 2 금액>=실입금액, 3 금액<=실입금액)
     */
    private String tramtCond;


    /**
     * 수납회차 조건(0: 1계좌1수납 (이중입금불가) 1: 1계좌에 여러 수납)
     */
    private String trmcCond;


    /**
     * 입금가능시작일
     */
    private String trbeginIl;


    /**
     * 입금가능만료일
     */
    private String trendIl;


    /**
     * 입금가능시작시간
     */
    private String trbeginSi;


    /**
     * 입금가능만료시간
     */
    private String trendSi;


    /**
     * 기간내수납횟수
     */
    private BigDecimal seqNo;


    /**
     * CMS_CD
     */
    private String cmsCd;

}
