package com.trism.jesica.persistence.type;

public enum DataStatus {
    DELETE("삭제"), //삭제
    OK("정상"), //정상
    STOP("정지"); //정지

    private final String str;

    private DataStatus(String str) {
        this.str = str;
    }

    public String str() {
        return str;
    }
}
