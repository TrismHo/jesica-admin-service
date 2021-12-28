package com.trism.jesica.persistence.type;

/**
 * 성별 (N: 알수없음, M: 남성, F: 여성)
 */
public enum GenderType {
    N("알수없음"),
    M("남성"),
    F("여성");

    private final String str;

    private GenderType(String str) {
        this.str = str;
    }

    public String str() { return this.str; }
}
