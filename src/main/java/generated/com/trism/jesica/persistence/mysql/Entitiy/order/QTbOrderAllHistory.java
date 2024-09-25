package com.trism.jesica.persistence.mysql.Entitiy.order;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbOrderAllHistory is a Querydsl query type for TbOrderAllHistory
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbOrderAllHistory extends EntityPathBase<TbOrderAllHistory> {

    private static final long serialVersionUID = 1305808263L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbOrderAllHistory tbOrderAllHistory = new QTbOrderAllHistory("tbOrderAllHistory");

    public final com.trism.jesica.persistence.mysql.mappedsuper.QBaseOrderHistoryEntity _super = new com.trism.jesica.persistence.mysql.mappedsuper.QBaseOrderHistoryEntity(this);

    //inherited
    public final StringPath destAddr5 = _super.destAddr5;

    //inherited
    public final NumberPath<Integer> discountAmt = _super.discountAmt;

    //inherited
    public final NumberPath<Integer> dlvyAmt = _super.dlvyAmt;

    //inherited
    public final NumberPath<Integer> dlvyCnt = _super.dlvyCnt;

    //inherited
    public final NumberPath<Integer> dlvyNo = _super.dlvyNo;

    //inherited
    public final EnumPath<com.trism.jesica.persistence.mysql.type.DlvyPayMethodType> dlvyPayMethod = _super.dlvyPayMethod;

    public final QTbOrderAll order;

    //inherited
    public final NumberPath<Integer> orderAmt = _super.orderAmt;

    //inherited
    public final StringPath orderStatusCode = _super.orderStatusCode;

    //inherited
    public final StringPath orderTypeCode = _super.orderTypeCode;

    //inherited
    public final EnumPath<com.trism.jesica.persistence.mysql.type.PayMethodType> payMethod = _super.payMethod;

    //inherited
    public final NumberPath<Integer> serviceAmt = _super.serviceAmt;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> takeoutDate = _super.takeoutDate;

    //inherited
    public final BooleanPath takeoutYn = _super.takeoutYn;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    //inherited
    public final StringPath updateMemo = _super.updateMemo;

    //inherited
    public final NumberPath<Integer> updateScn = _super.updateScn;

    //inherited
    public final NumberPath<Long> updateUserNo = _super.updateUserNo;

    //inherited
    public final EnumPath<com.trism.jesica.persistence.mysql.type.UserType> updateUserType = _super.updateUserType;

    //inherited
    public final StringPath workerName = _super.workerName;

    //inherited
    public final NumberPath<Long> workerNo = _super.workerNo;

    public QTbOrderAllHistory(String variable) {
        this(TbOrderAllHistory.class, forVariable(variable), INITS);
    }

    public QTbOrderAllHistory(Path<? extends TbOrderAllHistory> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbOrderAllHistory(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbOrderAllHistory(PathMetadata metadata, PathInits inits) {
        this(TbOrderAllHistory.class, metadata, inits);
    }

    public QTbOrderAllHistory(Class<? extends TbOrderAllHistory> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.order = inits.isInitialized("order") ? new QTbOrderAll(forProperty("order"), inits.get("order")) : null;
    }

}

