package com.trism.jesica.persistence.Entitiy.business;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbBrand is a Querydsl query type for TbBrand
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbBrand extends EntityPathBase<TbBrand> {

    private static final long serialVersionUID = 223069995L;

    public static final QTbBrand tbBrand = new QTbBrand("tbBrand");

    public final com.trism.jesica.persistence.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.core.entity.QBaseEntity(this);

    public final StringPath brandName = createString("brandName");

    public final NumberPath<Long> brandNo = createNumber("brandNo", Long.class);

    public final EnumPath<com.trism.jesica.persistence.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.type.DataStatus.class);

    public final ListPath<TbHead, QTbHead> heads = this.<TbHead, QTbHead>createList("heads", TbHead.class, QTbHead.class, PathInits.DIRECT2);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath insertUserId = createString("insertUserId");

    public final StringPath memo = createString("memo");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    public final StringPath updateUserId = createString("updateUserId");

    public QTbBrand(String variable) {
        super(TbBrand.class, forVariable(variable));
    }

    public QTbBrand(Path<? extends TbBrand> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbBrand(PathMetadata metadata) {
        super(TbBrand.class, metadata);
    }

}

