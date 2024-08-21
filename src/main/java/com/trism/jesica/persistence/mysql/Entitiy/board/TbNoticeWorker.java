package com.trism.jesica.persistence.mysql.Entitiy.board;

import com.trism.jesica.persistence.mysql.core.entity.BaseEntity;
import com.trism.jesica.persistence.mysql.type.DataStatus;
import lombok.Data;

import javax.persistence.*;

/**
 * 공지_배송원
 */
@Entity
@Table(name = "tb_notice_worker")
@Data
public class TbNoticeWorker extends BaseEntity {
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
     * 등록_사용자_이름
     */
    @Column(name = "insert_user_name")
    private String insertUserName = null;


    /**
     * 수정_사용자
     */
    @Column(name = "update_user_id")
    private String updateUserId = null;

    /**
     * 대상(1:본사, 2:총판)
     */
    @Column(name = "group_type")
    private Integer groupType = null;

    /**
     * 본사명/총판명
     */
    @Column(name = "group_name")
    private String groupName = null;

    /**
     * 본사_번호
     */
    @Column(name = "head_no")
    private Integer headNo = null;

    /**
     * 총판_번호
     */
    @Column(name = "branch_no")
    private Integer branchNo = null;

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
