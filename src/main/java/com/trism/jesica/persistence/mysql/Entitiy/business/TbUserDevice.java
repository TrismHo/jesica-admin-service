package com.trism.jesica.persistence.mysql.Entitiy.business;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.mysql.core.entity.CreatedDateEntity;
import com.trism.jesica.persistence.mysql.type.DataStatus;
import com.trism.jesica.persistence.mysql.type.DeviceType;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * 사용자 디바이스
 */
@Entity
@Table(name = "tb_user_device")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbUserDevice extends CreatedDateEntity {

    /**
     * 디바이스 고유 ID
     */
    @Id
    @Column(name = "device_id")
    private String deviceId;

    /**
     * 사용자 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_no", referencedColumnName = "user_no", nullable = false)
    @JsonManagedReference
    private TbUser user;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    @Column(name = "data_status")
    @Enumerated(EnumType.ORDINAL)
    private DataStatus dataStatus;

    /**
     * 마지막 로그인 일시
     */
    @Column(name = "last_login_date")
    private LocalDateTime lastLoginDate;

    /**
     * 단말기_구분 (1: Android, 2: iOS)
     */
    @Column(name = "device_type")
    @Enumerated(EnumType.ORDINAL)
    private DeviceType deviceType;

    /**
     * 디바이스_OS_버전
     */
    @Column(name = "device_os_ver")
    private String deviceOsVer;

    /**
     * 디바이스_명칭
     */
    @Column(name = "device_name")
    private String deviceName;

    /**
     * APP_버전
     */
    @Column(name = "app_ver")
    private Integer appVer;

    /**
     * 로그인 키
     */
    @Column(name = "login_key")
    private String loginKey;

    /**
     * 푸시 키
     */
    @Column(name = "push_key")
    private String pushKey;


    /**
     * 앱_코드 (SYS_TYPE = AP)
     */
    @Column(name = "app_code")
    private String appCode;

    @PrePersist
    private void defaultInit() {
        this.dataStatus = DataStatus.OK;
        this.deviceType = DeviceType.ANDROID;
        this.appVer = 100;
        this.appCode = "AP";
    }


    @Builder
    public TbUserDevice(String deviceId, TbUser user, DataStatus dataStatus, LocalDateTime lastLoginDate, DeviceType deviceType, String deviceOsVer, String deviceName, Integer appVer, String loginKey, String pushKey, String appCode) {
        this.deviceId = deviceId;
        this.user = user;
        this.dataStatus = dataStatus;
        this.lastLoginDate = lastLoginDate;
        this.deviceType = deviceType;
        this.deviceOsVer = deviceOsVer;
        this.deviceName = deviceName;
        this.appVer = appVer;
        this.loginKey = loginKey;
        this.pushKey = pushKey;
        this.appCode = appCode;
    }
}
