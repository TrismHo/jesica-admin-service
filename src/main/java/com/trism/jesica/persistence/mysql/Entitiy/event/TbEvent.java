package com.trism.jesica.persistence.mysql.Entitiy.event;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.trism.jesica.persistence.mysql.core.entity.CreatedDateEntity;
import com.trism.jesica.persistence.mysql.type.DataStatus;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * 이벤트
 */
@Entity
@Table(name = "tb_event")
@Data
@Getter
@Setter
public class TbEvent extends CreatedDateEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 이벤트_번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "event_no", insertable = false, nullable = false)
    private Long eventNo;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상)
     */
    @Column(name = "data_status", nullable = false)
    private DataStatus dataStatus = null;

    /**
     * 노출여부(0:숨김, 1:노출)
     */
    @Column(name = "view_yn", nullable = false)
    private Integer viewYn = 1;

    /**
     * 등록_사용자
     */
    @Column(name = "insert_user_id")
    private String insertUserId = null;

    /**
     * 시작일
     */
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    @Column(name = "start_date")
    private LocalDateTime startDate;

    /**
     * 종료일
     */
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    @Column(name = "end_date")
    private LocalDateTime endDate;

    /**
     * 제목
     */
    @Column(name = "title")
    private String title = null;

    /**
     * 내용
     */
    @Column(name = "body")
    private String body = null;

    /**
     * 플랫폼 타입(0. 사용안함, 1. 제시카, 2. 양파오더, 3. 세날)
     */
    @Column(name = "platform_type", nullable = false)
    private Integer platformType = 0;


}
