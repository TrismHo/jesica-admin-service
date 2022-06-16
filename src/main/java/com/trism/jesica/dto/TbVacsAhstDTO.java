package com.trism.jesica.dto;


import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class TbVacsAhstDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 기관코드
     */
    private String orgCd;


    /**
     * 거래일지
     */
    private String trIl;


    /**
     * 거래고유번호
     */
    private String trNo;


    /**
     * 거래시간
     */
    private String trSi;


    /**
     * 거래종류코드
     */
    private String trCd;


    /**
     * 은행코드
     */
    private String bankCd;


    /**
     * 가상계좌번호
     */
    private String iacctNo;


    /**
     * 입금의뢰인
     */
    private String iacctNm;


    /**
     * 거래금액
     */
    private BigDecimal trAmt;


    /**
     * 미타점금액
     */
    private BigDecimal mitaAmt;


    /**
     * 처리상태(1:입금, 2: 취소, 3: 정산)
     */
    private String inpSt;


    /**
     * 응답시간
     */
    private String inpSi;


    /**
     * 취소처리시간
     */
    private String caninpSi;


    /**
     * 입금은행코드
     */
    private String iorgCd;


    /**
     * CMS code
     */
    private String cmsCd;


    /**
     * 매체구분
     */
    private String mediaGb;

}
