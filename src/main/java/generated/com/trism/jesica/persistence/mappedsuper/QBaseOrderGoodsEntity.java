package com.trism.jesica.persistence.mappedsuper;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QBaseOrderGoodsEntity is a Querydsl query type for BaseOrderGoodsEntity
 */
@Generated("com.querydsl.codegen.SupertypeSerializer")
public class QBaseOrderGoodsEntity extends EntityPathBase<BaseOrderGoodsEntity> {

    private static final long serialVersionUID = -1346345862L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QBaseOrderGoodsEntity baseOrderGoodsEntity = new QBaseOrderGoodsEntity("baseOrderGoodsEntity");

    public final StringPath basicItemName = createString("basicItemName");

    public final NumberPath<Integer> basicItemNo = createNumber("basicItemNo", Integer.class);

    public final BooleanPath dataStatus = createBoolean("dataStatus");

    public final NumberPath<Integer> goodsCnt = createNumber("goodsCnt", Integer.class);

    public final StringPath goodsName = createString("goodsName");

    public final NumberPath<Integer> goodsPrice = createNumber("goodsPrice", Integer.class);

    public final EnumPath<com.trism.jesica.persistence.type.GoodsType> goodsType = createEnum("goodsType", com.trism.jesica.persistence.type.GoodsType.class);

    public final NumberPath<Long> orderGoodsNo = createNumber("orderGoodsNo", Long.class);

    public final com.trism.jesica.persistence.Entitiy.business.QTbStore store;

    public final com.trism.jesica.persistence.Entitiy.goods.QTbStoreGoods storeGoods;

    public final BooleanPath taxYn = createBoolean("taxYn");

    public final NumberPath<Integer> totalAmt = createNumber("totalAmt", Integer.class);

    public QBaseOrderGoodsEntity(String variable) {
        this(BaseOrderGoodsEntity.class, forVariable(variable), INITS);
    }

    public QBaseOrderGoodsEntity(Path<? extends BaseOrderGoodsEntity> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QBaseOrderGoodsEntity(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QBaseOrderGoodsEntity(PathMetadata metadata, PathInits inits) {
        this(BaseOrderGoodsEntity.class, metadata, inits);
    }

    public QBaseOrderGoodsEntity(Class<? extends BaseOrderGoodsEntity> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.store = inits.isInitialized("store") ? new com.trism.jesica.persistence.Entitiy.business.QTbStore(forProperty("store"), inits.get("store")) : null;
        this.storeGoods = inits.isInitialized("storeGoods") ? new com.trism.jesica.persistence.Entitiy.goods.QTbStoreGoods(forProperty("storeGoods"), inits.get("storeGoods")) : null;
    }

}

