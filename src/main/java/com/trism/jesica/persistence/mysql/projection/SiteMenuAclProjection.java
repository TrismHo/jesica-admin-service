package com.trism.jesica.persistence.mysql.projection;

public interface SiteMenuAclProjection {
    Long getMenuNo();
    String getMenuName();
    String getMenuUrl();
    String getMenuIcon();
    Integer getPermission();
    Integer getDownloadAble();
    Long getStaffNo();
    Integer getMenuLevel();
    Integer getMenuGroup();
    Integer getVisibleLevel();
}
