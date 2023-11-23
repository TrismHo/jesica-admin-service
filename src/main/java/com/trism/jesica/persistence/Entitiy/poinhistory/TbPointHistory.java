package com.trism.jesica.persistence.Entitiy.poinhistory;


import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
//@AllArgsConstructor
//@Builder
@Getter
@Setter
@ToString(callSuper = true, exclude = {})
@DynamicInsert
@DynamicUpdate
@Table(name = "tb_point_history")
public class TbPointHistory implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     *  주문 포인트 적립 seq
     */
    @Id
    @Column(name = "point_his_id", nullable = false)
    private String pointHisId;

    /**
     * 주문번호
     */
    @Column(name = "order_no", nullable = false)
    private Long orderNo;

    /**
     * 고객번호
     */
    @Column(name = "user_no")
    private Long userNo;

    /**
     * 주문 포인트 적립 금액
     */
    @Column(name = "ord_point_amt")
    private Integer ordPointAmt;

    /**
     * 적립률(액)
     */
    @Column(name = "point")
    private BigDecimal point;

    /**
     * 1.적립률 , 2.금액
     */
    @Column(name = "point_type")
    private Integer pointType;


    /**
     * 1.적립 , 0.주문취소
     */
    @Column(name = "data_status")
    private Integer dataStatus;

    /**
     * 적립전 고객 포인트
     */
    @Column(name = "pre_cust_point")
    private Integer preCustPoint;

    /**
     * 적립전 고객 누적포인트
     */
    @Column(name = "pre_cust_acc_point")
    private String preCustAccPoint;


}
