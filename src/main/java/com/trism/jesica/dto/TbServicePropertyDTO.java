package com.trism.jesica.dto;


import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
public class TbServicePropertyDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 장소_번호
     */
    private String propName;


    /**
     * 설정_값
     */
    private String propValue;


    /**
     * 데이터_상태 (0: 삭제, 1: 정상)
     */
    private Integer dataStatus;


    /**
     * 등록_일시
     */
    private LocalDateTime insertDate;


    /**
     * 수정_일시
     */
    private LocalDateTime updateDate;


    /**
     * 메모
     */
    private String memo;

}
