package com.trism.jesica.dto;

import lombok.Data;


@Data
public class TokenData {

    private String userId;
    private String password;
    private String tokenId;
    private String loginType;
    private String role;
    private String deviceType;
    private String deviceName;
    private String deviceId;

}
