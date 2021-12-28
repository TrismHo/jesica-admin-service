package com.trism.jesica.persistence.Entitiy.business;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.trism.jesica.persistence.core.entity.BaseEntity;
import com.trism.jesica.persistence.type.DataStatus;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.List;

/**
 * 브랜드
 */
@Entity
@Table(name = "tb_brand")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {"heads"})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbBrand extends BaseEntity {

    /**
     * 브랜드 번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "brand_no")
    private Long brandNo;

    /**
     * 입력 사용자 고유 ID
     */
    @Column(name = "insert_user_id", length = 20)
    private String insertUserId;

    /**
     * 수정 사용자 고유 ID
     */
    @Column(name = "update_user_id", length = 20)
    private String updateUserId;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    @Column(name = "data_status")
    private DataStatus dataStatus;

    /**
     * 브랜드 이름
     */
    @Column(name = "brand_name", length = 40)
    private String brandName;

    /**
     * 메모
     */
    @Column(name = "memo", length = 200)
    private String memo;

    @OneToMany(mappedBy = "brand", fetch = FetchType.LAZY)
    @JsonBackReference
    private List<TbHead> heads;

    @PrePersist
    public void defaultInit() {
        this.dataStatus = DataStatus.OK;
    }
}
