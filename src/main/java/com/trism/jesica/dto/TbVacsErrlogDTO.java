package com.trism.jesica.dto;


import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class TbVacsErrlogDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * seq
     */
    private Long errNo;


    /**
     * 기관코드
     */
    private String orgCd;


    /**
     * 거래일
     */
    private String trIl;


    /**
     * 거래번호
     */
    private String trNo;


    /**
     * 거래시간
     */
    private String trSi;


    /**
     * 은행코드
     */
    private String bankCd;


    /**
     * 가상계좌번호
     */
    private String acntNo;


    /**
     * 거래금액
     */
    private BigDecimal trAmt;


    /**
     * 오류코드
     */
    private String errCd;

}
