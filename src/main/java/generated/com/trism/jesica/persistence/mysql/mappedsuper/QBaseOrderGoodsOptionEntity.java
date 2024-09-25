package com.trism.jesica.persistence.mysql.mappedsuper;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QBaseOrderGoodsOptionEntity is a Querydsl query type for BaseOrderGoodsOptionEntity
 */
@Generated("com.querydsl.codegen.SupertypeSerializer")
public class QBaseOrderGoodsOptionEntity extends EntityPathBase<BaseOrderGoodsOptionEntity> {

    private static final long serialVersionUID = 1908855003L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QBaseOrderGoodsOptionEntity baseOrderGoodsOptionEntity = new QBaseOrderGoodsOptionEntity("baseOrderGoodsOptionEntity");

    public final StringPath itemName = createString("itemName");

    public final NumberPath<Integer> itemPrice = createNumber("itemPrice", Integer.class);

    public final NumberPath<Integer> optItemNo = createNumber("optItemNo", Integer.class);

    public final StringPath optName = createString("optName");

    public final NumberPath<Long> orderGoodsNo = createNumber("orderGoodsNo", Long.class);

    public final com.trism.jesica.persistence.mysql.Entitiy.goods.QTbStoreOption storeOption;

    public final NumberPath<Integer> viewOrder = createNumber("viewOrder", Integer.class);

    public QBaseOrderGoodsOptionEntity(String variable) {
        this(BaseOrderGoodsOptionEntity.class, forVariable(variable), INITS);
    }

    public QBaseOrderGoodsOptionEntity(Path<? extends BaseOrderGoodsOptionEntity> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QBaseOrderGoodsOptionEntity(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QBaseOrderGoodsOptionEntity(PathMetadata metadata, PathInits inits) {
        this(BaseOrderGoodsOptionEntity.class, metadata, inits);
    }

    public QBaseOrderGoodsOptionEntity(Class<? extends BaseOrderGoodsOptionEntity> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.storeOption = inits.isInitialized("storeOption") ? new com.trism.jesica.persistence.mysql.Entitiy.goods.QTbStoreOption(forProperty("storeOption"), inits.get("storeOption")) : null;
    }

}

