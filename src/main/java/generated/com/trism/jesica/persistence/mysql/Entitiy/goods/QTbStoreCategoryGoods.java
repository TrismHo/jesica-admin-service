package com.trism.jesica.persistence.mysql.Entitiy.goods;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbStoreCategoryGoods is a Querydsl query type for TbStoreCategoryGoods
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbStoreCategoryGoods extends EntityPathBase<TbStoreCategoryGoods> {

    private static final long serialVersionUID = 380428521L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbStoreCategoryGoods tbStoreCategoryGoods = new QTbStoreCategoryGoods("tbStoreCategoryGoods");

    public final com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity _super = new com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity(this);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final QTbStoreCategory storeCategory;

    public final QTbStoreGoods storeGoods;

    public QTbStoreCategoryGoods(String variable) {
        this(TbStoreCategoryGoods.class, forVariable(variable), INITS);
    }

    public QTbStoreCategoryGoods(Path<? extends TbStoreCategoryGoods> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbStoreCategoryGoods(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbStoreCategoryGoods(PathMetadata metadata, PathInits inits) {
        this(TbStoreCategoryGoods.class, metadata, inits);
    }

    public QTbStoreCategoryGoods(Class<? extends TbStoreCategoryGoods> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.storeCategory = inits.isInitialized("storeCategory") ? new QTbStoreCategory(forProperty("storeCategory"), inits.get("storeCategory")) : null;
        this.storeGoods = inits.isInitialized("storeGoods") ? new QTbStoreGoods(forProperty("storeGoods"), inits.get("storeGoods")) : null;
    }

}

