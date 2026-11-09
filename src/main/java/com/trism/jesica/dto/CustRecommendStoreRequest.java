package com.trism.jesica.dto;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class CustRecommendStoreRequest {

    private Integer custNo;
    private String custTel;

    private String stCode;
    private String ordType = "1";
}

