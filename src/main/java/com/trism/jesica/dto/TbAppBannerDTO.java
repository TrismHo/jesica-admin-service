package com.trism.jesica.dto;

import java.time.LocalDateTime;

public interface TbAppBannerDTO {

    Long getBannerNo();

    Integer getViewOrder();

    String getBannerFile();

    String getTitle();

    String getBoardType();

    LocalDateTime getInsertDate();
}
