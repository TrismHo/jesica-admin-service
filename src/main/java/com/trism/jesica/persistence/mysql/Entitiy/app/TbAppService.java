package com.trism.jesica.persistence.mysql.Entitiy.app;

import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * 서비스 관리
 */
@Entity
@Table(name = "tb_app_service")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
@Getter
@Setter
@ToString
@Accessors(chain = true)
@DynamicInsert
@DynamicUpdate
public class TbAppService {

    private static final long serialVersionUID = 1L;

    /**
     * 서비스 번호 (PK)
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "service_no")
    private Integer serviceNo;

    /**
     * 서비스 명칭
     */
    @Column(name = "service_name", nullable = false, length = 100)
    private String serviceName;

    /**
     * 데이터 상태 (0: 삭제, 1: 정상)
     */
    @Column(name = "data_status", nullable = false)
    private Integer dataStatus = 1;

    /**
     * 등록 일시
     */
    @Column(name = "insert_date")
    private LocalDateTime insertDate;

    /**
     * 브랜드 코드
     */
    @Column(name = "brand_type_cd", length = 10)
    private String brandTypeCd;

    /**
     * 고객센터 번호
     */
    @Column(name = "cs_tel", length = 40)
    private String csTel;

    /**
     * 카카오 채널 URL
     */
    @Column(name = "kakao_url", length = 100)
    private String kakaoUrl;

    /**
     * bi 이미지 경로
     */
    @Column(name = "service_bi", length = 100)
    private String serviceBi;

    /**
     * insert용 빌더 복사 메서드
     */
    public TbAppService insertData() {
        return TbAppService.builder()
                .serviceName(this.serviceName)
                .dataStatus(this.dataStatus)
                .brandTypeCd(this.brandTypeCd)
                .csTel(this.csTel)
                .kakaoUrl(this.kakaoUrl)
                .serviceBi(this.serviceBi)
                .build();
    }
}
