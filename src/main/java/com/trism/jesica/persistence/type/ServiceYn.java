package com.trism.jesica.persistence.type;

public enum ServiceYn {
    TEST_OR_CALC("테스트"), //테스트 또는 정산
    SERVICE("서비스"); //서비스

    private final String str;

    private ServiceYn(String str) {
        this.str = str;
    }

    public String str() {
        return str;
    }
}
