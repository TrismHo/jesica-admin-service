package com.trism.jesica.persistence.mysql.Entitiy.cust;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.mysql.core.entity.CreatedDateEntity;
import com.trism.jesica.persistence.mysql.id.TbCustDeviceID;
import com.trism.jesica.persistence.mysql.type.DataStatus;
import com.trism.jesica.persistence.mysql.type.DeviceType;
import com.trism.jesica.persistence.mysql.type.LoginType;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "tb_cust_device")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@Setter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
@IdClass(TbCustDeviceID.class)
public class TbCustDevice extends CreatedDateEntity {

    /**
     * 디바이스_고유ID
     */
    @Id
    @Column(name = "device_id")
    private String deviceId;

    /**
     * 고객_일련번호(FK)
     */
    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cust_no", referencedColumnName = "cust_no")
    @JsonManagedReference
    private TbCust cust;

    /**
     * 로그인_구분(0: 로그인안함, 1: 앱, 2: SNS1, 3: SNS2)
     */
    @Column(name = "login_type")
    @Enumerated(EnumType.ORDINAL)
    private LoginType loginType;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    @Column(name = "data_status")
    @Enumerated(EnumType.ORDINAL)
    private DataStatus dataStatus;

    /**
     * 마지막_로그인_일시
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
     * 디바이스 OS 버전
     */
    @Column(name = "device_os_ver")
    private String deviceOsVer;

    /**
     * 디바이스 명칭
     */
    @Column(name = "device_name")
    private String deviceName;

    /**
     * APP 버전
     */
    @Column(name = "app_ver")
    private Integer appVer;

    /**
     * APP 코드
     */
    @Column(name = "app_code")
    private String appCode;

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
}
