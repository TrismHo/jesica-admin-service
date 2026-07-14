package com.trism.jesica.persistence.mysql.Entitiy.manna;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "manna_faq_category")
@Data
public class TbMannaFaqCategory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "faq_category_no", nullable = false)
    private Long faqCategoryNo;

    @Column(name = "faq_category_name", nullable = false, length = 50)
    private String faqCategoryName;

    @Column(name = "use_yn", nullable = false, length = 1)
    private String useYn = "Y";

    @Column(name = "data_status", nullable = false)
    private Integer dataStatus = 1;

    @Column(name = "insert_id", length = 50)
    private String insertId;

    @Column(name = "insert_date", nullable = false)
    private LocalDateTime insertDate;

    @Column(name = "update_id", length = 50)
    private String updateId;

    @Column(name = "update_date")
    private LocalDateTime updateDate;

    @PrePersist
    public void prePersist() {

        if (useYn == null || useYn.trim().isEmpty()) {
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
