package com.trism.jesica.persistence.mysql.Entitiy.coupon;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbCoupon is a Querydsl query type for TbCoupon
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbCoupon extends EntityPathBase<TbCoupon> {

    private static final long serialVersionUID = 1224829968L;

    public static final QTbCoupon tbCoupon = new QTbCoupon("tbCoupon");

    public final com.trism.jesica.persistence.mysql.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.mysql.core.entity.QBaseEntity(this);

    public final StringPath body = createString("body");

    public final StringPath couponCode = createString("couponCode");

    public final NumberPath<Long> couponNo = createNumber("couponNo", Long.class);

    public final NumberPath<Integer> dataStatus = createNumber("dataStatus", Integer.class);

    public final NumberPath<Integer> dcAmt = createNumber("dcAmt", Integer.class);

    public final NumberPath<Integer> dcRateType = createNumber("dcRateType", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> expireDate = createDateTime("expireDate", java.time.LocalDateTime.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath insertUserId = createString("insertUserId");

    public final NumberPath<Integer> maxDcAmt = createNumber("maxDcAmt", Integer.class);

    public final NumberPath<Integer> maxPublishCount = createNumber("maxPublishCount", Integer.class);

    public final NumberPath<Integer> minPayAmt = createNumber("minPayAmt", Integer.class);

    public final NumberPath<Integer> multiPublishCount = createNumber("multiPublishCount", Integer.class);

    public final StringPath orderTypeCode = createString("orderTypeCode");

    public final NumberPath<Integer> publishCount = createNumber("publishCount", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> publishEndDate = createDateTime("publishEndDate", java.time.LocalDateTime.class);

    public final DateTimePath<java.time.LocalDateTime> publishStartDate = createDateTime("publishStartDate", java.time.LocalDateTime.class);

    public final NumberPath<Integer> serviceType = createNumber("serviceType", Integer.class);

    public final StringPath title = createString("title");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    public final StringPath updateUserId = createString("updateUserId");

    public final NumberPath<Integer> validDay = createNumber("validDay", Integer.class);

    public final NumberPath<Integer> validityType = createNumber("validityType", Integer.class);

    public QTbCoupon(String variable) {
        super(TbCoupon.class, forVariable(variable));
    }

    public QTbCoupon(Path<? extends TbCoupon> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbCoupon(PathMetadata metadata) {
        super(TbCoupon.class, metadata);
    }

}

