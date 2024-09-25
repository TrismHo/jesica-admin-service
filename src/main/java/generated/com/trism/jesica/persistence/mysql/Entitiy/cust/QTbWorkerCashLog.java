package com.trism.jesica.persistence.mysql.Entitiy.cust;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbWorkerCashLog is a Querydsl query type for TbWorkerCashLog
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbWorkerCashLog extends EntityPathBase<TbWorkerCashLog> {

    private static final long serialVersionUID = -1255067210L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbWorkerCashLog tbWorkerCashLog = new QTbWorkerCashLog("tbWorkerCashLog");

    public final NumberPath<Integer> balance = createNumber("balance", Integer.class);

    public final NumberPath<Integer> branchNo = createNumber("branchNo", Integer.class);

    public final NumberPath<Integer> cash = createNumber("cash", Integer.class);

    public final StringPath cashInoutCode = createString("cashInoutCode");

    public final DateTimePath<java.time.LocalDateTime> insertDate = createDateTime("insertDate", java.time.LocalDateTime.class);

    public final StringPath insertUserId = createString("insertUserId");

    public final NumberPath<Long> logNo = createNumber("logNo", Long.class);

    public final StringPath memo = createString("memo");

    public final StringPath referInfo = createString("referInfo");

    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbStore store;

    public final NumberPath<Integer> storeNo = createNumber("storeNo", Integer.class);

    public final StringPath tranGroupName = createString("tranGroupName");

    public final NumberPath<Integer> tranGroupNo = createNumber("tranGroupNo", Integer.class);

    public final NumberPath<Integer> tranGroupType = createNumber("tranGroupType", Integer.class);

    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbUserWorker worker;

    public final NumberPath<Integer> workerNo = createNumber("workerNo", Integer.class);

    public QTbWorkerCashLog(String variable) {
        this(TbWorkerCashLog.class, forVariable(variable), INITS);
    }

    public QTbWorkerCashLog(Path<? extends TbWorkerCashLog> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbWorkerCashLog(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbWorkerCashLog(PathMetadata metadata, PathInits inits) {
        this(TbWorkerCashLog.class, metadata, inits);
    }

    public QTbWorkerCashLog(Class<? extends TbWorkerCashLog> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.store = inits.isInitialized("store") ? new com.trism.jesica.persistence.mysql.Entitiy.business.QTbStore(forProperty("store"), inits.get("store")) : null;
        this.worker = inits.isInitialized("worker") ? new com.trism.jesica.persistence.mysql.Entitiy.business.QTbUserWorker(forProperty("worker"), inits.get("worker")) : null;
    }

}

