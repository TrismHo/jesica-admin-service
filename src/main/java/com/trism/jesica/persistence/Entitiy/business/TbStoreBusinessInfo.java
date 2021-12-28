package com.trism.jesica.persistence.Entitiy.business;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.mappedsuper.BaseBusinessInfoEntity;
import com.trism.jesica.persistence.type.AuthStatus;
import com.trism.jesica.persistence.type.CorpType;
import com.trism.jesica.persistence.type.GroupType;
import lombok.*;
import lombok.experimental.Accessors;
import org.apache.commons.lang3.ObjectUtils;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * 가맹점 사업자 번호
 */
@Entity
@Table(name = "tb_business_info")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@Getter
//@AllArgsConstructor
//@Builder
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbStoreBusinessInfo extends BaseBusinessInfoEntity {

    @MapsId
    @OneToOne(optional = false, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH})
    @JoinColumn(name = "group_no", referencedColumnName = "store_no")
    @JsonManagedReference
    private TbStore store;

    public void setStore(TbStore store) {
        if (ObjectUtils.isNotEmpty(store)) {
            this.store = store;
            setGroupNo(this.store.getStoreNo());
        }
    }
    @Builder
    public TbStoreBusinessInfo(Long groupNo, String insertUserId, LocalDateTime updateDate, String updateUserId, GroupType groupType, CorpType corpType, AuthStatus authStatus, LocalDateTime authDate, String bizNum, String bizName, String bizOwner, String bizType, String bizItem, String bizAddr, String bizTel, String bizEmail, TbStore store) {
        super(groupNo, insertUserId, updateDate, updateUserId, groupType, corpType, authStatus, authDate, bizNum, bizName, bizOwner, bizType, bizItem, bizAddr, bizTel, bizEmail);
        this.store = store;
        setStore(store);
    }

}
