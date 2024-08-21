package com.trism.jesica.persistence.mysql.Entitiy.cust;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbStore;
import com.trism.jesica.persistence.mysql.core.entity.CreatedDateEntity;
import com.trism.jesica.persistence.mysql.id.TbCustFavoriteID;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 고객 단골매장
 */
@Entity
@Table(name = "tb_cust_favorite")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
@IdClass(TbCustFavoriteID.class)
public class TbCustFavorite extends CreatedDateEntity {

    /**
     * 고객 (FK)
     */
    @Id
    @ManyToOne
    @JoinColumn(name = "cust_no", referencedColumnName = "cust_no")
    @JsonManagedReference
    private TbCust cust;

    /**
     * 가맹점 (FK)
     */
    @Id
    @ManyToOne
    @JoinColumn(name = "store_no", referencedColumnName = "store_no")
    @JsonManagedReference
    private TbStore store;

}
