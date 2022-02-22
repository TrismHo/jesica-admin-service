package com.trism.jesica.persistence.Entitiy.coupon;

import com.querydsl.core.types.Path;
import com.querydsl.core.types.PathMetadata;
import com.querydsl.core.types.dsl.DateTimePath;
import com.querydsl.core.types.dsl.EntityPathBase;
import com.querydsl.core.types.dsl.NumberPath;
import com.querydsl.core.types.dsl.StringPath;

import javax.annotation.Generated;

import static com.querydsl.core.types.PathMetadataFactory.forVariable;


/**
 * QTbCouponPublish is a Querydsl query type for TbCouponPublish
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbCouponPublish extends EntityPathBase<TbCouponPublish> {

    private static final long serialVersionUID = 279353875L;

    public static final QTbCouponPublish tbCouponPublish = new QTbCouponPublish("tbCouponPublish");

    public final NumberPath<Integer> couponNo = createNumber("couponNo", Integer.class);

    public final NumberPath<Integer> custNo = createNumber("custNo", Integer.class);

    public final NumberPath<Integer> dateStatus = createNumber("dateStatus", Integer.class);

    public final NumberPath<Integer> dcAmt = createNumber("dcAmt", Integer.class);

    public final NumberPath<Integer> dcRateType = createNumber("dcRateType", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> expireDate = createDateTime("expireDate", java.time.LocalDateTime.class);

    public final DateTimePath<java.time.LocalDateTime> insertDate = createDateTime("insertDate", java.time.LocalDateTime.class);

    public final NumberPath<Integer> maxDcAmt = createNumber("maxDcAmt", Integer.class);

    public final NumberPath<Integer> minPayAmt = createNumber("minPayAmt", Integer.class);

    public final StringPath orderTypeCode = createString("orderTypeCode");

    public final NumberPath<Long> publishNo = createNumber("publishNo", Long.class);

    public final NumberPath<Integer> serviceType = createNumber("serviceType", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> useDate = createDateTime("useDate", java.time.LocalDateTime.class);

    public final NumberPath<Integer> useYn = createNumber("useYn", Integer.class);

    public QTbCouponPublish(String variable) {
        super(TbCouponPublish.class, forVariable(variable));
    }

    public QTbCouponPublish(Path<? extends TbCouponPublish> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbCouponPublish(PathMetadata metadata) {
        super(TbCouponPublish.class, metadata);
    }

}

