package com.trism.jesica.persistence.mysql.Entitiy.safe;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 안심번호_할당_로그
 */
@Data
@Table(name = "tb_safen_mapping_log")
@Entity
public class TbSafenMappingLog implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 로그_일련번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(insertable = false, name = "log_no", nullable = false)
    private Long logNo;

    /**
     * 안심번호
     */
    @Column(name = "safen_num", nullable = false)
    private String safenNum;

    /**
     * 매핑_전화번호
     */
    @Column(name = "mapping_num")
    private String mappingNum = null;

    /**
     * 요청일
     */
    @Column(name = "send_date")
    private LocalDateTime sendDate;

    /**
     * 만료일
     */
    @Column(name = "limited_date")
    private LocalDateTime limitedDate;

    /**
     * 처리일
     */
    @Column(name = "return_date")
    private LocalDateTime returnDate;

    /**
     * 처리결과
     */
    @Column(name = "result")
    private String result = null;


}
