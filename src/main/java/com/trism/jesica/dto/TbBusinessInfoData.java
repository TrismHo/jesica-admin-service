package com.trism.jesica.dto;

import lombok.Data;

@Data
public class TbBusinessInfoData {


    private Integer groupNo;

    private String insertUserId;

    private String updateUserId;

    private Integer groupType;

    private Integer corpType;

    private Integer authStatus;

    private String authDate;

    private String bizNum;
    private String bizName;
    private String bizOwner;
    private String bizType;
    private String bizItem;
    private String bizAddr;
    private String bizTel;
    private String bizEmail;

    public Integer getGroupNo() {
        return groupNo;
    }

    public void setGroupNo(Integer groupNo) {
        this.groupNo = groupNo;
    }

    public String getInsertUserId() {
        return insertUserId;
    }

    public void setInsertUserId(String insertUserId) {
        this.insertUserId = insertUserId;
    }

    public String getUpdateUserId() {
        return updateUserId;
    }

    public void setUpdateUserId(String updateUserId) {
        this.updateUserId = updateUserId;
    }

    public Integer getGroupType() {
        return groupType;
    }

    public void setGroupType(Integer groupType) {
        this.groupType = groupType;
    }

    public Integer getCorpType() {
        return corpType;
    }

    public void setCorpType(Integer corpType) {
        this.corpType = corpType;
    }

    public Integer getAuthStatus() {
        return authStatus;
    }

    public void setAuthStatus(Integer authStatus) {
        this.authStatus = authStatus;
    }

    public String getAuthDate() {
        return authDate;
    }

    public void setAuthDate(String authDate) {
        this.authDate = authDate;
    }

    public String getBizNum() {
        return bizNum;
    }

    public void setBizNum(String bizNum) {
        this.bizNum = bizNum;
    }

    public String getBizName() {
        return bizName;
    }

    public void setBizName(String bizName) {
        this.bizName = bizName;
    }

    public String getBizOwner() {
        return bizOwner;
    }

    public void setBizOwner(String bizOwner) {
        this.bizOwner = bizOwner;
    }

    public String getBizType() {
        return bizType;
    }

    public void setBizType(String bizType) {
        this.bizType = bizType;
    }

    public String getBizItem() {
        return bizItem;
    }

    public void setBizItem(String bizItem) {
        this.bizItem = bizItem;
    }

    public String getBizAddr() {
        return bizAddr;
    }

    public void setBizaddr(String bizAddr) {
        this.bizAddr = bizAddr;
    }

    public String getBizTel() {
        return bizTel;
    }

    public void setBizTel(String bizTel) {
        this.bizTel = bizTel;
    }

    public String getBizEmail() {
        return bizEmail;
    }

    public void setBizEmail(String bizEmail) {
        this.bizEmail = bizEmail;
    }
}
