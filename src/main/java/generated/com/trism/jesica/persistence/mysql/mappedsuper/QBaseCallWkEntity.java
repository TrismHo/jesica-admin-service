package com.trism.jesica.persistence.mysql.mappedsuper;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QBaseCallWkEntity is a Querydsl query type for BaseCallWkEntity
 */
@Generated("com.querydsl.codegen.SupertypeSerializer")
public class QBaseCallWkEntity extends EntityPathBase<BaseCallWkEntity> {

    private static final long serialVersionUID = 1585496432L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QBaseCallWkEntity baseCallWkEntity = new QBaseCallWkEntity("baseCallWkEntity");

    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbBranchSub branch;

    public final NumberPath<Integer> branchNo = createNumber("branchNo", Integer.class);

    public final NumberPath<Long> callWkNo = createNumber("callWkNo", Long.class);

    public final DateTimePath<java.time.LocalDateTime> cancelDate = createDateTime("cancelDate", java.time.LocalDateTime.class);

    public final DateTimePath<java.time.LocalDateTime> dlvyAccDate = createDateTime("dlvyAccDate", java.time.LocalDateTime.class);

    public final NumberPath<Integer> dlvyNo = createNumber("dlvyNo", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> finishDate = createDateTime("finishDate", java.time.LocalDateTime.class);

    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbHeadSub head;

    public final NumberPath<Integer> headNo = createNumber("headNo", Integer.class);

    public final NumberPath<Long> orderNo = createNumber("orderNo", Long.class);

    public final StringPath orderStatusCode = createString("orderStatusCode");

    public final DateTimePath<java.time.LocalDateTime> pickupDate = createDateTime("pickupDate", java.time.LocalDateTime.class);

    public final NumberPath<Integer> relayStep = createNumber("relayStep", Integer.class);

    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbStoreSub store;

    public final NumberPath<Integer> storeNo = createNumber("storeNo", Integer.class);

    public final StringPath workerName = createString("workerName");

    public final NumberPath<Integer> workerNo = createNumber("workerNo", Integer.class);

    public QBaseCallWkEntity(String variable) {
        this(BaseCallWkEntity.class, forVariable(variable), INITS);
    }

    public QBaseCallWkEntity(Path<? extends BaseCallWkEntity> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QBaseCallWkEntity(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QBaseCallWkEntity(PathMetadata metadata, PathInits inits) {
        this(BaseCallWkEntity.class, metadata, inits);
    }

    public QBaseCallWkEntity(Class<? extends BaseCallWkEntity> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.branch = inits.isInitialized("branch") ? new com.trism.jesica.persistence.mysql.Entitiy.business.QTbBranchSub(forProperty("branch"), inits.get("branch")) : null;
        this.head = inits.isInitialized("head") ? new com.trism.jesica.persistence.mysql.Entitiy.business.QTbHeadSub(forProperty("head"), inits.get("head")) : null;
        this.store = inits.isInitialized("store") ? new com.trism.jesica.persistence.mysql.Entitiy.business.QTbStoreSub(forProperty("store"), inits.get("store")) : null;
    }

}

