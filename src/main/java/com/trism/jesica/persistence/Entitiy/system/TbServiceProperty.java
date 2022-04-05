package com.trism.jesica.persistence.Entitiy.system;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "tb_service_property")
public class TbServiceProperty implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 장소_번호
     */
    @Id
    @Column(name = "prop_name", nullable = false)
    private String propName;

    /**
     * 설정_값
     */
    @Column(name = "prop_value")
    private String propValue = "0";

    /**
     * 데이터_상태 (0: 삭제, 1: 정상)
     */
    @Column(name = "data_status")
    private Integer dataStatus = 1;

    /**
     * 등록_일시
     */
    @Column(name = "insert_date")
    private LocalDateTime insertDate;

    /**
     * 수정_일시
     */
    @Column(name = "update_date")
    private LocalDateTime updateDate;

    /**
     * 메모
     */
    @Column(name = "memo")
    private String memo;

}
