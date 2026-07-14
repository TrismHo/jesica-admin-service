package com.trism.jesica.persistence.mysql.Entitiy.board;

import com.trism.jesica.config.EmptyStringToNullConverter;
import com.trism.jesica.persistence.mysql.Entitiy.app.TbAppService;
import com.trism.jesica.persistence.mysql.core.entity.BaseEntity;
import com.trism.jesica.persistence.mysql.type.DataStatus;
import lombok.Data;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import javax.persistence.*;

/**
 * 공지_플랫폼
 */
@Table(name = "tb_notice_platform")
@Data
@Entity
public class TbNoticePlatform extends BaseEntity {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="service_no", referencedColumnName="service_no",
            insertable=false, updatable=false)
    @NotFound(action = NotFoundAction.IGNORE)
    private TbAppService service;
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
    private DataStatus dataStatus = null;

    /**
     * 서비스 번호
     */
    @Column(name = "service_no", nullable = false)
    private Integer serviceNo = null;

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
     * 수정_사용자
     */
    @Column(name = "update_user_id")
    private String updateUserId = null;

    /**
     * 대상(0:전체, 4:배송원, 8:제휴사)
     */
    @Column(name = "group_type")
    private Integer groupType = null;

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
     * 플랫폼 타입(0. 사용안함, 1. 제시카, 2. 양파오더, 3. 세날 )
     */
    @Column(name = "platform_type", nullable = false)
    private Integer platformType = 0;

    /**
     * 앱코드
     */
    @Column(name = "app_code")
    @Convert(converter = EmptyStringToNullConverter.class)
    private String appCode = null;

    @Transient
    private String appName = null;

}
