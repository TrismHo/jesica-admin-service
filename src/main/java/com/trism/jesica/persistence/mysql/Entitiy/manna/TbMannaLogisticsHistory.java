package com.trism.jesica.persistence.mysql.Entitiy.manna;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name = "manna_logistics_history")
@Data
@IdClass(TbMannaLogisticsHistory.Pk.class)
public class TbMannaLogisticsHistory implements Serializable {
    private static final long serialVersionUID = 1L;

    @Data
    public static class Pk implements Serializable {
        private Long logisticsNo;
        private LocalDateTime transDate;
    }

    /**
     * 택배발송_번호
     */
    @Id
    @Column(name = "logistics_no", nullable = false)
    private Long logisticsNo;

    /**
     * 배송시간(상태변경시간)
     */
    @Id
    @Column(name = "trans_date", nullable = false)
    private LocalDateTime transDate;

    /**
     * 등록일시
     */
    @Column(name = "put_date", insertable = false, updatable = false)
    private LocalDateTime putDate;

    /**
     * 배송상태_코드
     */
    @Column(name = "status_code", length = 10)
    private String statusCode;

    /**
     * 배송상태_설명
     */
    @Column(name = "status_text", length = 100)
    private String statusText;

    /**
     * 택배위치
     */
    @Column(name = "location", length = 100)
    private String location;

    /**
     * 기타상세
     */
    @Column(name = "description", length = 100)
    private String description;
}
