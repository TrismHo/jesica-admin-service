package com.trism.jesica.dto;

import java.io.Serializable;

public class SiteMenuAclSessionDto implements Serializable {

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

    public SiteMenuAclSessionDto() {
    }

    public SiteMenuAclSessionDto(
            Long menuNo,
            String menuName,
            String menuUrl,
            String menuIcon,
            Integer permission,
            Integer downloadAble,
            Long staffNo,
            Integer menuLevel,
            Integer menuGroup,
            Integer visibleLevel
    ) {
        this.menuNo = menuNo;
        this.menuName = menuName;
        this.menuUrl = menuUrl;
        this.menuIcon = menuIcon;
        this.permission = permission;
        this.downloadAble = downloadAble;
        this.staffNo = staffNo;
        this.menuLevel = menuLevel;
        this.menuGroup = menuGroup;
        this.visibleLevel = visibleLevel;
    }

    public Long getMenuNo() {
        return menuNo;
    }

    public void setMenuNo(Long menuNo) {
        this.menuNo = menuNo;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getMenuUrl() {
        return menuUrl;
    }

    public void setMenuUrl(String menuUrl) {
        this.menuUrl = menuUrl;
    }

    public String getMenuIcon() {
        return menuIcon;
    }

    public void setMenuIcon(String menuIcon) {
        this.menuIcon = menuIcon;
    }

    public Integer getPermission() {
        return permission;
    }

    public void setPermission(Integer permission) {
        this.permission = permission;
    }

    public Integer getDownloadAble() {
        return downloadAble;
    }

    public void setDownloadAble(Integer downloadAble) {
        this.downloadAble = downloadAble;
    }

    public Long getStaffNo() {
        return staffNo;
    }

    public void setStaffNo(Long staffNo) {
        this.staffNo = staffNo;
    }

    public Integer getMenuLevel() {
        return menuLevel;
    }

    public void setMenuLevel(Integer menuLevel) {
        this.menuLevel = menuLevel;
    }

    public Integer getMenuGroup() {
        return menuGroup;
    }

    public void setMenuGroup(Integer menuGroup) {
        this.menuGroup = menuGroup;
    }

    public Integer getVisibleLevel() {
        return visibleLevel;
    }

    public void setVisibleLevel(Integer visibleLevel) {
        this.visibleLevel = visibleLevel;
    }
}
