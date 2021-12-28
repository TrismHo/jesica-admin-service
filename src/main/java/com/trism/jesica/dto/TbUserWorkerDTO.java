package com.trism.jesica.dto;


import com.trism.jesica.persistence.type.DataStatus;

import java.time.LocalDateTime;

public interface TbUserWorkerDTO {

     Long workerNo();

    /**
     * 수정_일시
     */
     LocalDateTime updateDate();

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
     DataStatus dataStatus();

    /**
     * 출근_상태 (0: 퇴근, 1: 출근, 2: 휴식)
     */
     Integer attendStatus();

    /**
     * 정지_사유_코드 (SYS_TYPE = BL)
     */
     String blockTypeCode();

    /**
     * 제휴본사_번호
     */
     Integer headNo();

    /**
     * 총판_번호
     */
     Integer branchNo();

    /**
     * 가맹점_번호
     */
     Integer storeNo();
    /**
     * 사원_번호
     */
     String registNum();

    /**
     * 이름
     */
     String name();

    /**
     * 전화번호
     */
     String phone();

    /**
     * 성별 (N: 알수없음, M: 남성, F: 여성)
     */
     String gender();

    /**
     * 승인_일자 (YYYYMMDD)
     */
     String joinDate();

    /**
     * 퇴사_일자 (YYYYMMDD)
     */
     String retireDate();

    /**
     * 주소
     */
     String addr();

    /**
     * 예치금
     */
     Integer deposit();

    /**
     * 캐시
     */
     Integer cash();

    /**
     * 캐시_체납금
     */
     Integer cashDefault();

    /**
     * 가상계좌_구분_코드 (SYS_TYPE = CBT)
     */
     String cybankTypeCode();

    /**
     * 가상계좌_번호
     */
     String cybankAccount();

    /**
     * PIN_번호 (출금비밀번호)
     */
     String pinNum();

    /**
     * 인출은행_구분_코드 (SYS_TYPE = BT)
     */
     String bankTypeCode();

    /**
     * 인출은행_계좌번호
     */
     String bankAccount();

    /**
     * 인출은행_예금주
     */
     String bankOwner();

    /**
     * 프로필_사진
     */
     String profileFile();

    /**
     * 프로필_사진_썸네일
     */
     String profileFileSmall();

    /**
     * 면허증_사진
     */
     String licenseFile();

    /**
     * 면허_번호
     */
     String licenseNum();

    /**
     * 면허_종류 (SYS_TYPE = LC)
     */
     String licenseType();

    /**
     * 면허_갱신_마감일(YYYYMMDD)
     */
     String licenseExpDate();

    /**
     * 면허_만료_여부 (0: 유효, 1: 만료)
     */
     Integer licenseExpYn();

    /**
     * 메모
     */
     String memo();


   /* public TbUserWorker insertData() {
        return TbUserWorker.builder()
                .workerNo(this.workerNo)
                .updateDate(this.updateDate)
                .dataStatus(this.dataStatus)
                .attendStatus(this.attendStatus)
                .blockTypeCode(this.blockTypeCode)
                .headNo(this.headNo)
                .storeNo(this.storeNo)
                .branchNo(this.branchNo)
                .name(this.name)
                .phone(this.phone)
                .gender(this.gender)
                .registNum(this.registNum)
                .joinDate(this.joinDate)
                .retireDate(this.retireDate)
                .addr(this.addr)
                .deposit(this.deposit)
                .cash(this.cash)
                .cashDefault(this.cashDefault)
                .cybankTypeCode(this.cybankTypeCode)
                .cybankAccount(this.cybankAccount)
                .pinNum(this.pinNum)
                .bankTypeCode(this.bankTypeCode)
                .bankAccount(this.bankAccount)
                .bankOwner(this.bankOwner)
                .profileFile(this.profileFile)
                .profileFileSmall(profileFileSmall)
                .licenseFile(licenseFile)
                .licenseNum(licenseNum)
                .licenseType(licenseType)
                .licenseExpDate(licenseExpDate)
                .licenseExpYn(licenseExpYn)
                .memo(this.memo)
                .build();
    }*/

}
