package com.trism.jesica.dto;

import com.trism.jesica.persistence.mysql.Entitiy.board.TbAppBanner;
import lombok.Data;

@Data
public class TbAppBannerData {

    private Long bannerNo;
    private String insertUserId;
    private Integer serviceType;
    private Integer viewYn;
    private Integer boardType;
    private Integer viewOrder;
    private Long boardNo;
    private String bannerFile;
    private Integer dataStatus;

    private Integer platformType;

    private Integer bannerType;
    private String langCode;
    private String appCode;
    private String schemeUrl;

    public TbAppBanner insertData() {

        return TbAppBanner.builder()
                .insertUserId(insertUserId)
                .platformType(platformType)
                .serviceType(serviceType)
                .viewYn(viewYn)
                .viewOrder(viewOrder)
                .boardType(boardType)
                .boardNo(boardNo)
                .bannerFile(bannerFile)
                .dataStatus(dataStatus)
                .bannerType(bannerType)
                .langCode(langCode)
                .schemeUrl(schemeUrl)
                .appCode(appCode)
                .build();
    }

    public TbAppBanner updateData() {

        return TbAppBanner.builder()
                .bannerNo(bannerNo)
                .platformType(platformType)
                .serviceType(serviceType)
                .viewYn(viewYn)
                .boardType(boardType)
                .viewOrder(viewOrder)
                .boardNo(boardNo)
                .bannerFile(bannerFile)
                .dataStatus(dataStatus)
                .bannerType(bannerType)
                .langCode(langCode)
                .schemeUrl(schemeUrl)
                .appCode(appCode)
                .build();
    }
}
