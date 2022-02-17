package com.trism.jesica.dto;

import com.trism.jesica.persistence.Entitiy.board.TbAppBanner;
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

    public TbAppBanner insertData() {

        return TbAppBanner.builder()
                .insertUserId(insertUserId)
                .serviceType(serviceType)
                .viewYn(viewYn)
                .boardType(boardType)
                .viewOrder(viewOrder)
                .boardNo(boardNo)
                .bannerFile(bannerFile)
                .dataStatus(dataStatus)
                .build();
    }

    public TbAppBanner updateData() {

        return TbAppBanner.builder()
                .bannerNo(bannerNo)
                .insertUserId(insertUserId)
                .serviceType(serviceType)
                .viewYn(viewYn)
                .boardType(boardType)
                .viewOrder(viewOrder)
                .boardNo(boardNo)
                .bannerFile(bannerFile)
                .dataStatus(dataStatus)
                .build();
    }
}
