package com.trism.jesica.persistence.mysql.Entitiy.cust;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDateTime;
@Entity
@Table(name = "tb_cust_sns")
@Getter
@Setter
public class TbCustSns {

    @Id
    @Column(name = "sns_no")
    private Long snsNo;

    @Column(name = "cust_no")
    private Long custNo;

    @Column(name = "data_status")
    private Integer dataStatus;

    @Column(name = "app_code")
    private String appCode;

    @Column(name = "sns_type")
    private Integer snsType;

    @Column(name = "sns_token")
    private String snsToken;

    @Column(name = "insert_date")
    private LocalDateTime insertDate;

    @Column(name = "update_date")
    private LocalDateTime updateDate;
}
