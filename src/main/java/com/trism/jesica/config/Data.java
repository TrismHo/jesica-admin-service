package com.trism.jesica.config;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Data {
    /**
     * Push 알림 종류 :
     * 0(기타), 1(공지), 2(이벤트), 3(기사심사결과), 4(주문)
     */
    private String type;

    /**
     * 알림 type별 속성 값 :
     * [if type=1] 공지 번호
     * [if type=2] 이벤트 번호
     * [if type=3] 2(승인), 3(반려)
     * [if type=4] 10(접수), 20(요청), 32(배차), 33(출발), 40(완료), 41(취소)
     */
    private String value;

    /**
     * 주문번호(type=4인 경우만 세팅)
     */
    private String orderNo;

    /**
     * 주문종류(type=4인 경우만 세팅) :
     * 20(인수대행), 21(반납대행), 22(마이카탁송), 23(올레길탁송)
     */
    private String orderType;
}