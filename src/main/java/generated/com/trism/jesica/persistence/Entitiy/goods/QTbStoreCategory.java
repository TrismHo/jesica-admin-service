package com.trism.jesica.persistence.Entitiy.goods;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbStoreCategory is a Querydsl query type for TbStoreCategory
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbStoreCategory extends EntityPathBase<TbStoreCategory> {

    private static final long serialVersionUID = -256079687L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbStoreCategory tbStoreCategory = new QTbStoreCategory("tbStoreCategory");

    public final com.trism.jesica.persistence.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.core.entity.QBaseEntity(this);

    public final EnumPath<com.trism.jesica.persistence.type.CatLevel> catLevel = createEnum("catLevel", com.trism.jesica.persistence.type.CatLevel.class);

    public final StringPath catName = createString("catName");

    public final StringPath catValue = createString("catValue");

    public final EnumPath<com.trism.jesica.persistence.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.type.DataStatus.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath memo = createString("memo");

    public final NumberPath<Long> parentCatNo = createNumber("parentCatNo", Long.class);

    public final com.trism.jesica.persistence.Entitiy.business.QTbStore store;

    public final ListPath<TbStoreCategoryGoods, QTbStoreCategoryGoods> storeCategoryGoods = this.<TbStoreCategoryGoods, QTbStoreCategoryGoods>createList("storeCategoryGoods", TbStoreCategoryGoods.class, QTbStoreCategoryGoods.class, PathInits.DIRECT2);

    public final NumberPath<Long> storeCatNo = createNumber("storeCatNo", Long.class);

    public final NumberPath<Integer> storeNo = createNumber("storeNo", Integer.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    public final NumberPath<Integer> viewOrder = createNumber("viewOrder", Integer.class);

    public QTbStoreCategory(String variable) {
        this(TbStoreCategory.class, forVariable(variable), INITS);
    }

    public QTbStoreCategory(Path<? extends TbStoreCategory> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbStoreCategory(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbStoreCategory(PathMetadata metadata, PathInits inits) {
        this(TbStoreCategory.class, metadata, inits);
    }

    public QTbStoreCategory(Class<? extends TbStoreCategory> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.store = inits.isInitialized("store") ? new com.trism.jesica.persistence.Entitiy.business.QTbStore(forProperty("store"), inits.get("store")) : null;
    }

}

