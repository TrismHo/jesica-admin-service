package com.trism.jesica.persistence.mysql.Entitiy.system;

import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 *
 */
@Entity
@Table(name = "tb_site_lang")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@EntityListeners(AuditingEntityListener.class)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(exclude = {})
@EqualsAndHashCode
@DynamicInsert
@DynamicUpdate
public class TbSiteLang {
    /**
     * 번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "tsl_id", nullable = false)
    private Long tslId;

    /**
     * 이름
     */
    @Column(name = "tsl_name", nullable = false, length = 40)
    private String tslName;

    /**
     * 캄보디아어
     */
    @Column(name = "tsl_value_kh")
    private String tslValueKh;

    /**
     * 영어
     */
    @Column(name = "tsl_value_en")
    private String tslValueEn;

    /**
     * 한국어
     */
    @Column(name = "tsl_value_ko")
    private String tslValueKo;

    /**
     * 1 depth
     */
    @Column(name = "tsl_key_group")
    private String tslKeyGroup;

    /**
     * 2 depth
     */
    @Column(name = "tsl_key_one")
    private String tslKeyOne;
    /**
     * 3 depth
     */
    @Column(name = "tsl_key_two")
    private String tslKeyTwo;

    /**
     * 4 depth
     */
    @Column(name = "tsl_key_three")
    private String tslKeyThree;

    /**
     * 5 depth
     */
    @Column(name = "tsl_key_four")
    private String tslKeyFour;
    /**
     * 언어명(주석용)
     */
    @Column(name = "tsl_comment")
    private String tslComment;

    /**
     * 사용여부 (1.사용, 0.미사용)
     */
    @Column(name = "tsl_active")
    private Boolean tslActive;

    /**
     * 언어타입 (1: 1뎁스, 2: 2뎁스, 3: 3뎁스, 4: 4뎁스, 5: 기타 )
     */
    @Column(name = "tsl_type")
    private Byte tslType;

    /**
     * 메모
     */
    @Column(name = "tsl_memo")
    private String tslMemo;

    /**
     * 메뉴타입 (1: 메인, 2: 서브, 3: 기타)
     */
    @Column(name = "tsl_menu_type")
    private Byte tslMenuType;

    /**
     * 등록일
     */
    @Column(name = "tsl_insert_dtm")
    @CreatedDate
    private LocalDateTime tslInsertDtm;

    /**
     * 수정일
     */
    @Column(name = "tsl_update_dtm")
    @LastModifiedDate
    private LocalDateTime tslUpdateDtm;

    @PrePersist
    private void defaultInit() {
        this.tslActive = true;
    }

}
