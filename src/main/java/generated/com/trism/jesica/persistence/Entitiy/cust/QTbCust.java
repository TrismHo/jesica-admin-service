package com.trism.jesica.persistence.Entitiy.cust;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbCust is a Querydsl query type for TbCust
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbCust extends EntityPathBase<TbCust> {

    private static final long serialVersionUID = -1323539396L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbCust tbCust = new QTbCust("tbCust");

    public final com.trism.jesica.persistence.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.core.entity.QBaseEntity(this);

    public final NumberPath<Integer> accPoint = createNumber("accPoint", Integer.class);

    public final NumberPath<Integer> cash = createNumber("cash", Integer.class);

    public final QTbCustAddr custAddr;

    public final ListPath<TbCustAddr, QTbCustAddr> custAddrs = this.<TbCustAddr, QTbCustAddr>createList("custAddrs", TbCustAddr.class, QTbCustAddr.class, PathInits.DIRECT2);

    public final ListPath<TbCustDevice, QTbCustDevice> custDevices = this.<TbCustDevice, QTbCustDevice>createList("custDevices", TbCustDevice.class, QTbCustDevice.class, PathInits.DIRECT2);

    public final ListPath<TbCustFavorite, QTbCustFavorite> custFavorites = this.<TbCustFavorite, QTbCustFavorite>createList("custFavorites", TbCustFavorite.class, QTbCustFavorite.class, PathInits.DIRECT2);

    public final StringPath custName = createString("custName");

    public final NumberPath<Long> custNo = createNumber("custNo", Long.class);

    public final StringPath custTel = createString("custTel");

    public final EnumPath<com.trism.jesica.persistence.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.type.DataStatus.class);

    public final NumberPath<Long> extCustNo = createNumber("extCustNo", Long.class);

    public final StringPath extRecommStCode = createString("extRecommStCode");

    public final StringPath extRecommStName = createString("extRecommStName");

    public final EnumPath<com.trism.jesica.persistence.type.GenderType> gender = createEnum("gender", com.trism.jesica.persistence.type.GenderType.class);

    public final DateTimePath<java.time.LocalDateTime> insertDate = createDateTime("insertDate", java.time.LocalDateTime.class);

    public final NumberPath<Integer> isMember = createNumber("isMember", Integer.class);

    public final StringPath loginId = createString("loginId");

    public final StringPath loginPwd = createString("loginPwd");

    public final NumberPath<Integer> mileage = createNumber("mileage", Integer.class);

    public final NumberPath<Integer> platformType = createNumber("platformType", Integer.class);

    public final NumberPath<Integer> point = createNumber("point", Integer.class);

    public final NumberPath<Integer> pushMarketingYn = createNumber("pushMarketingYn", Integer.class);

    public final NumberPath<Integer> pushNoticeYn = createNumber("pushNoticeYn", Integer.class);

    public final NumberPath<Integer> pushOrderYn = createNumber("pushOrderYn", Integer.class);

    public final NumberPath<Integer> smsYn = createNumber("smsYn", Integer.class);

    public final StringPath snsToken1 = createString("snsToken1");

    public final StringPath snsToken2 = createString("snsToken2");

    public final DateTimePath<java.time.LocalDateTime> updateDate = createDateTime("updateDate", java.time.LocalDateTime.class);

    public final NumberPath<Integer> useCount = createNumber("useCount", Integer.class);

    public QTbCust(String variable) {
        this(TbCust.class, forVariable(variable), INITS);
    }

    public QTbCust(Path<? extends TbCust> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbCust(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbCust(PathMetadata metadata, PathInits inits) {
        this(TbCust.class, metadata, inits);
    }

    public QTbCust(Class<? extends TbCust> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.custAddr = inits.isInitialized("custAddr") ? new QTbCustAddr(forProperty("custAddr"), inits.get("custAddr")) : null;
    }

}

