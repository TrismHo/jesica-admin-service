package com.trism.jesica.persistence.type;

public enum ServiceType {
    RENTCAR("렌트카"), //렌트카
    CONSIGNMENT("탁송"), //탁송
    RESTAURANT("맛집"), //맛집
    MART("마트"); //마트

    private final String str;

    private ServiceType(String str) {
        this.str = str;
    }

    public String str() {
        return str;
    }
}
