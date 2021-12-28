package com.trism.jesica.persistence.Entitiy.goods;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbStoreGoods is a Querydsl query type for TbStoreGoods
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbStoreGoods extends EntityPathBase<TbStoreGoods> {

    private static final long serialVersionUID = -546775685L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbStoreGoods tbStoreGoods = new QTbStoreGoods("tbStoreGoods");

    public final com.trism.jesica.persistence.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.core.entity.QBaseEntity(this);

    public final BooleanPath adultYn = createBoolean("adultYn");

    public final StringPath barcode = createString("barcode");

    public final StringPath barcode2 = createString("barcode2");

    public final BooleanPath basicOptionYn = createBoolean("basicOptionYn");

    public final NumberPath<Integer> buyPrice = createNumber("buyPrice", Integer.class);

    public final BooleanPath buyTaxYn = createBoolean("buyTaxYn");

    public final EnumPath<com.trism.jesica.persistence.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.type.DataStatus.class);

    public final StringPath goodsDcEnd = createString("goodsDcEnd");

    public final NumberPath<Integer> goodsDcPrice = createNumber("goodsDcPrice", Integer.class);

    public final StringPath goodsDcStart = createString("goodsDcStart");

    public final StringPath goodsDetail = createString("goodsDetail");

    public final NumberPath<Integer> goodsLimitDay = createNumber("goodsLimitDay", Integer.class);

    public final NumberPath<Integer> goodsLimitOnce = createNumber("goodsLimitOnce", Integer.class);

    public final StringPath goodsName = createString("goodsName");

    public final NumberPath<Integer> goodsPrice = createNumber("goodsPrice", Integer.class);

    public final EnumPath<com.trism.jesica.persistence.type.GoodsStatus> goodsStatus = createEnum("goodsStatus", com.trism.jesica.persistence.type.GoodsStatus.class);

    public final StringPath imgFile1 = createString("imgFile1");

    public final StringPath imgFile2 = createString("imgFile2");

    public final StringPath imgFile3 = createString("imgFile3");

    public final StringPath imgFileSmall = createString("imgFileSmall");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath insertUserId = createString("insertUserId");

    public final StringPath searchText = createString("searchText");

    public final NumberPath<Integer> stockCnt = createNumber("stockCnt", Integer.class);

    public final BooleanPath stockYn = createBoolean("stockYn");

    public final com.trism.jesica.persistence.Entitiy.business.QTbStore store;

    public final ListPath<TbStoreCategoryGoods, QTbStoreCategoryGoods> storeCategoryGoods = this.<TbStoreCategoryGoods, QTbStoreCategoryGoods>createList("storeCategoryGoods", TbStoreCategoryGoods.class, QTbStoreCategoryGoods.class, PathInits.DIRECT2);

    public final NumberPath<Long> storeGoodsNo = createNumber("storeGoodsNo", Long.class);

    public final NumberPath<Long> storeNo = createNumber("storeNo", Long.class);

    public final NumberPath<Long> subStoreNo = createNumber("subStoreNo", Long.class);

    public final BooleanPath taxYn = createBoolean("taxYn");

    public final NumberPath<Integer> totalSellCnt = createNumber("totalSellCnt", Integer.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    public final StringPath updateUserId = createString("updateUserId");

    public final NumberPath<Integer> viewOrder = createNumber("viewOrder", Integer.class);

    public QTbStoreGoods(String variable) {
        this(TbStoreGoods.class, forVariable(variable), INITS);
    }

    public QTbStoreGoods(Path<? extends TbStoreGoods> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbStoreGoods(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbStoreGoods(PathMetadata metadata, PathInits inits) {
        this(TbStoreGoods.class, metadata, inits);
    }

    public QTbStoreGoods(Class<? extends TbStoreGoods> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.store = inits.isInitialized("store") ? new com.trism.jesica.persistence.Entitiy.business.QTbStore(forProperty("store"), inits.get("store")) : null;
    }

}

