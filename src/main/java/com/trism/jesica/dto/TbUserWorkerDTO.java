package com.trism.jesica.dto;


public interface TbUserWorkerDTO {

    /**
     * 드라이버 번호
     */
    Long getWorkerNo();

    /**
     * 드라이버 프로필 사진
     */
    String getProfileFile();

    /**
     * 드라이버 급여방식
     */
    Integer getWorkerPayType();

    /**
     * 동시배차건수
     */
    Integer getDlvyLimit();

    /**
     * 출근상태
     */
    Integer getAttendStatus();

    /**
     * 사원번호
     */
    String getRegistNum();

    /**
     * 드라이버 이름
     */
    String getName();

    /**
     * 드라이버 연락처
     */
    String getPhone();

    /**
     * 드라이버 성별
     */
    String getGender();

    /**
     * 입사일
     */
    String getJoinDate();

    /**
     * 퇴사일
     */
    String getRetireDate();

    /**
     * 거주지 주소
     */
    String getAddr();

    /**
     * 메모
     */
    String getMemo();

    /**
     * 로그인 ID
     */
    String getUserId();

    /**
     * 면허증 사진
     */
    String getLicenseFile();

    /**
     * 면허번호
     */
    String getLicenseNum();

    /**
     * 면허종류
     */
    String getLicenseType();

    /**
     * 면허갱신마감일
     */
    String getLicenseExpDate();

    /**
     * 면허 만료여부
     */
    Integer getLicenseExpYn();
}
