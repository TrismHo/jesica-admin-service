package com.trism.jesica.persistence.mysql.Entitiy.cust;

import com.trism.jesica.persistence.mysql.type.DataStatus;
import lombok.*;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 고객
 */
@Table(name = "tb_cust")
@Getter
@Setter
@EqualsAndHashCode // 필수
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class TbCustName implements Serializable {

    /**
     * 고객 일련번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cust_no")
    private Long custNo;

    /**
     * 서비스 번호
     */
    @Column(name = "service_no", nullable = false)
    private Integer serviceNo = null;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    @Column(name = "data_status")
    @Enumerated(EnumType.ORDINAL)
    private DataStatus dataStatus;

    /**
     * 앱로그인 ID
     */
    @Column(name = "login_id")
    private String loginId;


    /**
     * 고객 이름
     */
    @Column(name = "cust_name")
    private String custName;

    /**
     * 고객 전화번호
     */
    @Column(name = "cust_tel")
    private String custTel;

}
