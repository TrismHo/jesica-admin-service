package com.trism.jesica.persistence.mysql.type;

public enum AuthStatus {
    UNCERTIFIED, //미인증
    APPLICATION, //신청
    APPROVAL, //승인
    DECLINE_AUTH, //거절
}
