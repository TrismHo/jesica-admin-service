package com.trism.jesica.dto;


import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
public class TbWorkerCashLogDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 로그_번호
     */
    private Long logNo;


    /**
     * 배송원_번호
     */
    private Integer workerNo;


    /**
     * 입력_일시
     */
    private LocalDateTime insertDate;


    /**
     * 입력_사용자ID
     */
    private String insertUserId;


    /**
     * 총판_번호
     */
    private Integer branchNo;


    /**
     * 소속가맹_번호
     */
    private Integer storeNo;


    /**
     * 입출금코드 (SYS_TYPE=CC)
     */
    private String cashInoutCode;


    /**
     * 입출금액
     */
    private Integer cash;


    /**
     * 잔액
     */
    private Integer balance;


    /**
     * 이체_업무그룹 (1: 제휴본사, 2: 총판, 3: 가맹점, 4: 배송원, 5: 고객)
     */
    private Integer tranGroupType;


    /**
     * 이체_그룹번호
     */
    private Integer tranGroupNo;


    /**
     * 이체_그룹명
     */
    private String tranGroupName;


    /**
     * 참조정보(주문번호/입출금번호)
     */
    private String referInfo;


    /**
     * 메모
     */
    private String memo;

}
