package com.trism.jesica.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class TbAppBannerListData {
    private Long bannerNo;

    // 번호는 프론트에서 meta로 처리 추천, 그래도 필요하면 내려도 됨(옵션)
    // private Integer listIndex;

    private String appCode;
    private String appName;          // ✅ 표시용

    private String bannerFile;

    private Integer platformType;
    private String langCode;
    private Integer serviceType;
    private Integer boardType;
    private Integer bannerType;
    private LocalDateTime insertDate;
    private Integer viewYn;
    private Integer viewOrder;

    // JSP에서 { data: "service.serviceName" } 쓰고 있으니,
    // DTO에서는 serviceName으로 바꾸고 프론트도 같이 바꾸는게 가장 깔끔.
    private String serviceName;      // ✅ 표시용
    private String addr1Code;
    private String addr1Name;
    private String addr2Code;
    private String addr2Name;
    private String title;            // ✅ 모달에서 쓰면 좋음(없으면 null)
}
