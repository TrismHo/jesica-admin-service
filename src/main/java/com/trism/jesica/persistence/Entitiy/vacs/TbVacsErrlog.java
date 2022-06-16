package com.trism.jesica.persistence.Entitiy.vacs;

import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Getter
@Setter
@ToString(callSuper = true, exclude = {})
@DynamicInsert
@DynamicUpdate
@Table(name = "tb_vacs_errlog")
public class TbVacsErrlog implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * seq
     */
    @Id
    @Column(name = "err_no", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long errNo;

    /**
     * 기관코드
     */
    @Column(name = "org_cd", nullable = false)
    private String orgCd;

    /**
     * 거래일
     */
    @Column(name = "tr_il", nullable = false)
    private String trIl;

    /**
     * 거래번호
     */
    @Column(name = "tr_no", nullable = false)
    private String trNo;

    /**
     * 거래시간
     */
    @Column(name = "tr_si", nullable = false)
    private String trSi;

    /**
     * 은행코드
     */
    @Column(name = "bank_cd")
    private String bankCd;

    /**
     * 가상계좌번호
     */
    @Column(name = "acnt_no")
    private String acntNo;

    /**
     * 거래금액
     */
    @Column(name = "tr_amt", nullable = false)
    private BigDecimal trAmt;

    /**
     * 오류코드
     */
    @Column(name = "err_cd")
    private String errCd;

}
