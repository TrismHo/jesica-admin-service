package com.trism.jesica.persistence.mysql.Entitiy.manna;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbMannaCouponRegist is a Querydsl query type for TbMannaCouponRegist
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbMannaCouponRegist extends EntityPathBase<TbMannaCouponRegist> {

    private static final long serialVersionUID = -285736306L;

    public static final QTbMannaCouponRegist tbMannaCouponRegist = new QTbMannaCouponRegist("tbMannaCouponRegist");

    public final NumberPath<Long> publishNo = createNumber("publishNo", Long.class);

    public final NumberPath<Long> regCpnNo = createNumber("regCpnNo", Long.class);

    public final NumberPath<Long> regCustNo = createNumber("regCustNo", Long.class);

    public final StringPath regCustTel = createString("regCustTel");

    public final DateTimePath<java.time.LocalDateTime> regDate = createDateTime("regDate", java.time.LocalDateTime.class);

    public final NumberPath<Long> registNo = createNumber("registNo", Long.class);

    public QTbMannaCouponRegist(String variable) {
        super(TbMannaCouponRegist.class, forVariable(variable));
    }

    public QTbMannaCouponRegist(Path<? extends TbMannaCouponRegist> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbMannaCouponRegist(PathMetadata metadata) {
        super(TbMannaCouponRegist.class, metadata);
    }

}

