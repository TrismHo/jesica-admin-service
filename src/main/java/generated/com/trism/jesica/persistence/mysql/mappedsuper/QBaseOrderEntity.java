package com.trism.jesica.persistence.mysql.mappedsuper;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QBaseOrderEntity is a Querydsl query type for BaseOrderEntity
 */
@Generated("com.querydsl.codegen.SupertypeSerializer")
public class QBaseOrderEntity extends EntityPathBase<BaseOrderEntity> {

    private static final long serialVersionUID = -1065786282L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QBaseOrderEntity baseOrderEntity = new QBaseOrderEntity("baseOrderEntity");

    public final com.trism.jesica.persistence.mysql.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.mysql.core.entity.QBaseEntity(this);

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

    public final DateTimePath<java.time.LocalDateTime> dlvyArrDate = createDateTime("dlvyArrDate", java.time.LocalDateTime.class);

    public final NumberPath<Integer> dlvyCancelTime = createNumber("dlvyCancelTime", Integer.class);

    public final NumberPath<Integer> dlvyCnt = createNumber("dlvyCnt", Integer.class);

    public final NumberPath<Integer> dlvyDistance = createNumber("dlvyDistance", Integer.class);

    public final NumberPath<Integer> dlvyExtraCharge = createNumber("dlvyExtraCharge", Integer.class);

    public final NumberPath<Integer> dlvyNo = createNumber("dlvyNo", Integer.class);

    public final EnumPath<com.trism.jesica.persistence.mysql.type.DlvyPayMethodType> dlvyPayMethod = createEnum("dlvyPayMethod", com.trism.jesica.persistence.mysql.type.DlvyPayMethodType.class);

    public final NumberPath<Integer> dlvyPenaltyAmt = createNumber("dlvyPenaltyAmt", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> dlvyReqDate = createDateTime("dlvyReqDate", java.time.LocalDateTime.class);

    public final NumberPath<Long> exOrderNo = createNumber("exOrderNo", Long.class);

    public final DateTimePath<java.time.LocalDateTime> expectArrTime = createDateTime("expectArrTime", java.time.LocalDateTime.class);

    public final StringPath exStoreCd = createString("exStoreCd");

    public final DateTimePath<java.time.LocalDateTime> finishDate = createDateTime("finishDate", java.time.LocalDateTime.class);

    public final StringPath goodsName = createString("goodsName");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final NumberPath<Integer> orderAmt = createNumber("orderAmt", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> orderDate = createDateTime("orderDate", java.time.LocalDateTime.class);

    public final NumberPath<Long> orderNo = createNumber("orderNo", Long.class);

    public final StringPath orderPathCode = createString("orderPathCode");

    public final StringPath orderStatusCode = createString("orderStatusCode");

    public final StringPath orderTypeCode = createString("orderTypeCode");

    public final EnumPath<com.trism.jesica.persistence.mysql.type.PayMethodType> payMethod = createEnum("payMethod", com.trism.jesica.persistence.mysql.type.PayMethodType.class);

    public final DateTimePath<java.time.LocalDateTime> pickupDate = createDateTime("pickupDate", java.time.LocalDateTime.class);

    public final DateTimePath<java.time.LocalDateTime> readyDate = createDateTime("readyDate", java.time.LocalDateTime.class);

    public final NumberPath<Integer> readyTime = createNumber("readyTime", Integer.class);

    public final NumberPath<Integer> serviceAmt = createNumber("serviceAmt", Integer.class);

    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbStoreSub store;

    public final StringPath storeName = createString("storeName");

    public final NumberPath<Integer> storeNo = createNumber("storeNo", Integer.class);

    public final StringPath storeTel = createString("storeTel");

    public final DateTimePath<java.time.LocalDateTime> takeoutDate = createDateTime("takeoutDate", java.time.LocalDateTime.class);

    public final BooleanPath takeoutYn = createBoolean("takeoutYn");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    public final NumberPath<Integer> updateScn = createNumber("updateScn", Integer.class);

    public final StringPath workerName = createString("workerName");

    public final NumberPath<Integer> workerNo = createNumber("workerNo", Integer.class);

    public final StringPath workerTel = createString("workerTel");

    public QBaseOrderEntity(String variable) {
        this(BaseOrderEntity.class, forVariable(variable), INITS);
    }

    public QBaseOrderEntity(Path<? extends BaseOrderEntity> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QBaseOrderEntity(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QBaseOrderEntity(PathMetadata metadata, PathInits inits) {
        this(BaseOrderEntity.class, metadata, inits);
    }

    public QBaseOrderEntity(Class<? extends BaseOrderEntity> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.store = inits.isInitialized("store") ? new com.trism.jesica.persistence.mysql.Entitiy.business.QTbStoreSub(forProperty("store"), inits.get("store")) : null;
    }

}

