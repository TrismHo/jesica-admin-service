package com.trism.jesica.persistence.mysql.Entitiy.worker;

import com.trism.jesica.persistence.mysql.core.entity.BaseEntity;

import javax.persistence.*;

/**
 * 기사_가입신청_제출서류
 */
@Table(name = "tb_worker_apply_attach")
@Entity
public class TbWorkerApplyAttach extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 제출서류_번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "attach_no", insertable = false, nullable = false)
    private Integer attachNo;

    /**
     * 지원_번호
     */
    @Column(name = "apply_no", nullable = false)
    private Integer applyNo;

    /**
     * 제출서류구분(0: 기타, 1: 프로필사진, 2: 면허증, 3: 경력확인서)
     */
    @Column(name = "apply_attach_type", nullable = false)
    private Integer applyAttachType;

    /**
     * 승인_상태 (1: 신청, 2: 승인, 3: 반려)
     */
    @Column(name = "auth_status", nullable = false)
    private Integer authStatus = 1;


    /**
     * 승인/반려 처리자ID
     */
    @Column(name = "update_user_id")
    private String updateUserId = null;

    /**
     * 업로드_파일명
     */
    @Column(name = "upload_file")
    private String uploadFile = null;

    /**
     * 입력값_1
     */
    @Column(name = "param_1")
    private String param1 = null;

    /**
     * 입력값_2
     */
    @Column(name = "param_2")
    private String param2 = null;

    /**
     * 입력값_3
     */
    @Column(name = "param_3")
    private String param3 = null;

    /**
     * 입력값_3
     */
    @Column(name = "reject_memo")
    private String rejectMemo = null;


}
