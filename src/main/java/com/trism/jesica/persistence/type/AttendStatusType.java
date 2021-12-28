package com.trism.jesica.persistence.type;

/**
 * 출근_상태 (0: 퇴근, 1: 출근, 2: 휴식, 3: 운행중)
 */
public enum AttendStatusType {
    OFF_WORK("퇴근"),
    GO_TO_WORK("출근"),
    REST("휴식"),
    RUNNING("운행중");

    private final String str;

    private AttendStatusType(String str) {
        this.str = str;
    }

    public String str() {
        return str;
    }
}
