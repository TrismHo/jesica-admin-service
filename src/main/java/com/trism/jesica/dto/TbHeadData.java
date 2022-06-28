package com.trism.jesica.dto;

import com.trism.jesica.persistence.Entitiy.business.TbHead;
import com.trism.jesica.persistence.type.DataStatus;
import com.trism.jesica.persistence.type.ServiceYn;
import lombok.Data;

@Data
public class TbHeadData {


    private Long headNo;

    private Integer brandNo;

    private String insertUserId;

    private String updateUserId;

    private DataStatus dataStatus;

    private ServiceYn serviceYn;

    private String headName;

    private String headTel;

    private String authTel;

    private Integer deposit;

    private Integer cash;

    private Integer cashDefault;

    private String memoService;

    private String memoArea;

    private String memoEtc;

    private String cybankTypeCode;

    private String cybankAccount;

    private String cybankOwner;

    private String pinNum;

    private String bankTypeCode;

    private String bankAccount;

    private String bankOwner;

    private Boolean dlvyMngYn;

    private String actualOwner;

    private String actualAddr;

    private String actualTel;

    public TbHead insertData() {
        return TbHead.builder()
                .headNo(this.headNo)
                .brandNo(this.brandNo)
                .insertUserId(this.insertUserId)
                .updateUserId(this.updateUserId)
                .dataStatus(this.dataStatus)
                .serviceYn(this.serviceYn)
                .headName(this.headName)
                .headTel(this.headTel)
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
                .bankTypeCode(this.bankTypeCode)
                .bankAccount(this.bankAccount)
                .bankOwner(this.bankOwner)
                .dlvyMngYn(this.dlvyMngYn)
                .actualOwner(this.actualOwner)
                .actualAddr(this.actualAddr)
                .actualTel(this.actualTel)
                .build();
    }

    public TbHead insertDataEncrypt(String pinNum, String bankAccount, String bankOwner) {
        return TbHead.builder()
                .headNo(this.headNo)
                .brandNo(this.brandNo)
                .insertUserId(this.insertUserId)
                .updateUserId(this.updateUserId)
                .dataStatus(this.dataStatus)
                .serviceYn(this.serviceYn)
                .headName(this.headName)
                .headTel(this.headTel)
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
                .dlvyMngYn(this.dlvyMngYn)
                .actualOwner(this.actualOwner)
                .actualAddr(this.actualAddr)
                .actualTel(this.actualTel)
                .build();
    }



}
