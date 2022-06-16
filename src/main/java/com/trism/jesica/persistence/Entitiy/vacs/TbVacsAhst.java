package com.trism.jesica.persistence.Entitiy.vacs;

import com.trism.jesica.persistence.id.TbVacsAhstID;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

@Entity
@Table(name = "tb_vacs_ahst")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Getter
@Setter
@ToString(callSuper = true, exclude = {})
@DynamicInsert
@DynamicUpdate
@IdClass(TbVacsAhstID.class)
public class TbVacsAhst implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 기관코드
     */
    @Id
    @Column(name = "org_cd", nullable = false)
    private String orgCd;

    /**
     * 거래일지
     */
    @Id
    @Column(name = "tr_il", nullable = false)
    private String trIl;

    /**
     * 거래고유번호
     */
    @Id
    @Column(name = "tr_no", nullable = false)
    private String trNo;

    /**
     * 거래시간
     */
    @Column(name = "tr_si", nullable = false)
    private String trSi;

    /**
     * 거래종류코드
     */
    @Column(name = "tr_cd", nullable = false)
    private String trCd;

    /**
     * 은행코드
     */
    @Column(name = "bank_cd")
    private String bankCd;

    /**
     * 가상계좌번호
     */
    @Column(name = "iacct_no")
    private String iacctNo;

    /**
     * 입금의뢰인
     */
    @Column(name = "iacct_nm")
    private String iacctNm;

    /**
     * 거래금액
     */
    @Column(name = "tr_amt")
    private BigDecimal trAmt = BigDecimal.ZERO;

    /**
     * 미타점금액
     */
    @Column(name = "mita_amt")
    private BigDecimal mitaAmt = BigDecimal.ZERO;

    /**
     * 처리상태(1:입금, 2: 취소, 3: 정산)
     */
    @Column(name = "inp_st")
    private String inpSt;

    /**
     * 응답시간
     */
    @Column(name = "inp_si")
    private String inpSi;

    /**
     * 취소처리시간
     */
    @Column(name = "caninp_si")
    private String caninpSi;

    /**
     * 입금은행코드
     */
    @Column(name = "iorg_cd")
    private String iorgCd;

    /**
     * CMS code
     */
    @Column(name = "cms_cd")
    private String cmsCd;

    /**
     * 매체구분
     */
    @Column(name = "media_gb")
    private String mediaGb;

}
