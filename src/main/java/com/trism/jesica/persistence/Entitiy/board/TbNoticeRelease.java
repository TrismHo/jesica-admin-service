package com.trism.jesica.persistence.Entitiy.board;

import com.trism.jesica.persistence.type.DataStatus;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 공지_프로그램업데이트
 */
@Entity
@Data
@Table(name = "tb_notice_release")
public class TbNoticeRelease implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 공지_번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "notice_no", insertable = false, nullable = false)
    private Long noticeNo;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상)
     */
    @Column(name = "data_status", nullable = false)
    private DataStatus dataStatus;

    /**
     * 등록_일시
     */
    @Column(name = "insert_date", updatable = false)
    private LocalDateTime insertDate;

    /**
     * 등록_사용자
     */
    @Column(name = "insert_user_id")
    private String insertUserId = null;

    /**
     * 수정_일시
     */
    @Column(name = "update_date")
    private LocalDateTime updateDate;

    /**
     * 수정_사용자
     */
    @Column(name = "update_user_id")
    private String updateUserId = null;

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
     * 플랫폼 : 1제시카 2픽오더
     */
    @Column(name = "platform_type")
    private Integer platformType = null;


    /**
     * 프로그램: 1관리자 2고객앱
     */
    @Column(name = "program_type")
    private Integer programType = null;


}
