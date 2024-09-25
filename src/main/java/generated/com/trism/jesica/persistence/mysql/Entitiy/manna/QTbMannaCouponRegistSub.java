package com.trism.jesica.persistence.mysql.Entitiy.manna;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbMannaCouponRegistSub is a Querydsl query type for TbMannaCouponRegistSub
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbMannaCouponRegistSub extends EntityPathBase<TbMannaCouponRegistSub> {

    private static final long serialVersionUID = 254972114L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbMannaCouponRegistSub tbMannaCouponRegistSub = new QTbMannaCouponRegistSub("tbMannaCouponRegistSub");

    public final com.trism.jesica.persistence.mysql.Entitiy.cust.QTbCustName cust;

    public final NumberPath<Long> publishNo = createNumber("publishNo", Long.class);

    public final NumberPath<Long> regCpnNo = createNumber("regCpnNo", Long.class);

    public final NumberPath<Long> regCustNo = createNumber("regCustNo", Long.class);

    public final StringPath regCustTel = createString("regCustTel");

    public final DateTimePath<java.time.LocalDateTime> regDate = createDateTime("regDate", java.time.LocalDateTime.class);

    public final NumberPath<Long> registNo = createNumber("registNo", Long.class);

    public QTbMannaCouponRegistSub(String variable) {
        this(TbMannaCouponRegistSub.class, forVariable(variable), INITS);
    }

    public QTbMannaCouponRegistSub(Path<? extends TbMannaCouponRegistSub> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbMannaCouponRegistSub(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbMannaCouponRegistSub(PathMetadata metadata, PathInits inits) {
        this(TbMannaCouponRegistSub.class, metadata, inits);
    }

    public QTbMannaCouponRegistSub(Class<? extends TbMannaCouponRegistSub> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.cust = inits.isInitialized("cust") ? new com.trism.jesica.persistence.mysql.Entitiy.cust.QTbCustName(forProperty("cust")) : null;
    }

}

