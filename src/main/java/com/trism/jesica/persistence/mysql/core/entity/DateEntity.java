package com.trism.jesica.persistence.mysql.core.entity;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;
import java.time.LocalDateTime;

@MappedSuperclass
@Getter
@EntityListeners(AuditingEntityListener.class)
@EqualsAndHashCode(callSuper = true)
public abstract class DateEntity extends CreatedDateEntity {

    /**
     * 수정일
     */
    @Column(name = "update_date", insertable = false)
    @LastModifiedDate
    private LocalDateTime updateDate;
}
