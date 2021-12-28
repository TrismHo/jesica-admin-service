package com.trism.jesica.persistence.Entitiy.system;

import com.trism.jesica.persistence.core.entity.BaseEntity;
import com.trism.jesica.persistence.id.TbSystemCodeID;
import com.trism.jesica.persistence.type.DataStatus;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 시스템 코드
 */
@Entity
@Table(name = "tb_system_code")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
@IdClass(TbSystemCodeID.class)
public class TbSystemCode extends BaseEntity {

    /**
     * 분류 구분
     */
    @Id
    @Column(name = "sys_type", nullable = false, length = 4)
    private String sysType;

    /**
     * 분류 코드
     */
    @Id
    @Column(name = "sys_code", nullable = false, length = 4)
    private String sysCode;

    /**
     * 분류 명
     */
    @Column(name = "sys_name", length = 100)
    private String sysName;

    /**
     * 코드 이름
     */
    @Column(name = "code_name", length = 100)
    private String codeName;

    /**
     * 코드 상세 값
     */
    @Column(name = "code_value", length = 20)
    private String codeValue;

    /**
     * 출력 순서
     */
    @Column(name = "view_order")
    private Integer viewOrder;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    @Column(name = "data_status")
    private DataStatus dataStatus;

    /**
     * 메모
     */
    @Column(name = "memo")
    private String memo;

    @PrePersist
    public void defaultInit() {
        this.dataStatus = DataStatus.OK;
        this.viewOrder = 0;
    }
}
