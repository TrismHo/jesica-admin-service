package com.trism.jesica.persistence.mysql.core.entity;

import lombok.Getter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;
import java.time.LocalDateTime;

@MappedSuperclass
@Getter
@EntityListeners(AuditingEntityListener.class)
public abstract class CreatedDateEntity {
    /**
     * 등록일
     */
    @Column(name = "insert_date", updatable = false, nullable = false)
    @CreatedDate
    private LocalDateTime insertDate;
}
