package com.trism.jesica.persistence.mysql.Entitiy.business;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.mysql.mappedsuper.BaseBusinessInfoEntity;
import com.trism.jesica.persistence.mysql.type.AuthStatus;
import com.trism.jesica.persistence.mysql.type.CorpType;
import com.trism.jesica.persistence.mysql.type.GroupType;
import lombok.*;
import lombok.experimental.Accessors;
import org.apache.commons.lang3.ObjectUtils;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * 제휴본사 사업자 번호
 */
@Entity
@Table(name = "tb_business_info")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@Getter
@AllArgsConstructor
@ToString(callSuper = true, exclude = {"head"})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbHeadBusinessInfo extends BaseBusinessInfoEntity {

    @MapsId
    @OneToOne(optional = false, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH})
    @JoinColumn(name = "group_no", referencedColumnName = "head_no")
    @JsonManagedReference
    private TbHead head;

    public void setHead(TbHead head) {
        if (ObjectUtils.isNotEmpty(head)) {
            this.head = head;
            setGroupNo(this.head.getHeadNo());
        }
    }

    @Builder
    public TbHeadBusinessInfo(Long groupNo, String insertUserId, LocalDateTime updateDate, String updateUserId, GroupType groupType, CorpType corpType, AuthStatus authStatus, LocalDateTime authDate, String bizNum, String bizName, String bizOwner, String bizType, String bizItem, String bizAddr, String bizTel, String bizEmail, TbHead head) {
        super(groupNo, insertUserId, updateDate, updateUserId, groupType, corpType, authStatus, authDate, bizNum, bizName, bizOwner, bizType, bizItem, bizAddr, bizTel, bizEmail);
        setHead(head);
    }
}
