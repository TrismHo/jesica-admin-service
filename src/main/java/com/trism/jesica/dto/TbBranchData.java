package com.trism.jesica.dto;

import com.trism.jesica.persistence.Entitiy.business.TbBranch;
import com.trism.jesica.persistence.type.DataStatus;
import com.trism.jesica.persistence.type.ServiceYn;
import lombok.Data;

@Data
public class TbBranchData {

    private Long branchNo;

    private Integer headNo;

    private String insertUserId;

    private String updateUserId;

    private DataStatus dataStatus;

    private ServiceYn serviceYn;

    private Integer dlvyNo;

    private String branchName;

    private String branchTel;

    private String authTel;

    private Integer deposit;

    private Integer cash;

    private Integer cashDefault;

    private String memoService;

    private String memoArea;

    private String memoEtc;

    private String cybankTypeCode;

    private String cybankAccount;

    private String pinNum;

    private String bankTypeCode;

    private String bankAccount;

    private String bankOwner;

    private String actualOwner;

    private String actualAddr;

    private String actualTel;

    public TbBranch insertData() {
        return TbBranch.builder()
                .branchNo(this.branchNo)
                .headNo(this.headNo)
                .insertUserId(this.insertUserId)
                .updateUserId(this.updateUserId)
                .dataStatus(this.dataStatus)
                .serviceYn(this.serviceYn)
                .branchName(this.branchName)
                .branchTel(this.branchTel)
                .authTel(this.authTel)
                .deposit(this.deposit)
                .cash(this.cash)
                .cashDefault(this.cashDefault)
                .memoService(this.memoService)
                .memoArea(this.memoArea)
                .memoEtc(this.memoEtc)
                .cybankTypeCode(this.cybankTypeCode)
                .cybankAccount(this.cybankAccount)
                .pinNum(this.pinNum)
                .dlvyNo(this.dlvyNo)
                .bankTypeCode(this.bankTypeCode)
                .bankAccount(this.bankAccount)
                .bankOwner(this.bankOwner)
                .actualOwner(this.actualOwner)
                .actualAddr(this.actualAddr)
                .actualTel(this.actualTel)
                .build();
    }

    public TbBranch insertDataEncrypt(String pinNum, String bankAccount ,String bankOwner) {
        return TbBranch.builder()
                .branchNo(this.branchNo)
                .headNo(this.headNo)
                .insertUserId(this.insertUserId)
                .updateUserId(this.updateUserId)
                .dataStatus(this.dataStatus)
                .serviceYn(this.serviceYn)
                .branchName(this.branchName)
                .branchTel(this.branchTel)
                .authTel(this.authTel)
                .deposit(this.deposit)
                .cash(this.cash)
                .cashDefault(this.cashDefault)
                .memoService(this.memoService)
                .memoArea(this.memoArea)
                .memoEtc(this.memoEtc)
                .cybankTypeCode(this.cybankTypeCode)
                .cybankAccount(this.cybankAccount)
                .pinNum(pinNum)
                .bankTypeCode(this.bankTypeCode)
                .bankAccount(bankAccount)
                .bankOwner(bankOwner)
                .actualOwner(this.actualOwner)
                .actualAddr(this.actualAddr)
                .actualTel(this.actualTel)
                .build();
    }

}
