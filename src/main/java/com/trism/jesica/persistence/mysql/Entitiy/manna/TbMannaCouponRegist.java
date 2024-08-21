package com.trism.jesica.persistence.mysql.Entitiy.manna;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 만나_쿠폰
 */
@Getter
@Setter
@EqualsAndHashCode // 필수
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "manna_coupon_regist")
public class TbMannaCouponRegist implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 등록 일련번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "regist_no", insertable = false, nullable = false)
    private Long registNo;

    /**
     * 쿠폰번호
     */
    @Column(name = "publish_no")
    private Long publishNo;


    /**
     * 등록일
     */
    @Column(name = "reg_date")
    private LocalDateTime regDate;

    /**
     * 등록자(고객)
     */
    @Column(name = "reg_cust_no")
    private Long regCustNo;

    /**
     * 전화번호
     */
    @Column(name = "reg_cust_tel")
    private String regCustTel;

    /**
     * (만나)등록일련번호(CU_CPN_NO)
     */
    @Column(name = "reg_cpn_no")
    private Long regCpnNo;
}
