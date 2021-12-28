package com.trism.jesica.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
public class LoginDTO {

    private String serviceStatus;

    private String code;

    private String desc;

    private LoginVo data;

    @Getter
    @Setter
    @ToString
    @AllArgsConstructor
    @NoArgsConstructor
    @EqualsAndHashCode
    public static abstract class BaseLoginVo {
        private Long userNo;

        private String name;

        private Boolean pushOrderYn;

        private Boolean pushNoticeYn;

        private Boolean pushMarketingYn;

        private TokenVo token;

    }

    @Getter
    @Setter
    @ToString(callSuper = true)
    @NoArgsConstructor
    @EqualsAndHashCode(callSuper = true)
    @JsonInclude(JsonInclude.Include.NON_NULL)
    public static class LoginVo extends BaseLoginVo {
        private Boolean smsYn;

        private Long headNo;

        private Long branchNo;

        private Long storeNo;


        @Builder(builderClassName = "CustBuilder", builderMethodName = "custBuilder")
        public LoginVo(Long userNo, String name, Boolean pushOrderYn, Boolean pushNoticeYn, Boolean pushMarketingYn, TokenVo token, Boolean smsYn) {
            super(userNo, name, pushOrderYn, pushNoticeYn, pushMarketingYn, token);
            this.smsYn = smsYn;
        }
        @Builder(builderClassName = "UserBilder", builderMethodName = "userBuilder")
        public LoginVo(Long userNo, String name, Boolean pushOrderYn, Boolean pushNoticeYn, Boolean pushMarketingYn, TokenVo token, Long headNo, Long branchNo, Long storeNo) {
            super(userNo, name, pushOrderYn, pushNoticeYn, pushMarketingYn, token);
            this.headNo = headNo;
            this.branchNo = branchNo;
            this.storeNo = storeNo;
        }
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @EqualsAndHashCode
    @ToString
    @Builder
    @JsonInclude(JsonInclude.Include.NON_NULL)
    public static class TokenVo {

        private String tokenType;

        private String accessToken;

        private long expiresIn;

        private String refreshToken;

        private Long refreshTokenExpiresIn;

        private String role;
    }

}
