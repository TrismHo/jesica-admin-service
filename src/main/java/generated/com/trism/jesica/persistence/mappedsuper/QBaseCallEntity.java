package com.trism.jesica.persistence.mappedsuper;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QBaseCallEntity is a Querydsl query type for BaseCallEntity
 */
@Generated("com.querydsl.codegen.SupertypeSerializer")
public class QBaseCallEntity extends EntityPathBase<BaseCallEntity> {

    private static final long serialVersionUID = 2138965232L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QBaseCallEntity baseCallEntity = new QBaseCallEntity("baseCallEntity");

    public final com.trism.jesica.persistence.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.core.entity.QBaseEntity(this);

    public final StringPath airportDriveYn = createString("airportDriveYn");

    public final DateTimePath<java.time.LocalDateTime> cancelDate = createDateTime("cancelDate", java.time.LocalDateTime.class);

    public final NumberPath<Integer> custNo = createNumber("custNo", Integer.class);

    public final StringPath custTel = createString("custTel");

    public final NumberPath<java.math.BigDecimal> departLat = createNumber("departLat", java.math.BigDecimal.class);

    public final NumberPath<java.math.BigDecimal> departLng = createNumber("departLng", java.math.BigDecimal.class);

    public final StringPath departPoi = createString("departPoi");

    public final StringPath destAddr3 = createString("destAddr3");

    public final StringPath destAddr4 = createString("destAddr4");

    public final NumberPath<java.math.BigDecimal> destLat = createNumber("destLat", java.math.BigDecimal.class);

    public final NumberPath<java.math.BigDecimal> destLng = createNumber("destLng", java.math.BigDecimal.class);

    public final StringPath destPoi = createString("destPoi");

    public final NumberPath<Integer> discountAmt = createNumber("discountAmt", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> dlvyAccDate = createDateTime("dlvyAccDate", java.time.LocalDateTime.class);

    public final NumberPath<Integer> dlvyAmt = createNumber("dlvyAmt", Integer.class);

    public final NumberPath<Integer> dlvyDistance = createNumber("dlvyDistance", Integer.class);

    public final NumberPath<Integer> dlvyExtraCharge = createNumber("dlvyExtraCharge", Integer.class);

    public final NumberPath<Integer> dlvyNo = createNumber("dlvyNo", Integer.class);

    public final NumberPath<Integer> dlvyPenaltyAmt = createNumber("dlvyPenaltyAmt", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> dlvyReqDate = createDateTime("dlvyReqDate", java.time.LocalDateTime.class);

    public final DateTimePath<java.time.LocalDateTime> finishDate = createDateTime("finishDate", java.time.LocalDateTime.class);

    public final StringPath goodsName = createString("goodsName");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final NumberPath<Integer> isMask = createNumber("isMask", Integer.class);

    public final NumberPath<Integer> isMember = createNumber("isMember", Integer.class);

    public final NumberPath<Integer> orderAmt = createNumber("orderAmt", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> orderDate = createDateTime("orderDate", java.time.LocalDateTime.class);

    public final NumberPath<Long> orderNo = createNumber("orderNo", Long.class);

    public final StringPath orderPayStatus = createString("orderPayStatus");

    public final StringPath orderStatusCode = createString("orderStatusCode");

    public final StringPath orderTypeCode = createString("orderTypeCode");

    public final DateTimePath<java.time.LocalDateTime> pickupDate = createDateTime("pickupDate", java.time.LocalDateTime.class);

    public final NumberPath<Integer> serviceAmt = createNumber("serviceAmt", Integer.class);

    public final com.trism.jesica.persistence.Entitiy.business.QTbStoreSub store;

    public final StringPath storeName = createString("storeName");

    public final NumberPath<Integer> storeNo = createNumber("storeNo", Integer.class);

    public final StringPath storeTel = createString("storeTel");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    public final NumberPath<Integer> updateScn = createNumber("updateScn", Integer.class);

    public final StringPath workerName = createString("workerName");

    public final NumberPath<Integer> workerNo = createNumber("workerNo", Integer.class);

    public final StringPath workerTel = createString("workerTel");

    public QBaseCallEntity(String variable) {
        this(BaseCallEntity.class, forVariable(variable), INITS);
    }

    public QBaseCallEntity(Path<? extends BaseCallEntity> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QBaseCallEntity(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QBaseCallEntity(PathMetadata metadata, PathInits inits) {
        this(BaseCallEntity.class, metadata, inits);
    }

    public QBaseCallEntity(Class<? extends BaseCallEntity> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.store = inits.isInitialized("store") ? new com.trism.jesica.persistence.Entitiy.business.QTbStoreSub(forProperty("store"), inits.get("store")) : null;
    }

}

