package com.trism.jesica.persistence.Entitiy.event;

import com.trism.jesica.persistence.core.entity.BaseEntity;
import com.trism.jesica.persistence.type.DataStatus;
import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * 이벤트
 */
@Entity
@Table(name = "tb_event")
@Data
public class TbEvent extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 이벤트_번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "event_id", insertable = false, nullable = false)
    private Long eventId;

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
     * 노출여부(0:숨김, 1:노출)
     */
    @Column(name = "view_service_type", nullable = false)
    private Integer viewServiceType = 1;

    /**
     * 등록_사용자
     */
    @Column(name = "insert_user_id")
    private String insertUserId = null;

    /**
     * 수정_사용자
     */
    @Column(name = "update_user_id")
    private String updateUserId = null;

    /**
     * 시작일
     */
    @Column(name = "start_date")
    private Timestamp startDate;

    /**
     * 종료일
     */
    @Column(name = "end_date")
    private Timestamp endDate;

    /**
     * 썸네일_파일_경로
     */
    @Column(name = "img_file_small")
    private String imgFileSmall = null;

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

    
}