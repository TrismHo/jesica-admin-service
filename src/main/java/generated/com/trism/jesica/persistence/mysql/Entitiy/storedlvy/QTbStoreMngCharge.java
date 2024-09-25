package com.trism.jesica.persistence.mysql.Entitiy.storedlvy;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbStoreMngCharge is a Querydsl query type for TbStoreMngCharge
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbStoreMngCharge extends EntityPathBase<TbStoreMngCharge> {

    private static final long serialVersionUID = -1922725867L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbStoreMngCharge tbStoreMngCharge = new QTbStoreMngCharge("tbStoreMngCharge");

    public final NumberPath<Integer> mngChargeDay = createNumber("mngChargeDay", Integer.class);

    public final StringPath mngChargeStart = createString("mngChargeStart");

    public final NumberPath<Integer> mngChargeType = createNumber("mngChargeType", Integer.class);

    public final NumberPath<Integer> mngChargeYn = createNumber("mngChargeYn", Integer.class);

    public final NumberPath<Integer> mngPrice = createNumber("mngPrice", Integer.class);

    public final NumberPath<Integer> mngTargetType = createNumber("mngTargetType", Integer.class);

    public final NumberPath<Integer> plfChargeDay = createNumber("plfChargeDay", Integer.class);

    public final StringPath plfChargeStart = createString("plfChargeStart");

    public final NumberPath<Integer> plfChargeYn = createNumber("plfChargeYn", Integer.class);

    public final NumberPath<Integer> plfPrice = createNumber("plfPrice", Integer.class);

    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbStore store;

    public final NumberPath<Long> storeNo = createNumber("storeNo", Long.class);

    public QTbStoreMngCharge(String variable) {
        this(TbStoreMngCharge.class, forVariable(variable), INITS);
    }

    public QTbStoreMngCharge(Path<? extends TbStoreMngCharge> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbStoreMngCharge(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbStoreMngCharge(PathMetadata metadata, PathInits inits) {
        this(TbStoreMngCharge.class, metadata, inits);
    }

    public QTbStoreMngCharge(Class<? extends TbStoreMngCharge> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.store = inits.isInitialized("store") ? new com.trism.jesica.persistence.mysql.Entitiy.business.QTbStore(forProperty("store"), inits.get("store")) : null;
    }

}

