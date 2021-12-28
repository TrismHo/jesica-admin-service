package com.trism.jesica.persistence.Entitiy.board;

import com.trism.jesica.persistence.core.entity.BaseEntity;
import com.trism.jesica.persistence.type.DataStatus;
import lombok.Data;

import javax.persistence.*;

/**
 * 공지_제휴사
 */
@Entity
@Data
@Table(name = "tb_notice_company")
public class TbNoticeCompany extends BaseEntity {
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
     * 대상(3:가맹점, 7:배송그룹)
     */
    @Column(name = "group_type")
    private Integer groupType = null;

    /**
     * 가맹점명/배송그룹명
     */
    @Column(name = "group_name")
    private String groupName = null;

    /**
     * 배송그룹_번호(group_type=7인 경우 사용)
     */
    @Column(name = "dlvy_no")
    private Integer dlvyNo = null;

    /**
     * 가맹점_번호(group_type=3인 경우 사용)
     */
    @Column(name = "store_no")
    private Integer storeNo = null;

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