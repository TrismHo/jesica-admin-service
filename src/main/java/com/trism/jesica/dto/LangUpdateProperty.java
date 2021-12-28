package com.trism.jesica.dto;

import java.time.LocalDateTime;

public interface LangUpdateProperty {

    /**
     * 번호
     */
    Long getTslId();

    /**
     * 활성화 여부
     */
    Integer getTslActive();

    /**
     * 뎁스1
     */
    String getTslKeyGroup();

    /**
     * 뎁스2
     */
    String getTslKeyOne();

    /**
     * 뎁스2
     */
    String getTslKeyTwo();

    /**
     * 뎁스3
     */
    String getTslKeyThree();

    /**
     * 뎁스4
     */
    String getTslKeyFour();

    /**
     * 라오스어
     */
    String getTslValueLa();

    /**
     * 캄보디아어
     */
    String getTslValueKh();

    /**
     * 영어
     */
    String getTslValueEn();

    /**
     * 한국어
     */
    String getTslValueKo();

    /**
     * 변경일
     */
    LocalDateTime getTslUpdateDtm();

    /**
     * 빌드이후 경과시간(분)
     */
    String getMinutediff();

    /**
     * 빌드이후 경과시간(초)
     */
    String getSeconddiff();

}
