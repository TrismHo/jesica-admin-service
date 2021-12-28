package com.trism.jesica.persistence.Entitiy.cust;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbCustAddr is a Querydsl query type for TbCustAddr
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbCustAddr extends EntityPathBase<TbCustAddr> {

    private static final long serialVersionUID = 1203172941L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbCustAddr tbCustAddr = new QTbCustAddr("tbCustAddr");

    public final com.trism.jesica.persistence.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.core.entity.QBaseEntity(this);

    public final StringPath addr1 = createString("addr1");

    public final StringPath addr2 = createString("addr2");

    public final StringPath addr3 = createString("addr3");

    public final StringPath addr4 = createString("addr4");

    public final StringPath addr5 = createString("addr5");

    public final StringPath addrName = createString("addrName");

    public final QTbCust cust;

    public final NumberPath<Long> custAddrNo = createNumber("custAddrNo", Long.class);

    public final EnumPath<com.trism.jesica.persistence.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.type.DataStatus.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final NumberPath<java.math.BigDecimal> lat = createNumber("lat", java.math.BigDecimal.class);

    public final NumberPath<java.math.BigDecimal> lng = createNumber("lng", java.math.BigDecimal.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    public QTbCustAddr(String variable) {
        this(TbCustAddr.class, forVariable(variable), INITS);
    }

    public QTbCustAddr(Path<? extends TbCustAddr> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbCustAddr(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbCustAddr(PathMetadata metadata, PathInits inits) {
        this(TbCustAddr.class, metadata, inits);
    }

    public QTbCustAddr(Class<? extends TbCustAddr> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.cust = inits.isInitialized("cust") ? new QTbCust(forProperty("cust"), inits.get("cust")) : null;
    }

}

