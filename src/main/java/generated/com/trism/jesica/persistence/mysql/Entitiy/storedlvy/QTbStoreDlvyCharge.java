package com.trism.jesica.persistence.mysql.Entitiy.storedlvy;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbStoreDlvyCharge is a Querydsl query type for TbStoreDlvyCharge
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbStoreDlvyCharge extends EntityPathBase<TbStoreDlvyCharge> {

    private static final long serialVersionUID = 1613203556L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbStoreDlvyCharge tbStoreDlvyCharge = new QTbStoreDlvyCharge("tbStoreDlvyCharge");

    public final NumberPath<Long> areaChargeNo = createNumber("areaChargeNo", Long.class);

    public final NumberPath<Integer> dlvyChargeType = createNumber("dlvyChargeType", Integer.class);

    public final NumberPath<Long> priceChargeNo = createNumber("priceChargeNo", Long.class);

    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbStore store;

    public final NumberPath<Long> storeNo = createNumber("storeNo", Long.class);

    public final NumberPath<Integer> useYn = createNumber("useYn", Integer.class);

    public final NumberPath<Integer> weatherCharge = createNumber("weatherCharge", Integer.class);

    public final NumberPath<Integer> weatherChargeYn = createNumber("weatherChargeYn", Integer.class);

    public QTbStoreDlvyCharge(String variable) {
        this(TbStoreDlvyCharge.class, forVariable(variable), INITS);
    }

    public QTbStoreDlvyCharge(Path<? extends TbStoreDlvyCharge> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbStoreDlvyCharge(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbStoreDlvyCharge(PathMetadata metadata, PathInits inits) {
        this(TbStoreDlvyCharge.class, metadata, inits);
    }

    public QTbStoreDlvyCharge(Class<? extends TbStoreDlvyCharge> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.store = inits.isInitialized("store") ? new com.trism.jesica.persistence.mysql.Entitiy.business.QTbStore(forProperty("store"), inits.get("store")) : null;
    }

}

