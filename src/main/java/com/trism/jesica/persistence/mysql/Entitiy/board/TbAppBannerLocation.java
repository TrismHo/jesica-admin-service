package com.trism.jesica.persistence.mysql.Entitiy.board;

import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "tb_app_banner_location")
@Accessors(chain = true)
@ToString(callSuper = true, exclude = {})
@DynamicInsert
@DynamicUpdate
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class TbAppBannerLocation {

    private static final long serialVersionUID = 1L;

    /**
     * 주소_SEQ
     */
    @Id
    @Column(name = "bnr_loc_no", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long bnrLocNo;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상)
     */
    @Column(name = "bannerNo", nullable = false)
    private Long bannerNo;


    /**
     * 주소1 (시/도)
     */
    @Column(name = "addr_1")
    private String addr1;


    /**
     * 주소2 (시/군/구)
     */
    @Column(name = "addr_2")
    private String addr2;

    /**
     * 등록일
     */
    @Column(name = "insert_date", updatable = false, nullable = false)
    @CreatedDate
    private LocalDateTime insertDate;


    /**
     * 수정일
     */
    @Column(name = "update_date", updatable = false, nullable = false)
    @CreatedDate
    private LocalDateTime updateDate;

}
