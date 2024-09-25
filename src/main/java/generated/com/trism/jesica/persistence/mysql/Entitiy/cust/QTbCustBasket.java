package com.trism.jesica.persistence.mysql.Entitiy.cust;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbCustBasket is a Querydsl query type for TbCustBasket
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbCustBasket extends EntityPathBase<TbCustBasket> {

    private static final long serialVersionUID = 96051414L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbCustBasket tbCustBasket = new QTbCustBasket("tbCustBasket");

    public final com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity _super = new com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity(this);

    public final StringPath basicItemName = createString("basicItemName");

    public final NumberPath<Integer> basicItemNo = createNumber("basicItemNo", Integer.class);

    public final NumberPath<Long> basketNo = createNumber("basketNo", Long.class);

    public final QTbCustBasketOption basketOption;

    public final QTbCust cust;

    public final EnumPath<com.trism.jesica.persistence.mysql.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.mysql.type.DataStatus.class);

    public final DateTimePath<java.time.LocalDateTime> expireDate = createDateTime("expireDate", java.time.LocalDateTime.class);

    public final NumberPath<Integer> goodsCnt = createNumber("goodsCnt", Integer.class);

    public final StringPath goodsName = createString("goodsName");

    public final NumberPath<Integer> goodsPrice = createNumber("goodsPrice", Integer.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbStore store;

    public final com.trism.jesica.persistence.mysql.Entitiy.goods.QTbStoreGoods storeGoods;

    public final BooleanPath taxYn = createBoolean("taxYn");

    public final NumberPath<Integer> totalAmt = createNumber("totalAmt", Integer.class);

    public QTbCustBasket(String variable) {
        this(TbCustBasket.class, forVariable(variable), INITS);
    }

    public QTbCustBasket(Path<? extends TbCustBasket> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbCustBasket(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbCustBasket(PathMetadata metadata, PathInits inits) {
        this(TbCustBasket.class, metadata, inits);
    }

    public QTbCustBasket(Class<? extends TbCustBasket> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.basketOption = inits.isInitialized("basketOption") ? new QTbCustBasketOption(forProperty("basketOption"), inits.get("basketOption")) : null;
        this.cust = inits.isInitialized("cust") ? new QTbCust(forProperty("cust"), inits.get("cust")) : null;
        this.store = inits.isInitialized("store") ? new com.trism.jesica.persistence.mysql.Entitiy.business.QTbStore(forProperty("store"), inits.get("store")) : null;
        this.storeGoods = inits.isInitialized("storeGoods") ? new com.trism.jesica.persistence.mysql.Entitiy.goods.QTbStoreGoods(forProperty("storeGoods"), inits.get("storeGoods")) : null;
    }

}

