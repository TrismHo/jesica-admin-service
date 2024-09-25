package com.trism.jesica.persistence.mysql.Entitiy.app;

import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 배송_블록설정
 */

@Entity
@Table(name = "tb_app_version")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@Setter
@ToString(callSuper = true, exclude = {})
@DynamicInsert
@DynamicUpdate
public class TbAppVersion {
    private static final long serialVersionUID = 1L;

    /**
     * 앱코드(Sys_type =AC)
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "app_code", nullable = false)
    private String appCode;

    /**
     * 사용 OS
     */
    @Column(name = "device_type")
    private Integer deviceType;

    /**
     * 앱_코드 관련 지역(ex 구로)
     */
    @Column(name = "code_memo")
    private String codeMemo;

    /**
     * 배포버전
     */
    @Column(name = "release_ver")
    private String releaseVer = null;

    /**
     * 최소 요구 버전
     */
    @Column(name = "update_ver")
    private String updateVer = null;

    public TbAppVersion insertData() {
        return TbAppVersion.builder()
                .appCode(this.appCode)
                .deviceType(this.deviceType)
                .codeMemo(this.codeMemo)
                .releaseVer(this.releaseVer)
                .updateVer(this.updateVer)
                .build();
    }

}
