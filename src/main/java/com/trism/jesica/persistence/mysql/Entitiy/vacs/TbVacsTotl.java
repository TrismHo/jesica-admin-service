package com.trism.jesica.persistence.mysql.Entitiy.vacs;

import com.trism.jesica.persistence.mysql.id.TbVacsTotllD;
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
@IdClass(TbVacsTotllD.class)
@Table(name = "tb_vacs_totl")
public class TbVacsTotl implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 거래일자
     */
    @Id
    @Column(name = "tr_il", nullable = false)
    private String trIl;

    /**
     * 은행코드
     */
    @Id
    @Column(name = "bank_cd", nullable = false)
    private String bankCd;

    /**
     * 기관코드
     */
    @Id
    @Column(name = "org_cd", nullable = false)
    private String orgCd;

    /**
     * 정상입금건수
     */
    @Column(name = "norinp_cnt")
    private BigDecimal norinpCnt;

    /**
     * 정상입금금액
     */
    @Column(name = "norinp_amt")
    private BigDecimal norinpAmt;

    /**
     * 취소입금건수
     */
    @Column(name = "caninp_cnt")
    private BigDecimal caninpCnt;

    /**
     * 취소입금금액
     */
    @Column(name = "caninp_amt")
    private BigDecimal caninpAmt;

    /**
     * 정상송금건수
     */
    @Column(name = "norout_cnt")
    private BigDecimal noroutCnt;

    /**
     * 정상송금금액
     */
    @Column(name = "norout_amt")
    private BigDecimal noroutAmt;

    /**
     * 취소송금건수
     */
    @Column(name = "canout_cnt")
    private BigDecimal canoutCnt;

    /**
     * 취소송금금액
     */
    @Column(name = "canout_amt")
    private BigDecimal canoutAmt;

    /**
     * 정상 성명 조회 건수
     */
    @Column(name = "norque_cnt")
    private BigDecimal norqueCnt;

    /**
     * UMS 사용 총 건수
     */
    @Column(name = "ums_cnt")
    private BigDecimal umsCnt;

    /**
     * 성명인증 조회 건수
     */
    @Column(name = "auth_cnt")
    private BigDecimal authCnt;

    /**
     * 실명인증 조회 건수
     */
    @Column(name = "name_cnt")
    private BigDecimal nameCnt;

    /**
     * 최종 업데이트 날짜
     */
    @Column(name = "lst_il")
    private String lstIl;

}
