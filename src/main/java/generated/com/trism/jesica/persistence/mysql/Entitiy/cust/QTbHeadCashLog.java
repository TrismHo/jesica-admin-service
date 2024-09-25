package com.trism.jesica.persistence.mysql.Entitiy.cust;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbHeadCashLog is a Querydsl query type for TbHeadCashLog
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbHeadCashLog extends EntityPathBase<TbHeadCashLog> {

    private static final long serialVersionUID = -1621308972L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbHeadCashLog tbHeadCashLog = new QTbHeadCashLog("tbHeadCashLog");

    public final NumberPath<Integer> balance = createNumber("balance", Integer.class);

    public final NumberPath<Integer> cash = createNumber("cash", Integer.class);

    public final StringPath cashInoutCode = createString("cashInoutCode");

    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbHead head;

    public final NumberPath<Integer> headNo = createNumber("headNo", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> insertDate = createDateTime("insertDate", java.time.LocalDateTime.class);

    public final StringPath insertUserId = createString("insertUserId");

    public final NumberPath<Long> logNo = createNumber("logNo", Long.class);

    public final StringPath memo = createString("memo");

    public final StringPath referInfo = createString("referInfo");

    public final StringPath tranGroupName = createString("tranGroupName");

    public final NumberPath<Integer> tranGroupNo = createNumber("tranGroupNo", Integer.class);

    public final NumberPath<Integer> tranGroupType = createNumber("tranGroupType", Integer.class);

    public QTbHeadCashLog(String variable) {
        this(TbHeadCashLog.class, forVariable(variable), INITS);
    }

    public QTbHeadCashLog(Path<? extends TbHeadCashLog> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbHeadCashLog(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbHeadCashLog(PathMetadata metadata, PathInits inits) {
        this(TbHeadCashLog.class, metadata, inits);
    }

    public QTbHeadCashLog(Class<? extends TbHeadCashLog> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.head = inits.isInitialized("head") ? new com.trism.jesica.persistence.mysql.Entitiy.business.QTbHead(forProperty("head"), inits.get("head")) : null;
    }

}

