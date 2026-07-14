package com.trism.jesicar.message;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.Serializable;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class PushMessage implements Serializable {
    private static final long serialVersionUID = 1L;
    private String appcode;  //js(jesicar-user), jsdr(jesicar-driver)
    private String os;   //i(iOS), a(Android)
    private String receiver; //push token
    private String title;
    private String contents;
    private long timestamp;  //current timestamp
    private Data data;   //user defined data

    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    @lombok.Data
    public static class Data implements Serializable {
        private static final long serialVersionUID = 1L;
        /**
         * Push 알림 종류 :
         *  0(기타), 1(공지), 2(이벤트), 3(기사심사결과), 4(주문), 5(쿠폰)
         */
        private String type;

        /**
         * 알림 type별 속성 값 :
         *  [if type=1] 공지 번호
         *  [if type=2] 이벤트 번호
         *  [if type=3] 2(승인), 3(반려)
         *  [if type=4] 10(접수), 20(요청), 32(배차), 33(출발), 40(완료), 41(취소)
         */
        private String value;

        /**
         * 주문번호(type=4인 경우만 세팅)
         */
        private String orderNo;

        /**
         * 주문종류(type=4인 경우만 세팅) :
         *  20(인수대행), 21(반납대행), 22(마이카탁송), 23(올레길탁송)
         */
        private String orderType;

        /**
         * 이벤트 정보
         */
        private Event event;


        /**
         * 쿠폰 정보
         */
        private Coupon coupon;
    }

    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    @lombok.Data
    public static class Event implements Serializable {
        private static final long serialVersionUID = 1L;

        private String stCode;  //매장코드
        private String stName;  //매장명
        private String ordType;  //주문구분(1:배달, 2:포장)
        private String dvryType; //배달구분(1:0원배달, 2:0순위배달)
        private String startDate; //이벤트 시작일(yyyymmdd)
        private String endDate;  //이벤트 종료일(yyyymmdd)
        private String title;  //이벤트 제목
        private String disType;  //할인구분(1:정액, 2:정률)
        private String disAmt;  //할인금액
    }


    //쿠폰용 추가 2026.06.29
    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    @lombok.Data
    public static class Coupon implements Serializable {
        private static final long serialVersionUID = 1L;

        private String cpnTitle;  //매장코드
        private String readyDate;  //매장명
        private String expireDate;  //주문구분(1:배달, 2:포장)
        private String disAmt; //배달구분(1:0원배달, 2:0순위배달)
        private String disType; //이벤트 시작일(yyyymmdd)
        private String useLimit;  //이벤트 종료일(yyyymmdd)
    }
}
