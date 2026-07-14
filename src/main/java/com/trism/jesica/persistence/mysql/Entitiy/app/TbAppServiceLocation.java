package com.trism.jesica.persistence.mysql.Entitiy.app;

import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * 서비스 위치 관리
 */
@Entity
@Table(name = "tb_app_service_location")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
@Getter
@Setter
@ToString
@Accessors(chain = true)
@DynamicInsert
@DynamicUpdate
public class TbAppServiceLocation {

    private static final long serialVersionUID = 1L;

    /**
     * 위치 번호 (PK)
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "location_no")
    private Integer locationNo;

    /**
     * 서비스 번호 (FK)
     */
    @Column(name = "service_no", nullable = false)
    private Integer serviceNo;

    /**
     * 주소1 (시/도 코드 SYS_TYPE=A1)
     */
    @Column(name = "addr_1", length = 2)
    private String addr1;

    /**
     * 주소2 (구/군 코드 SYS_TYPE=A2)
     */
    @Column(name = "addr_2", length = 5)
    private String addr2;

    /**
     * 등록 일시
     */
    @Column(name = "insert_date")
    private LocalDateTime insertDate;

    /**
     * insert용 builder 복사
     */
    public TbAppServiceLocation insertData() {
        return TbAppServiceLocation.builder()
                .serviceNo(this.serviceNo)
                .addr1(this.addr1)
                .addr2(this.addr2)
                .build();
    }
}
