package com.trism.jesica.persistence.mysql.Entitiy.cust;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbBranchCashLog is a Querydsl query type for TbBranchCashLog
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbBranchCashLog extends EntityPathBase<TbBranchCashLog> {

    private static final long serialVersionUID = -35754222L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbBranchCashLog tbBranchCashLog = new QTbBranchCashLog("tbBranchCashLog");

    public final NumberPath<Integer> balance = createNumber("balance", Integer.class);

    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbBranch branch;

    public final NumberPath<Integer> branchNo = createNumber("branchNo", Integer.class);

    public final NumberPath<Integer> cash = createNumber("cash", Integer.class);

    public final StringPath cashInoutCode = createString("cashInoutCode");

    public final DateTimePath<java.time.LocalDateTime> insertDate = createDateTime("insertDate", java.time.LocalDateTime.class);

    public final StringPath insertUserId = createString("insertUserId");

    public final NumberPath<Long> logNo = createNumber("logNo", Long.class);

    public final StringPath memo = createString("memo");

    public final StringPath referInfo = createString("referInfo");

    public final StringPath tranGroupName = createString("tranGroupName");

    public final NumberPath<Integer> tranGroupNo = createNumber("tranGroupNo", Integer.class);

    public final NumberPath<Integer> tranGroupType = createNumber("tranGroupType", Integer.class);

    public QTbBranchCashLog(String variable) {
        this(TbBranchCashLog.class, forVariable(variable), INITS);
    }

    public QTbBranchCashLog(Path<? extends TbBranchCashLog> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbBranchCashLog(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbBranchCashLog(PathMetadata metadata, PathInits inits) {
        this(TbBranchCashLog.class, metadata, inits);
    }

    public QTbBranchCashLog(Class<? extends TbBranchCashLog> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.branch = inits.isInitialized("branch") ? new com.trism.jesica.persistence.mysql.Entitiy.business.QTbBranch(forProperty("branch"), inits.get("branch")) : null;
    }

}

