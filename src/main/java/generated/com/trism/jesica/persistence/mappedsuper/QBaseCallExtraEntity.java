package com.trism.jesica.persistence.mappedsuper;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QBaseCallExtraEntity is a Querydsl query type for BaseCallExtraEntity
 */
@Generated("com.querydsl.codegen.SupertypeSerializer")
public class QBaseCallExtraEntity extends EntityPathBase<BaseCallExtraEntity> {

    private static final long serialVersionUID = -563439834L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QBaseCallExtraEntity baseCallExtraEntity = new QBaseCallExtraEntity("baseCallExtraEntity");

    public final com.trism.jesica.persistence.Entitiy.business.QTbBranchSub acceptBranch;

    public final com.trism.jesica.persistence.Entitiy.business.QTbHeadSub acceptHead;

    public final com.trism.jesica.persistence.Entitiy.business.QTbStoreSub acceptStore;

    public final StringPath acceptStoreTel = createString("acceptStoreTel");

    public final com.trism.jesica.persistence.Entitiy.business.QTbBranchSub callBranch;

    public final StringPath cancelMemo = createString("cancelMemo");

    public final StringPath carModel = createString("carModel");

    public final StringPath carNum = createString("carNum");

    public final DateTimePath<java.time.LocalDateTime> carUseDate = createDateTime("carUseDate", java.time.LocalDateTime.class);

    public final StringPath custMemo = createString("custMemo");

    public final StringPath custTel2 = createString("custTel2");

    public final StringPath departAddr1 = createString("departAddr1");

    public final StringPath departAddr2 = createString("departAddr2");

    public final StringPath departAddr5 = createString("departAddr5");

    public final StringPath departMemo = createString("departMemo");

    public final StringPath departTel = createString("departTel");

    public final StringPath destAddr1 = createString("destAddr1");

    public final StringPath destAddr2 = createString("destAddr2");

    public final StringPath destAddr5 = createString("destAddr5");

    public final StringPath destMemo = createString("destMemo");

    public final StringPath destTel = createString("destTel");

    public final StringPath orderCancelCode = createString("orderCancelCode");

    public final com.trism.jesica.persistence.Entitiy.business.QTbHeadSub orderHead;

    public final StringPath orderMemo = createString("orderMemo");

    public final NumberPath<Long> orderNo = createNumber("orderNo", Long.class);

    public QBaseCallExtraEntity(String variable) {
        this(BaseCallExtraEntity.class, forVariable(variable), INITS);
    }

    public QBaseCallExtraEntity(Path<? extends BaseCallExtraEntity> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QBaseCallExtraEntity(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QBaseCallExtraEntity(PathMetadata metadata, PathInits inits) {
        this(BaseCallExtraEntity.class, metadata, inits);
    }

    public QBaseCallExtraEntity(Class<? extends BaseCallExtraEntity> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.acceptBranch = inits.isInitialized("acceptBranch") ? new com.trism.jesica.persistence.Entitiy.business.QTbBranchSub(forProperty("acceptBranch"), inits.get("acceptBranch")) : null;
        this.acceptHead = inits.isInitialized("acceptHead") ? new com.trism.jesica.persistence.Entitiy.business.QTbHeadSub(forProperty("acceptHead"), inits.get("acceptHead")) : null;
        this.acceptStore = inits.isInitialized("acceptStore") ? new com.trism.jesica.persistence.Entitiy.business.QTbStoreSub(forProperty("acceptStore"), inits.get("acceptStore")) : null;
        this.callBranch = inits.isInitialized("callBranch") ? new com.trism.jesica.persistence.Entitiy.business.QTbBranchSub(forProperty("callBranch"), inits.get("callBranch")) : null;
        this.orderHead = inits.isInitialized("orderHead") ? new com.trism.jesica.persistence.Entitiy.business.QTbHeadSub(forProperty("orderHead"), inits.get("orderHead")) : null;
    }

}

