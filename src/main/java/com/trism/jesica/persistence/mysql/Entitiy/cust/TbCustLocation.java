package com.trism.jesica.persistence.mysql.Entitiy.cust;

import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDateTime;

/**
 * 고객
 */
@Entity
@Table(name = "tb_cust_location")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@DynamicInsert
@DynamicUpdate
public class TbCustLocation  {

    /**
     * 고객 일련번호
     */
    @Id
    @Column(name = "cust_no")
    private Long custNo;

    /**
     * 주소1
     */
    @Column(name = "addr_1")
    private String addr1;

    /**
     * 주소2
     */
    @Column(name = "addr_2")
    private String addr2;

    /**
     * 수정일
     */
    @Column(name = "update_date", insertable = false)
    @LastModifiedDate
    private LocalDateTime updateDate;

    /**
     * 등록일
     */
    @Column(name = "insert_date", updatable = false, nullable = false)
    @CreatedDate
    private LocalDateTime insertDate;

}
