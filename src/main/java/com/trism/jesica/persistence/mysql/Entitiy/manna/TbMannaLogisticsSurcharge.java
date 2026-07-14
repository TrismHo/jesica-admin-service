package com.trism.jesica.persistence.mysql.Entitiy.manna;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "manna_logistics_surcharge")
@Data
public class TbMannaLogisticsSurcharge implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 추가요금_순번
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "surcharge_no", nullable = false)
    private Integer surchargeNo;

    /**
     * 우편번호_시작
     */
    @Column(name = "postcode_s", length = 5)
    private String postcodeS;

    /**
     * 우편번호_종료
     */
    @Column(name = "postcode_e", length = 5)
    private String postcodeE;

    /**
     * 지역_이름
     */
    @Column(name = "addr_name", length = 100)
    private String addrName;
}
