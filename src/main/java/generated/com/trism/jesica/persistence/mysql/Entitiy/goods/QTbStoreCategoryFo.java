package com.trism.jesica.persistence.mysql.Entitiy.goods;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbStoreCategoryFo is a Querydsl query type for TbStoreCategoryFo
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbStoreCategoryFo extends EntityPathBase<TbStoreCategoryFo> {

    private static final long serialVersionUID = -610114538L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbStoreCategoryFo tbStoreCategoryFo = new QTbStoreCategoryFo("tbStoreCategoryFo");

    public final com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity _super = new com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity(this);

    public final StringPath catCode = createString("catCode");

    public final EnumPath<com.trism.jesica.persistence.mysql.type.CatLevel> catLevel = createEnum("catLevel", com.trism.jesica.persistence.mysql.type.CatLevel.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath parentCatCode = createString("parentCatCode");

    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbStore store;

    public final NumberPath<Long> storeNo = createNumber("storeNo", Long.class);

    public final QTbSystemCategory systemCategory;

    public QTbStoreCategoryFo(String variable) {
        this(TbStoreCategoryFo.class, forVariable(variable), INITS);
    }

    public QTbStoreCategoryFo(Path<? extends TbStoreCategoryFo> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbStoreCategoryFo(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbStoreCategoryFo(PathMetadata metadata, PathInits inits) {
        this(TbStoreCategoryFo.class, metadata, inits);
    }

    public QTbStoreCategoryFo(Class<? extends TbStoreCategoryFo> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.store = inits.isInitialized("store") ? new com.trism.jesica.persistence.mysql.Entitiy.business.QTbStore(forProperty("store"), inits.get("store")) : null;
        this.systemCategory = inits.isInitialized("systemCategory") ? new QTbSystemCategory(forProperty("systemCategory")) : null;
    }

}

