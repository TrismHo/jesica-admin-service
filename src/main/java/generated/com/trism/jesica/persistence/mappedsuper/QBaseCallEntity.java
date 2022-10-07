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

    public final NumberPath<Integer> acceptBranchNo = createNumber("acceptBranchNo", Integer.class);

    public final NumberPath<Integer> acceptHeadNo = createNumber("acceptHeadNo", Integer.class);

    public final NumberPath<Integer> acceptStoreNo = createNumber("acceptStoreNo", Integer.class);

    public final NumberPath<Integer> acceptStoreTel = createNumber("acceptStoreTel", Integer.class);

    public final NumberPath<Integer> branchNo = createNumber("branchNo", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> cancelDate = createDateTime("cancelDate", java.time.LocalDateTime.class);

    public final StringPath cancelMemo = createString("cancelMemo");

    public final StringPath carModel = createString("carModel");

    public final StringPath carNum = createString("carNum");

    public final DateTimePath<java.time.LocalDateTime> carUseDate = createDateTime("carUseDate", java.time.LocalDateTime.class);

    public final StringPath custMemo = createString("custMemo");

    public final NumberPath<Integer> custNo = createNumber("custNo", Integer.class);

    public final StringPath custTel = createString("custTel");

    public final StringPath custTel2 = createString("custTel2");

    public final NumberPath<Integer> discountAmt = createNumber("discountAmt", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> dlvyAccDate = createDateTime("dlvyAccDate", java.time.LocalDateTime.class);

    public final DateTimePath<java.time.LocalDateTime> dlvyReqDate = createDateTime("dlvyReqDate", java.time.LocalDateTime.class);

    public final DateTimePath<java.time.LocalDateTime> finishDate = createDateTime("finishDate", java.time.LocalDateTime.class);

    public final com.trism.jesica.persistence.Entitiy.business.QTbHead head;

    public final NumberPath<Integer> headNo = createNumber("headNo", Integer.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final NumberPath<Integer> orderAmt = createNumber("orderAmt", Integer.class);

    public final StringPath orderCancelCode = createString("orderCancelCode");

    public final DateTimePath<java.time.LocalDateTime> orderDate = createDateTime("orderDate", java.time.LocalDateTime.class);

    public final StringPath orderMemo = createString("orderMemo");

    public final NumberPath<Long> orderNo = createNumber("orderNo", Long.class);

    public final StringPath orderPayStatus = createString("orderPayStatus");

    public final StringPath orderStatusCode = createString("orderStatusCode");

    public final StringPath orderTypeCode = createString("orderTypeCode");

    public final DateTimePath<java.time.LocalDateTime> pickupDate = createDateTime("pickupDate", java.time.LocalDateTime.class);

    public final NumberPath<Integer> pubCouponNo = createNumber("pubCouponNo", Integer.class);

    public final NumberPath<Integer> relayCnt = createNumber("relayCnt", Integer.class);

    public final NumberPath<Integer> relayStep = createNumber("relayStep", Integer.class);

    public final NumberPath<Integer> serviceAmt = createNumber("serviceAmt", Integer.class);

    public final StringPath storeName = createString("storeName");

    public final NumberPath<Integer> storeNo = createNumber("storeNo", Integer.class);

    public final StringPath storeTel = createString("storeTel");

    public final NumberPath<Integer> totalAmt = createNumber("totalAmt", Integer.class);

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
        this.head = inits.isInitialized("head") ? new com.trism.jesica.persistence.Entitiy.business.QTbHead(forProperty("head"), inits.get("head")) : null;
    }

}

