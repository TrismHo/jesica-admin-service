package com.trism.jesica.persistence.Entitiy.vacs;

import com.trism.jesica.persistence.id.TbVacsVactID;
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
@IdClass(TbVacsVactID.class)
@Table(name = "tb_vacs_vact")
public class TbVacsVact implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 은행코드
     */
    @Id
    @Column(name = "bank_cd", nullable = false)
    private String bankCd;

    /**
     * 계좌번호
     */
    @Id
    @Column(name = "acct_no", nullable = false)
    private String acctNo;

    /**
     * 예금주명
     */
    @Column(name = "cmf_nm")
    private String cmfNm;

    /**
     * 기관코드
     */
    @Column(name = "org_cd", nullable = false)
    private String orgCd;

    /**
     * 계좌상태(0:할당전, 1:할당, :9:해지)
     */
    @Column(name = "acct_st", nullable = false)
    private String acctSt;

    /**
     * 등록일자
     */
    @Column(name = "reg_il", nullable = false)
    private String regIl;

    /**
     * 할당일자
     */
    @Column(name = "open_il")
    private String openIl;

    /**
     * 해지일자
     */
    @Column(name = "close_il")
    private String closeIl;

    /**
     * 최초거래일자
     */
    @Column(name = "fst_il")
    private String fstIl;

    /**
     * 최종거래일자
     */
    @Column(name = "lst_il")
    private String lstIl;

    /**
     * 총 거래금액
     */
    @Column(name = "tr_amt")
    private BigDecimal trAmt;

    /**
     * 거래금액조건(0 조건없음, 1금액=실금액, 2 금액>=실입금액, 3 금액<=실입금액)
     */
    @Column(name = "tramt_cond", nullable = false)
    private String tramtCond;

    /**
     * 수납회차 조건(0: 1계좌1수납 (이중입금불가) 1: 1계좌에 여러 수납)
     */
    @Column(name = "trmc_cond", nullable = false)
    private String trmcCond;

    /**
     * 입금가능시작일
     */
    @Column(name = "trbegin_il")
    private String trbeginIl;

    /**
     * 입금가능만료일
     */
    @Column(name = "trend_il")
    private String trendIl;

    /**
     * 입금가능시작시간
     */
    @Column(name = "trbegin_si")
    private String trbeginSi;

    /**
     * 입금가능만료시간
     */
    @Column(name = "trend_si")
    private String trendSi;

    /**
     * 기간내수납횟수
     */
    @Column(name = "seq_no")
    private BigDecimal seqNo = BigDecimal.ZERO;

    /**
     * CMS_CD
     */
    @Column(name = "cms_cd")
    private String cmsCd;

    /**
     * 타입 1:제휴본사 2:총판 3:가맹점
     */
    @Column(name = "group_type")
    private String groupType;

}
