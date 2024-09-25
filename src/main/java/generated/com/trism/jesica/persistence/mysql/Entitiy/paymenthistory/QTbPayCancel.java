package com.trism.jesica.persistence.mysql.Entitiy.paymenthistory;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbPayCancel is a Querydsl query type for TbPayCancel
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbPayCancel extends EntityPathBase<TbPayCancel> {

    private static final long serialVersionUID = -1124812608L;

    public static final QTbPayCancel tbPayCancel = new QTbPayCancel("tbPayCancel");

    public final com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity _super = new com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity(this);

    public final StringPath cancelDate = createString("cancelDate");

    public final NumberPath<Long> cancelNo = createNumber("cancelNo", Long.class);

    public final StringPath cancelTime = createString("cancelTime");

    public final StringPath clientIp = createString("clientIp");

    public final StringPath cshrCancelNum = createString("cshrCancelNum");

    public final StringPath hashData = createString("hashData");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath mid = createString("mid");

    public final StringPath msg = createString("msg");

    public final NumberPath<Long> orderNo = createNumber("orderNo", Long.class);

    public final StringPath partialRefundTid = createString("partialRefundTid");

    public final StringPath payMethod = createString("payMethod");

    public final NumberPath<Integer> price = createNumber("price", Integer.class);

    public final NumberPath<Integer> prtcCnt = createNumber("prtcCnt", Integer.class);

    public final NumberPath<Integer> prtcType = createNumber("prtcType", Integer.class);

    public final NumberPath<Integer> remainPrice = createNumber("remainPrice", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> reqDate = createDateTime("reqDate", java.time.LocalDateTime.class);

    public final StringPath resultCode = createString("resultCode");

    public final StringPath resultMsg = createString("resultMsg");

    public final EnumPath<com.trism.jesica.persistence.mysql.type.ServiceType> serviceType = createEnum("serviceType", com.trism.jesica.persistence.mysql.type.ServiceType.class);

    public final StringPath tid = createString("tid");

    public QTbPayCancel(String variable) {
        super(TbPayCancel.class, forVariable(variable));
    }

    public QTbPayCancel(Path<? extends TbPayCancel> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbPayCancel(PathMetadata metadata) {
        super(TbPayCancel.class, metadata);
    }

}

