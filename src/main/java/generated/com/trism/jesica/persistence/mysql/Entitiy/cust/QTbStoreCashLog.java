package com.trism.jesica.persistence.mysql.Entitiy.cust;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbStoreCashLog is a Querydsl query type for TbStoreCashLog
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbStoreCashLog extends EntityPathBase<TbStoreCashLog> {

    private static final long serialVersionUID = 1290029709L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbStoreCashLog tbStoreCashLog = new QTbStoreCashLog("tbStoreCashLog");

    public final NumberPath<Integer> balance = createNumber("balance", Integer.class);

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

    public QTbStoreCashLog(String variable) {
        this(TbStoreCashLog.class, forVariable(variable), INITS);
    }

    public QTbStoreCashLog(Path<? extends TbStoreCashLog> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbStoreCashLog(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbStoreCashLog(PathMetadata metadata, PathInits inits) {
        this(TbStoreCashLog.class, metadata, inits);
    }

    public QTbStoreCashLog(Class<? extends TbStoreCashLog> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.store = inits.isInitialized("store") ? new com.trism.jesica.persistence.mysql.Entitiy.business.QTbStore(forProperty("store"), inits.get("store")) : null;
    }

}

