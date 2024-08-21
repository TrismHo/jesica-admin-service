package com.trism.jesica.persistence.mysql.type;

public enum GoodsStatus {
    NOT_FOR_SALE("판매중지"),
    SALE("판매중"),
    SOLD_OUT("품절")
    ;

    private final String str;

    private GoodsStatus(String str) {
        this.str = str;
    }

    public String str() {
        return str;
    }

}
