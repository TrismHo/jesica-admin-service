package com.trism.jesica.persistence.Entitiy.goods;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.Entitiy.business.TbStore;
import com.trism.jesica.persistence.core.entity.BaseEntity;
import com.trism.jesica.persistence.type.DataStatus;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.List;

/**
 * 가맹점 상품 옵션
 */
@Entity
@Table(name = "tb_store_option")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbStoreOption extends BaseEntity {
    /**
     * 가맹점 옵션 일련번호
     */
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "store_opt_no")
    private Long storeOptNo;

    @Column(name = "store_no")
    private Integer storeNo;

    /**
     * 가맹점(FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_no", insertable = false, updatable = false, referencedColumnName = "store_no")
    @JsonManagedReference
    private TbStore store;

    /**
     * 입력사용자 고유 ID
     */
    @Column(name = "insert_user_id")
    private String insertUserId;
    /**
     * 수정 사용자 고유 ID
     */
    @Column(name = "update_user_id")
    private String updateUserId;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    @Column(name = "data_status")
    private DataStatus dataStatus;

    /**
     * 옵션 명칭
     */
    @Column(name = "opt_name")
    private String optName;

    /**
     * 필수옵션_여부 (0: 옵션, 1: 필수)
     */
    @Column(name = "mandatory_yn")
    private Boolean mandatoryYn;

    /**
     * 최대_선택가능_개수
     */
    @Column(name = "min_select_cnt")
    private Integer minSelectCnt;

    /**
     * 최소_필수선택_개수
     */
    @Column(name = "max_select_cnt")
    private Integer maxSelectCnt;

    /**
     * 가맹점 상품옵션 항목(FK)
     */
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "storeOption")
    @JsonBackReference
    private List<TbStoreOptionItem> storeOptions;

    @Builder
    public TbStoreOption(Long storeOptNo, Integer storeNo, String insertUserId, String updateUserId, DataStatus dataStatus, String optName, Boolean mandatoryYn, Integer minSelectCnt, Integer maxSelectCnt ) {
        this.storeOptNo = storeOptNo;
        this.storeNo = storeNo;
        this.insertUserId = insertUserId;
        this.updateUserId = updateUserId;
        this.dataStatus = dataStatus;
        this.optName = optName;
        this.mandatoryYn = mandatoryYn;
        this.minSelectCnt = minSelectCnt;
        this.maxSelectCnt = maxSelectCnt;
    }
}
