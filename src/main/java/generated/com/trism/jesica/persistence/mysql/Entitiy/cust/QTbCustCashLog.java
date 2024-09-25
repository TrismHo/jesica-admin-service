package com.trism.jesica.persistence.mysql.Entitiy.cust;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbCustCashLog is a Querydsl query type for TbCustCashLog
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbCustCashLog extends EntityPathBase<TbCustCashLog> {

    private static final long serialVersionUID = -429983231L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbCustCashLog tbCustCashLog = new QTbCustCashLog("tbCustCashLog");

    public final com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity _super = new com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity(this);

    public final NumberPath<Integer> balance = createNumber("balance", Integer.class);

    public final NumberPath<Integer> cash = createNumber("cash", Integer.class);

    public final StringPath cashInoutCode = createString("cashInoutCode");

    public final QTbCust cust;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath insertUserId = createString("insertUserId");

    public final NumberPath<Long> logNo = createNumber("logNo", Long.class);

    public final StringPath memo = createString("memo");

    public final StringPath referInfo = createString("referInfo");

    public final StringPath transGroupName = createString("transGroupName");

    public final NumberPath<Integer> transGroupNo = createNumber("transGroupNo", Integer.class);

    public final NumberPath<Integer> transGroupType = createNumber("transGroupType", Integer.class);

    public QTbCustCashLog(String variable) {
        this(TbCustCashLog.class, forVariable(variable), INITS);
    }

    public QTbCustCashLog(Path<? extends TbCustCashLog> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbCustCashLog(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbCustCashLog(PathMetadata metadata, PathInits inits) {
        this(TbCustCashLog.class, metadata, inits);
    }

    public QTbCustCashLog(Class<? extends TbCustCashLog> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.cust = inits.isInitialized("cust") ? new QTbCust(forProperty("cust"), inits.get("cust")) : null;
    }

}

