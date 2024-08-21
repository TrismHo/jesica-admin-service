package com.trism.jesica.persistence.mysql.Entitiy.cust;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbStore;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "jesicar_main.tb_store_cash_log")
public class TbStoreCashLog implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 로그_번호
     */
    @Id
    @Column(name = "log_no", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long logNo;

    /**
     * 가맹점_번호
     */
    @Column(name = "store_no", nullable = false)
    private Integer storeNo;

    /**
     * 브랜드 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_no", insertable = false, updatable = false)
    @JsonManagedReference
    private TbStore store;

    /**
     * 입력_일시
     */
    @Column(name = "insert_date", nullable = false)
    private LocalDateTime insertDate;

    /**
     * 입력_사용자ID
     */
    @Column(name = "insert_user_id")
    private String insertUserId;

    /**
     * 입출금코드 (SYS_TYPE=CC)
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
     * 이체_업무그룹 (1: 제휴본사, 2: 총판, 3: 가맹점, 4: 배송원, 5: 고객)
     */
    @Column(name = "tran_group_type")
    private Integer tranGroupType;

    /**
     * 이체_그룹번호
     */
    @Column(name = "tran_group_no")
    private Integer tranGroupNo;

    /**
     * 이체_그룹명
     */
    @Column(name = "tran_group_name")
    private String tranGroupName;

    /**
     * 참조정보(주문번호/입출금번호)
     */
    @Column(name = "refer_info")
    private String referInfo;

    /**
     * 메모
     */
    @Column(name = "memo")
    private String memo;

}
