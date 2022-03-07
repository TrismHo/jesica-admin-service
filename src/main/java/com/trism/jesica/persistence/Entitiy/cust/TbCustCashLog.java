package com.trism.jesica.persistence.Entitiy.cust;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.core.entity.CreatedDateEntity;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Entity
@Table(name = "tb_cust_cash_log")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@Getter
@Setter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbCustCashLog extends CreatedDateEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 로그번호
     */
    @Id
    @Column(name = "log_no", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long logNo;


    /**
     * 고객(FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cust_no", referencedColumnName = "cust_no", nullable = false)
    @JsonManagedReference
    private TbCust cust;

/*    *//**
     * 고객번호
     *//*
    @Column(name = "cust_no")
    private Long custNo;*/

    /**
     * 입력사용자 ID
     */
    @Column(name = "insert_user_id")
    private String insertUserId;

    /**
     * 입출금코드(SYS_TYPE=CC)
     */
    @Column(name = "cash_inout_code")
    private String cashInoutCode;

    /**
     * 입출금액
     */
    @Column(name = "cash")
    private Integer cash;

    /**
     * 잔액
     */
    @Column(name = "balance")
    private Integer balance;

    /**
     * 이체 업무그룹(1:제휴본사, 2:총판, 3:가맹점 ,4:배송원, 5:고객)
     */
    @Column(name = "trans_group_type")
    private Integer transGroupType;

    /**
     * 이체 그룹번호
     */
    @Column(name = "trans_group_no")
    private Integer transGroupNo;

    /**
     * 이체 그룹명
     */
    @Column(name = "trans_group_name")
    private String transGroupName;

    /**
     * 이체 그룹명
     */
    @Column(name = "refer_info")
    private String referInfo;

    /**
     * 이체 그룹명
     */
    @Column(name = "memo")
    private String memo;

    @Builder
    public TbCustCashLog(
            Long logNo,
            TbCust cust,
            String insertUserId,
            String cashInoutCode,
            Integer cash,
            Integer balance,
            Integer transGroupType,
            Integer transGroupNo,
            String transGroupName,
            String referInfo,
            String memo
    ) {
        this.logNo = logNo;
        this.cust = cust;
        this.insertUserId = insertUserId;
        this.cashInoutCode = cashInoutCode;
        this.cash = cash;
        this.balance = balance;
        this.transGroupType = transGroupType;
        this.transGroupNo = transGroupNo;
        this.transGroupName = transGroupName;
        this.referInfo = referInfo;
        this.memo = memo;
    }

}
