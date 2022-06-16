package com.trism.jesica.dto;


import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class TbVacsTotlDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 거래일자
     */
    private String trIl;


    /**
     * 은행코드
     */
    private String bankCd;


    /**
     * 기관코드
     */
    private String orgCd;


    /**
     * 정상입금건수
     */
    private BigDecimal norinpCnt;


    /**
     * 정상입금금액
     */
    private BigDecimal norinpAmt;


    /**
     * 취소입금건수
     */
    private BigDecimal caninpCnt;


    /**
     * 취소입금금액
     */
    private BigDecimal caninpAmt;


    /**
     * 정상송금건수
     */
    private BigDecimal noroutCnt;


    /**
     * 정상송금금액
     */
    private BigDecimal noroutAmt;


    /**
     * 취소송금건수
     */
    private BigDecimal canoutCnt;


    /**
     * 취소송금금액
     */
    private BigDecimal canoutAmt;


    /**
     * 정상 성명 조회 건수
     */
    private BigDecimal norqueCnt;


    /**
     * UMS 사용 총 건수
     */
    private BigDecimal umsCnt;


    /**
     * 성명인증 조회 건수
     */
    private BigDecimal authCnt;


    /**
     * 실명인증 조회 건수
     */
    private BigDecimal nameCnt;


    /**
     * 최종 업데이트 날짜
     */
    private String lstIl;

}
