package com.trism.jesica.persistence.mysql.Entitiy.manna;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbMannaOrder is a Querydsl query type for TbMannaOrder
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbMannaOrder extends EntityPathBase<TbMannaOrder> {

    private static final long serialVersionUID = -794135492L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbMannaOrder tbMannaOrder = new QTbMannaOrder("tbMannaOrder");

    public final NumberPath<Long> adultCnt = createNumber("adultCnt", Long.class);

    public final NumberPath<Long> arrTime = createNumber("arrTime", Long.class);

    public final StringPath brCode = createString("brCode");

    public final DateTimePath<java.time.LocalDateTime> cancelDate = createDateTime("cancelDate", java.time.LocalDateTime.class);

    public final StringPath cancelMemo = createString("cancelMemo");

    public final StringPath chargeType = createString("chargeType");

    public final NumberPath<Long> childCnt = createNumber("childCnt", Long.class);

    public final NumberPath<Long> couponAmt = createNumber("couponAmt", Long.class);

    public final StringPath couponTitle = createString("couponTitle");

    public final DateTimePath<java.time.LocalDateTime> cthDate = createDateTime("cthDate", java.time.LocalDateTime.class);

    public final StringPath cthWkName = createString("cthWkName");

    public final StringPath cthWkTel = createString("cthWkTel");

    public final NumberPath<Integer> dataStatus = createNumber("dataStatus", Integer.class);

    public final NumberPath<java.math.BigDecimal> dvryDistance = createNumber("dvryDistance", java.math.BigDecimal.class);

    public final StringPath dvryServiceType = createString("dvryServiceType");

    public final StringPath eaAddr4 = createString("eaAddr4");

    public final StringPath eaAddr5 = createString("eaAddr5");

    public final StringPath eaAddr6 = createString("eaAddr6");

    public final StringPath eaLatY = createString("eaLatY");

    public final StringPath eaLngX = createString("eaLngX");

    public final DateTimePath<java.time.LocalDateTime> endDate = createDateTime("endDate", java.time.LocalDateTime.class);

    public final NumberPath<Long> eventAmt = createNumber("eventAmt", Long.class);

    public final NumberPath<Long> extCouponNo = createNumber("extCouponNo", Long.class);

    public final StringPath goodsName = createString("goodsName");

    public final StringPath masterStCode = createString("masterStCode");

    public final DateTimePath<java.time.LocalDateTime> modDate = createDateTime("modDate", java.time.LocalDateTime.class);

    public final NumberPath<Long> ordAmt = createNumber("ordAmt", Long.class);

    public final StringPath ordConfirmType = createString("ordConfirmType");

    public final StringPath ordCuName = createString("ordCuName");

    public final StringPath ordCuStMemo = createString("ordCuStMemo");

    public final StringPath ordCuTel = createString("ordCuTel");

    public final StringPath ordCuWkMemo = createString("ordCuWkMemo");

    public final DateTimePath<java.time.LocalDateTime> ordDate = createDateTime("ordDate", java.time.LocalDateTime.class);

    public final NumberPath<Long> ordNo = createNumber("ordNo", Long.class);

    public final StringPath ordPathCd = createString("ordPathCd");

    public final NumberPath<Integer> ordStatus = createNumber("ordStatus", Integer.class);

    public final StringPath ordStCode = createString("ordStCode");

    public final NumberPath<Long> ordStWaitNo = createNumber("ordStWaitNo", Long.class);

    public final StringPath ordType = createString("ordType");

    public final NumberPath<Long> payAmt = createNumber("payAmt", Long.class);

    public final StringPath payType = createString("payType");

    public final DateTimePath<java.time.LocalDateTime> pickupDate = createDateTime("pickupDate", java.time.LocalDateTime.class);

    public final NumberPath<Long> pointUseAmt = createNumber("pointUseAmt", Long.class);

    public final NumberPath<Long> recommCustNo = createNumber("recommCustNo", Long.class);

    public final NumberPath<Long> recommRewardAmt = createNumber("recommRewardAmt", Long.class);

    public final NumberPath<Integer> recommRewardStatus = createNumber("recommRewardStatus", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> resvDate = createDateTime("resvDate", java.time.LocalDateTime.class);

    public final NumberPath<Long> srvAmt = createNumber("srvAmt", Long.class);

    public final StringPath stImage = createString("stImage");

    public final StringPath stName = createString("stName");

    public final StringPath stTel = createString("stTel");

    public final NumberPath<Long> tableNo = createNumber("tableNo", Long.class);

    public final StringPath tableType = createString("tableType");

    public final StringPath takeoutDate = createString("takeoutDate");

    public final com.trism.jesica.persistence.mysql.Entitiy.cust.QTbCust tbCust;

    public final StringPath totalUseCount = createString("totalUseCount");

    public QTbMannaOrder(String variable) {
        this(TbMannaOrder.class, forVariable(variable), INITS);
    }

    public QTbMannaOrder(Path<? extends TbMannaOrder> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbMannaOrder(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbMannaOrder(PathMetadata metadata, PathInits inits) {
        this(TbMannaOrder.class, metadata, inits);
    }

    public QTbMannaOrder(Class<? extends TbMannaOrder> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.tbCust = inits.isInitialized("tbCust") ? new com.trism.jesica.persistence.mysql.Entitiy.cust.QTbCust(forProperty("tbCust"), inits.get("tbCust")) : null;
    }

}

