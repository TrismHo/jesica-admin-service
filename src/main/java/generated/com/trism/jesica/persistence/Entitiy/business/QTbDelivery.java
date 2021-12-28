package com.trism.jesica.persistence.Entitiy.business;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbDelivery is a Querydsl query type for TbDelivery
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbDelivery extends EntityPathBase<TbDelivery> {

    private static final long serialVersionUID = 2012761552L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbDelivery tbDelivery = new QTbDelivery("tbDelivery");

    public final com.trism.jesica.persistence.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.core.entity.QBaseEntity(this);

    public final QTbBranch branch;

    public final NumberPath<Integer> branchNo = createNumber("branchNo", Integer.class);

    public final EnumPath<com.trism.jesica.persistence.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.type.DataStatus.class);

    public final NumberPath<Integer> delayTime = createNumber("delayTime", Integer.class);

    public final NumberPath<Integer> dlvyGroupType = createNumber("dlvyGroupType", Integer.class);

    public final StringPath dlvyName = createString("dlvyName");

    public final NumberPath<Long> dlvyNo = createNumber("dlvyNo", Long.class);

    public final QTbHead head;

    public final NumberPath<Integer> headNo = createNumber("headNo", Integer.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath insertUserId = createString("insertUserId");

    public final NumberPath<Integer> mngPrice = createNumber("mngPrice", Integer.class);

    public final NumberPath<Integer> mngRateAccept = createNumber("mngRateAccept", Integer.class);

    public final NumberPath<Integer> mngRateGive = createNumber("mngRateGive", Integer.class);

    public final NumberPath<Integer> mngRatePlatform = createNumber("mngRatePlatform", Integer.class);

    public final NumberPath<Integer> mngRateType = createNumber("mngRateType", Integer.class);

    public final NumberPath<Integer> openStatus = createNumber("openStatus", Integer.class);

    public final StringPath openTimeEnd = createString("openTimeEnd");

    public final StringPath openTimeStart = createString("openTimeStart");

    public final NumberPath<Integer> openTimeYn = createNumber("openTimeYn", Integer.class);

    public final NumberPath<Integer> priceChargeNo = createNumber("priceChargeNo", Integer.class);

    public final QTbStore store;

    public final NumberPath<Integer> storeNo = createNumber("storeNo", Integer.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    public final StringPath updateUserId = createString("updateUserId");

    public final NumberPath<Integer> weatherCharge = createNumber("weatherCharge", Integer.class);

    public final NumberPath<Integer> weatherChargeYn = createNumber("weatherChargeYn", Integer.class);

    public QTbDelivery(String variable) {
        this(TbDelivery.class, forVariable(variable), INITS);
    }

    public QTbDelivery(Path<? extends TbDelivery> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbDelivery(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbDelivery(PathMetadata metadata, PathInits inits) {
        this(TbDelivery.class, metadata, inits);
    }

    public QTbDelivery(Class<? extends TbDelivery> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.branch = inits.isInitialized("branch") ? new QTbBranch(forProperty("branch"), inits.get("branch")) : null;
        this.head = inits.isInitialized("head") ? new QTbHead(forProperty("head"), inits.get("head")) : null;
        this.store = inits.isInitialized("store") ? new QTbStore(forProperty("store"), inits.get("store")) : null;
    }

}

