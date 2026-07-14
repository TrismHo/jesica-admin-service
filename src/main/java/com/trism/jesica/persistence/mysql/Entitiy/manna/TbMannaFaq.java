package com.trism.jesica.persistence.mysql.Entitiy.manna;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "manna_faq")
@Data
public class TbMannaFaq {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "faq_no", nullable = false)
    private Long faqNo;

    /**
     * FAQ 카테고리
     */
    @Column(name = "faq_category_no")
    private Long faqCategoryNo;

    /**
     * 질문
     */
    @Column(name = "faq_q", nullable = false, length = 500)
    private String faqQ;

    /**
     * 답변
     */
    @Lob
    @Column(name = "faq_a", nullable = false, columnDefinition = "TEXT")
    private String faqA;

    /**
     * 노출 순서
     */
    @Column(name = "display_order", nullable = false)
    private Integer displayOrder = 0;

    /**
     * 노출 여부
     */
    @Column(name = "use_yn", nullable = false, length = 1)
    private String useYn = "Y";

    /**
     * 0: 삭제, 1: 정상
     */
    @Column(name = "data_status", nullable = false)
    private Integer dataStatus = 1;

    /**
     * 등록자
     */
    @Column(name = "insert_id", length = 50)
    private String insertId;

    /**
     * 등록일시
     */
    @Column(name = "insert_date", nullable = false)
    private LocalDateTime insertDate;

    /**
     * 수정자
     */
    @Column(name = "update_id", length = 50)
    private String updateId;

    /**
     * 수정일시
     */
    @Column(name = "update_date")
    private LocalDateTime updateDate;

    @PrePersist
    public void prePersist() {
        if (displayOrder == null) {
            displayOrder = 0;
        }

        if (useYn == null) {
            useYn = "Y";
        }

        if (dataStatus == null) {
            dataStatus = 1;
        }

        if (insertDate == null) {
            insertDate = LocalDateTime.now();
        }
    }

    @PreUpdate
    public void preUpdate() {
        updateDate = LocalDateTime.now();
    }
}
