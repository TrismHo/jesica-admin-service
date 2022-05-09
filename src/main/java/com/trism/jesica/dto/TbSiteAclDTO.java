package com.trism.jesica.dto;


import lombok.Data;

import java.io.Serializable;

@Data
public class TbSiteAclDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 사용자_번호
     */
    private Integer staffNo;


    /**
     * 메뉴_번호
     */
    private Integer menuNo;


    /**
     * 권한 (0: Deny, 1:Allow)
     */
    private Integer permission;

}
