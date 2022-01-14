package com.trism.jesica.dto;

import com.trism.jesica.persistence.Entitiy.business.TbUserWorker;
import com.trism.jesica.persistence.type.AttendStatusType;
import com.trism.jesica.persistence.type.DataStatus;
import com.trism.jesica.persistence.type.UserType;
import lombok.Data;

import java.time.LocalDateTime;


@Data
public class TbUserWorkerData {

    Long userNo;

    private String insertUserId;
    private String userId;
    private String userPwd;
    private UserType userType;
    private Boolean pushOrderYn;
    private Boolean pushNoticeYn;
    private Boolean pushMarketingYn;
    private Integer workerPayType;
    private Integer dlvyLimit;

    private Integer headNo;
    private Integer branchNo;
    private Integer storeNo;

    private LocalDateTime updateDate;
    private DataStatus dataStatus;
    private AttendStatusType attendStatus;
    private String blockTypeCode;
    private String registNum;
    private String name;
    private String phone;
    private String gender;
    private String joinDate;
    private String retireDate;
    private String addr;
    private Integer deposit;
    private Integer cash;
    private Integer cashDefault;
    private String cybankTypeCode;
    private String cybankAccount;
    private String pinNum;
    private String bankTypeCode;
    private String bankAccount;
    private String bankOwner;
    private String profileFile;
    private String memo;
    private String profileFileSmall;
    private String licenseFile;
    private String licenseNum;
    private String licenseType;
    private String licenseExpDate;
    private Integer licenseExpYn;

    public TbUserWorker insertData() {
        return TbUserWorker.builder()
                .userNo(this.userNo)
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
                .workerPayType(this.workerPayType)
                .dlvyLimit(this.dlvyLimit)
                .build();
    }
   /* public TbUserWorker insertData() {
        return TbUserWorker.builder()
                .userNo(this.userNo)
                .headNo(this.headNo)
                .branchNo(this.branchNo)
                .storeNo(this.storeNo)
                .insertUserId(this.insertUserId)
                .userId(this.userId)
                .userPwd(this.userPwd)
                .userType(this.userType)
                .pushOrderYn(this.pushOrderYn)
                .pushNoticeYn(this.pushNoticeYn)
                .pushMarketingYn(this.pushMarketingYn)
                .updateDate(this.updateDate)
                .dataStatus(this.dataStatus)
                .attendStatus(this.attendStatus)
                .blockTypeCode(this.blockTypeCode)
                .registNum(this.registNum)
                .name(this.name)
                .phone(this.phone)
                .gender(this.gender)
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
                .memo(this.memo)
                .build();
    }*/

    public TbUserWorker insertDataEncrypt(String pinNum, String bankAccount, String bankOwner) {
        return TbUserWorker.builder()
                .userNo(this.userNo)
                .headNo(this.headNo)
                .branchNo(this.branchNo)
                .storeNo(this.storeNo)
                .insertUserId(this.insertUserId)
                .userId(this.userId)
                .userPwd(this.userPwd)
                .userType(this.userType)
                .pushOrderYn(this.pushOrderYn)
                .pushNoticeYn(this.pushNoticeYn)
                .pushMarketingYn(this.pushMarketingYn)
                .updateDate(this.updateDate)
                .dataStatus(this.dataStatus)
                .attendStatus(this.attendStatus)
                .blockTypeCode(this.blockTypeCode)
                .registNum(this.registNum)
                .name(this.name)
                .phone(this.phone)
                .gender(this.gender)
                .joinDate(this.joinDate)
                .retireDate(this.retireDate)
                .addr(this.addr)
                .deposit(this.deposit)
                .cash(this.cash)
                .cashDefault(this.cashDefault)
                .cybankTypeCode(this.cybankTypeCode)
                .cybankAccount(this.cybankAccount)
                .pinNum(pinNum)
                .bankTypeCode(this.bankTypeCode)
                .bankAccount(bankAccount)
                .bankOwner(bankOwner)
                .profileFile(this.profileFile)
                .memo(this.memo)
                .workerPayType(this.workerPayType)
                .build();
    }
}
