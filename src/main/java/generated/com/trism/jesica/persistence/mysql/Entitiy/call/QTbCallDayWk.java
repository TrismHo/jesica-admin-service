package com.trism.jesica.persistence.mysql.Entitiy.call;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbCallDayWk is a Querydsl query type for TbCallDayWk
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbCallDayWk extends EntityPathBase<TbCallDayWk> {

    private static final long serialVersionUID = -24828704L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbCallDayWk tbCallDayWk = new QTbCallDayWk("tbCallDayWk");

    public final com.trism.jesica.persistence.mysql.mappedsuper.QBaseCallWkEntity _super;

    // inherited
    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbBranchSub branch;

    //inherited
    public final NumberPath<Integer> branchNo;

    //inherited
    public final NumberPath<Long> callWkNo;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> cancelDate;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> dlvyAccDate;

    //inherited
    public final NumberPath<Integer> dlvyNo;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> finishDate;

    // inherited
    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbHeadSub head;

    //inherited
    public final NumberPath<Integer> headNo;

    //inherited
    public final NumberPath<Long> orderNo;

    //inherited
    public final StringPath orderStatusCode;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> pickupDate;

    //inherited
    public final NumberPath<Integer> relayStep;

    // inherited
    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbStoreSub store;

    //inherited
    public final NumberPath<Integer> storeNo;

    //inherited
    public final StringPath workerName;

    //inherited
    public final NumberPath<Integer> workerNo;

    public QTbCallDayWk(String variable) {
        this(TbCallDayWk.class, forVariable(variable), INITS);
    }

    public QTbCallDayWk(Path<? extends TbCallDayWk> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbCallDayWk(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbCallDayWk(PathMetadata metadata, PathInits inits) {
        this(TbCallDayWk.class, metadata, inits);
    }

    public QTbCallDayWk(Class<? extends TbCallDayWk> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this._super = new com.trism.jesica.persistence.mysql.mappedsuper.QBaseCallWkEntity(type, metadata, inits);
        this.branch = _super.branch;
        this.branchNo = _super.branchNo;
        this.callWkNo = _super.callWkNo;
        this.cancelDate = _super.cancelDate;
        this.dlvyAccDate = _super.dlvyAccDate;
        this.dlvyNo = _super.dlvyNo;
        this.finishDate = _super.finishDate;
        this.head = _super.head;
        this.headNo = _super.headNo;
        this.orderNo = _super.orderNo;
        this.orderStatusCode = _super.orderStatusCode;
        this.pickupDate = _super.pickupDate;
        this.relayStep = _super.relayStep;
        this.store = _super.store;
        this.storeNo = _super.storeNo;
        this.workerName = _super.workerName;
        this.workerNo = _super.workerNo;
    }

}

