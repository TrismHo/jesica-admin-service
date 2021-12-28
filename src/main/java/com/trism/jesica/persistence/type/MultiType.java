package com.trism.jesica.persistence.type;

public enum MultiType {
    NONE("사용안함"), //사용안함
    DEPENDENCY("종속"), //종속
    MASTER("마스터") //마스터
    ;

    private final String str;

    private MultiType(String str) {
        this.str = str;
    }

    public String str() { return this.str; }
}
