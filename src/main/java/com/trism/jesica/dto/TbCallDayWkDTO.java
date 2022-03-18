package com.trism.jesica.dto;


import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
public class TbCallDayWkDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 배차_일련번호
     */
    private Long callWkNo;


    /**
     * 주문_일련번호
     */
    private Long orderNo;


    /**
     * 릴레이_단계(1 or 2)
     */
    private Integer relayStep;


    /**
     * 기사_번호
     */
    private Integer workerNo;


    /**
     * 기사_이름
     */
    private String workerName;


    /**
     * 배달그룹_일련번호
     */
    private Integer dlvyNo;


    /**
     * 수주_제휴본사
     */
    private Integer headNo;


    /**
     * 수주_총판
     */
    private Integer branchNo;


    /**
     * 수주_가맹점
     */
    private Integer storeNo;


    /**
     * 주문_상태_코드 (SYS_TYPE = OS)
     */
    private String orderStatusCode;


    /**
     * 배차_일시
     */
    private LocalDateTime dlvyAccDate;


    /**
     * 출발_일시
     */
    private LocalDateTime pickupDate;


    /**
     * 완료_일시
     */
    private LocalDateTime finishDate;


    /**
     * 취소_일시
     */
    private LocalDateTime cancelDate;

}
