package com.trism.jesica.persistence.mysql.type;

public enum StoreType {
    ONLY_DELIVERY("배달가맹"), //배달전용
    ORDER_DELIVERY("음식매장"), //주문배달
    MART("마트"), //마트
    TRADITIONAL_MARKET("전통시장") //전통시장
    ;

    private final String str;

    private StoreType(String str) {
        this.str = str;
    }

    public String str() {
        return this.str;
    }
}
