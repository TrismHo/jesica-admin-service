package com.trism.jesica.persistence.Entitiy.system;

import com.trism.jesica.persistence.id.TbSiteAclID;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tb_site_acl")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Getter
@ToString(callSuper = true, exclude = {})
@DynamicInsert
@DynamicUpdate
@IdClass(TbSiteAclID.class)
public class TbSiteAcl implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 사용자_번호
     */
    @Id
    @Column(name = "staff_no", nullable = false)
    private Long staffNo;

    /**
     * 메뉴_번호
     */
    @Column(name = "menu_no", nullable = false)
    private Long menuNo;

    /**
     * 권한 (0: Deny, 1:Allow)
     */
    @Column(name = "permission", nullable = false)
    private Integer permission = 0;


}
