package com.trism.jesica.persistence.Entitiy.paymenthistory;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbPayApproval is a Querydsl query type for TbPayApproval
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbPayApproval extends EntityPathBase<TbPayApproval> {

    private static final long serialVersionUID = -1500396739L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbPayApproval tbPayApproval = new QTbPayApproval("tbPayApproval");

    public final NumberPath<Integer> amount = createNumber("amount", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> authDtm = createDateTime("authDtm", java.time.LocalDateTime.class);

    public final StringPath certTid = createString("certTid");

    public final com.trism.jesica.persistence.Entitiy.cust.QTbCustSub cust;

    public final NumberPath<Long> custNo = createNumber("custNo", Long.class);

    public final StringPath memberName = createString("memberName");

    public final StringPath mid = createString("mid");

    public final StringPath noti = createString("noti");

    public final NumberPath<Long> orderNo = createNumber("orderNo", Long.class);

    public final QTbPayCardData payCardData;

    public final StringPath payType = createString("payType");

    public final StringPath rmesg1 = createString("rmesg1");

    public final EnumPath<com.trism.jesica.persistence.type.ServiceType> serviceType = createEnum("serviceType", com.trism.jesica.persistence.type.ServiceType.class);

    public final StringPath status = createString("status");

    public final com.trism.jesica.persistence.Entitiy.business.QTbStore store;

    public final NumberPath<Long> storeNo = createNumber("storeNo", Long.class);

    public final StringPath tid = createString("tid");

    public final StringPath userName = createString("userName");

    public QTbPayApproval(String variable) {
        this(TbPayApproval.class, forVariable(variable), INITS);
    }

    public QTbPayApproval(Path<? extends TbPayApproval> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbPayApproval(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbPayApproval(PathMetadata metadata, PathInits inits) {
        this(TbPayApproval.class, metadata, inits);
    }

    public QTbPayApproval(Class<? extends TbPayApproval> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.cust = inits.isInitialized("cust") ? new com.trism.jesica.persistence.Entitiy.cust.QTbCustSub(forProperty("cust")) : null;
        this.payCardData = inits.isInitialized("payCardData") ? new QTbPayCardData(forProperty("payCardData")) : null;
        this.store = inits.isInitialized("store") ? new com.trism.jesica.persistence.Entitiy.business.QTbStore(forProperty("store"), inits.get("store")) : null;
    }

}

