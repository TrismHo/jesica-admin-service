package com.trism.jesica.dto;


import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
public class TbSiteMenuDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 메뉴_번호
     */
    private Integer menuNo;


    /**
     * 등록_일시
     */
    private LocalDateTime insertDate;


    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    private Integer dataStatus;


    /**
     * 메뉴_URL
     */
    private String menuUrl;


    /**
     * 메뉴_명
     */
    private String menuName;

}
