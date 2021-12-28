package com.trism.jesica.persistence.Entitiy;

import lombok.Data;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 기사_가입신청_내역
 */
@Data
@Entity
@Table(name = "tb_worker_apply")
public class TbWorkerApply implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 지원_번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(insertable = false, name = "apply_no", nullable = false)
    private Integer applyNo;

    /**
     * 최종승인_상태
     */
    @Column(name = "auth_status", nullable = false)
    private Integer authStatus = 0;



    /**
     * 최종승인_일시
     */
    @Column(name = "auth_date")
    private LocalDateTime authDate;

    /**
     * 1: 렌터카, 2: 탁송, 3: 맛집, 4: 마트
     */
    @Column(name = "service_type")
    private Integer serviceType = null;

    /**
     * 총판_번호
     */
    @Column(name = "branch_no")
    private Integer branchNo = null;

    /**
     * 기사_번호 (최종 승인후 발급)
     */
    @Column(name = "worker_no")
    private Integer workerNo = null;

    /**
     * 이름
     */
    @Column(name = "name")
    private String name = null;

    /**
     * 주민번호(앞6자리)
     */
    @Column(name = "resident_num")
    private String residentNum = null;

    /**
     * 휴대폰번호
     */
    @Column(name = "phone", nullable = false)
    private String phone;

    /**
     * SMS_수신여부(0: 거부, 1: 동의)
     */
    @Column(name = "sms_yn")
    private Integer smsYn = 1;

    /**
     * 프로필_승인_상태
     */
    @Column(name = "profile_auth_status", nullable = false)
    private Integer profileAuthStatus = 0;

    /**
     * 프로필_사진
     */
    @Column(name = "profile_file")
    private String profileFile = null;

    /**
     * 프로필_사진_썸네일
     */
    @Column(name = "profile_file_small")
    private String profileFileSmall = null;

    /**
     * 면허증_승인_상태
     */
    @Column(name = "license_auth_status", nullable = false)
    private Integer licenseAuthStatus = 0;

    /**
     * 면허증_사진
     */
    @Column(name = "license_file")
    private String licenseFile = null;

    /**
     * 면허_번호
     */
    @Column(name = "license_num")
    private String licenseNum = null;

    /**
     * 면허_종류 (SYS_TYPE = LC)
     */
    @Column(name = "license_type")
    private String licenseType = null;

    /**
     * 면허_갱신_마감일(YYYYMMDD)
     */
    @Column(name = "license_exp_date")
    private String licenseExpDate = null;

    /**
     * 경력확인서_승인_상태
     */
    @Column(name = "career_auth_status", nullable = false)
    private Integer careerAuthStatus = 0;

    /**
     * 경력확인서_파일
     */
    @Column(name = "career_file")
    private String careerFile = null;

    /**
     * 계졍발급 여부(0: 미발급 , 1: 발급)
     */
    @Column(name = "sign_yn")
    private Integer signYn = 0;

    /**
     * 등록일
     */
    @Column(name = "insert_date", updatable = false, nullable = false)
    @CreatedDate
    private LocalDateTime insertDate;

    /**
     * 수정일
     */
    @Column(name = "update_date", insertable = false)
    @LastModifiedDate
    private LocalDateTime updateDate;
    
}