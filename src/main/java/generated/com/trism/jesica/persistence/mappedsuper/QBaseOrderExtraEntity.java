package com.trism.jesica.persistence.mappedsuper;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QBaseOrderExtraEntity is a Querydsl query type for BaseOrderExtraEntity
 */
@Generated("com.querydsl.codegen.SupertypeSerializer")
public class QBaseOrderExtraEntity extends EntityPathBase<BaseOrderExtraEntity> {

    private static final long serialVersionUID = -134058572L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QBaseOrderExtraEntity baseOrderExtraEntity = new QBaseOrderExtraEntity("baseOrderExtraEntity");

    public final com.trism.jesica.persistence.Entitiy.business.QTbBranchSub acceptBranch;

    public final com.trism.jesica.persistence.Entitiy.business.QTbHeadSub acceptHead;

    public final com.trism.jesica.persistence.Entitiy.business.QTbStoreSub acceptStore;

    public final StringPath acceptStoreTel = createString("acceptStoreTel");

    public final StringPath cancelMemo = createString("cancelMemo");

    public final StringPath custMemo = createString("custMemo");

    public final StringPath custTel2 = createString("custTel2");

    public final StringPath departAddr1 = createString("departAddr1");

    public final StringPath departAddr2 = createString("departAddr2");

    public final StringPath departAddr3 = createString("departAddr3");

    public final StringPath departAddr4 = createString("departAddr4");

    public final StringPath departAddr5 = createString("departAddr5");

    public final StringPath departMemo = createString("departMemo");

    public final StringPath departTel = createString("departTel");

    public final StringPath destAddr1 = createString("destAddr1");

    public final StringPath destAddr2 = createString("destAddr2");

    public final StringPath destAddr5 = createString("destAddr5");

    public final StringPath destMemo = createString("destMemo");

    public final StringPath destTel = createString("destTel");

    public final com.trism.jesica.persistence.Entitiy.business.QTbBranchSub giveBranch;

    public final com.trism.jesica.persistence.Entitiy.business.QTbHeadSub giveHead;

    public final com.trism.jesica.persistence.Entitiy.business.QTbStoreSub masterStore;

    public final com.trism.jesica.persistence.Entitiy.business.QTbBranchSub orderBranch;

    public final StringPath orderCancelCode = createString("orderCancelCode");

    public final com.trism.jesica.persistence.Entitiy.business.QTbHeadSub orderHead;

    public final StringPath orderMemo = createString("orderMemo");

    public final NumberPath<Long> orderNo = createNumber("orderNo", Long.class);

    public QBaseOrderExtraEntity(String variable) {
        this(BaseOrderExtraEntity.class, forVariable(variable), INITS);
    }

    public QBaseOrderExtraEntity(Path<? extends BaseOrderExtraEntity> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QBaseOrderExtraEntity(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QBaseOrderExtraEntity(PathMetadata metadata, PathInits inits) {
        this(BaseOrderExtraEntity.class, metadata, inits);
    }

    public QBaseOrderExtraEntity(Class<? extends BaseOrderExtraEntity> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.acceptBranch = inits.isInitialized("acceptBranch") ? new com.trism.jesica.persistence.Entitiy.business.QTbBranchSub(forProperty("acceptBranch"), inits.get("acceptBranch")) : null;
        this.acceptHead = inits.isInitialized("acceptHead") ? new com.trism.jesica.persistence.Entitiy.business.QTbHeadSub(forProperty("acceptHead"), inits.get("acceptHead")) : null;
        this.acceptStore = inits.isInitialized("acceptStore") ? new com.trism.jesica.persistence.Entitiy.business.QTbStoreSub(forProperty("acceptStore"), inits.get("acceptStore")) : null;
        this.giveBranch = inits.isInitialized("giveBranch") ? new com.trism.jesica.persistence.Entitiy.business.QTbBranchSub(forProperty("giveBranch"), inits.get("giveBranch")) : null;
        this.giveHead = inits.isInitialized("giveHead") ? new com.trism.jesica.persistence.Entitiy.business.QTbHeadSub(forProperty("giveHead"), inits.get("giveHead")) : null;
        this.masterStore = inits.isInitialized("masterStore") ? new com.trism.jesica.persistence.Entitiy.business.QTbStoreSub(forProperty("masterStore"), inits.get("masterStore")) : null;
        this.orderBranch = inits.isInitialized("orderBranch") ? new com.trism.jesica.persistence.Entitiy.business.QTbBranchSub(forProperty("orderBranch"), inits.get("orderBranch")) : null;
        this.orderHead = inits.isInitialized("orderHead") ? new com.trism.jesica.persistence.Entitiy.business.QTbHeadSub(forProperty("orderHead"), inits.get("orderHead")) : null;
    }

}

