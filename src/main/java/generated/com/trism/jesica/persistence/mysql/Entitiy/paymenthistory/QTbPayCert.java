package com.trism.jesica.persistence.mysql.Entitiy.paymenthistory;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbPayCert is a Querydsl query type for TbPayCert
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbPayCert extends EntityPathBase<TbPayCert> {

    private static final long serialVersionUID = 2117266922L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbPayCert tbPayCert = new QTbPayCert("tbPayCert");

    public final com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity _super = new com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity(this);

    public final NumberPath<Integer> amount = createNumber("amount", Integer.class);

    public final com.trism.jesica.persistence.mysql.Entitiy.cust.QTbCustSub cust;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final NumberPath<Long> orderNo = createNumber("orderNo", Long.class);

    public final StringPath reqUrl = createString("reqUrl");

    public final StringPath rmesg1 = createString("rmesg1");

    public final EnumPath<com.trism.jesica.persistence.mysql.type.ServiceType> serviceType = createEnum("serviceType", com.trism.jesica.persistence.mysql.type.ServiceType.class);

    public final StringPath status = createString("status");

    public final QTbPayApproval tbPayApproval;

    public final StringPath tid = createString("tid");

    public QTbPayCert(String variable) {
        this(TbPayCert.class, forVariable(variable), INITS);
    }

    public QTbPayCert(Path<? extends TbPayCert> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbPayCert(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbPayCert(PathMetadata metadata, PathInits inits) {
        this(TbPayCert.class, metadata, inits);
    }

    public QTbPayCert(Class<? extends TbPayCert> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.cust = inits.isInitialized("cust") ? new com.trism.jesica.persistence.mysql.Entitiy.cust.QTbCustSub(forProperty("cust")) : null;
        this.tbPayApproval = inits.isInitialized("tbPayApproval") ? new QTbPayApproval(forProperty("tbPayApproval"), inits.get("tbPayApproval")) : null;
    }

}

