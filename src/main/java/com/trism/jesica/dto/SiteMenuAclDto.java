package com.trism.jesica.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SiteMenuAclDto implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long menuNo;
    private String menuName;
    private String menuUrl;
    private String menuIcon;
    private Integer permission;
    private Integer downloadAble;
    private Long staffNo;
    private Integer menuLevel;
    private Integer menuGroup;
    private Integer visibleLevel;
}
