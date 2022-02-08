package com.trism.jesica.persistence.Entitiy.call;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbCallAll is a Querydsl query type for TbCallAll
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbCallAll extends EntityPathBase<TbCallAll> {

    private static final long serialVersionUID = -181366235L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbCallAll tbCallAll = new QTbCallAll("tbCallAll");

    public final com.trism.jesica.persistence.mappedsuper.QBaseCallEntity _super;

    //inherited
    public final StringPath airportDriveYn;

    public final QTbCallAllExtra callExtra;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> cancelDate;

    //inherited
    public final NumberPath<Integer> custNo;

    //inherited
    public final StringPath custTel;

    //inherited
    public final NumberPath<java.math.BigDecimal> departLat;

    //inherited
    public final NumberPath<java.math.BigDecimal> departLng;

    //inherited
    public final StringPath departPoi;

    //inherited
    public final StringPath destAddr3;

    //inherited
    public final StringPath destAddr4;

    //inherited
    public final NumberPath<java.math.BigDecimal> destLat;

    //inherited
    public final NumberPath<java.math.BigDecimal> destLng;

    //inherited
    public final StringPath destPoi;

    //inherited
    public final NumberPath<Integer> discountAmt;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> dlvyAccDate;

    //inherited
    public final NumberPath<Integer> dlvyAmt;

    //inherited
    public final NumberPath<Integer> dlvyDistance;

    //inherited
    public final NumberPath<Integer> dlvyExtraCharge;

    //inherited
    public final NumberPath<Integer> dlvyNo;

    //inherited
    public final NumberPath<Integer> dlvyPenaltyAmt;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> dlvyReqDate;

    //inherited
    public final NumberPath<Integer> dlvyTotalAmt;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> finishDate;

    //inherited
    public final StringPath goodsName;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate;

    //inherited
    public final NumberPath<Integer> isMask;

    //inherited
    public final NumberPath<Integer> isMember;

    //inherited
    public final NumberPath<Integer> orderAmt;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> orderDate;

    //inherited
    public final NumberPath<Long> orderNo;

    //inherited
    public final StringPath orderPayStatus;

    //inherited
    public final StringPath orderStatusCode;

    //inherited
    public final StringPath orderTypeCode;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> pickupDate;

    //inherited
    public final NumberPath<Integer> serviceAmt;

    // inherited
    public final com.trism.jesica.persistence.Entitiy.business.QTbStoreSub store;

    //inherited
    public final StringPath storeName;

    //inherited
    public final NumberPath<Integer> storeNo;

    //inherited
    public final StringPath storeTel;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate;

    //inherited
    public final NumberPath<Integer> updateScn;

    //inherited
    public final StringPath workerName;

    //inherited
    public final NumberPath<Integer> workerNo;

    //inherited
    public final StringPath workerTel;

    public QTbCallAll(String variable) {
        this(TbCallAll.class, forVariable(variable), INITS);
    }

    public QTbCallAll(Path<? extends TbCallAll> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbCallAll(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbCallAll(PathMetadata metadata, PathInits inits) {
        this(TbCallAll.class, metadata, inits);
    }

    public QTbCallAll(Class<? extends TbCallAll> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this._super = new com.trism.jesica.persistence.mappedsuper.QBaseCallEntity(type, metadata, inits);
        this.airportDriveYn = _super.airportDriveYn;
        this.callExtra = inits.isInitialized("callExtra") ? new QTbCallAllExtra(forProperty("callExtra"), inits.get("callExtra")) : null;
        this.cancelDate = _super.cancelDate;
        this.custNo = _super.custNo;
        this.custTel = _super.custTel;
        this.departLat = _super.departLat;
        this.departLng = _super.departLng;
        this.departPoi = _super.departPoi;
        this.destAddr3 = _super.destAddr3;
        this.destAddr4 = _super.destAddr4;
        this.destLat = _super.destLat;
        this.destLng = _super.destLng;
        this.destPoi = _super.destPoi;
        this.discountAmt = _super.discountAmt;
        this.dlvyAccDate = _super.dlvyAccDate;
        this.dlvyAmt = _super.dlvyAmt;
        this.dlvyDistance = _super.dlvyDistance;
        this.dlvyExtraCharge = _super.dlvyExtraCharge;
        this.dlvyNo = _super.dlvyNo;
        this.dlvyPenaltyAmt = _super.dlvyPenaltyAmt;
        this.dlvyReqDate = _super.dlvyReqDate;
        this.dlvyTotalAmt = _super.dlvyTotalAmt;
        this.finishDate = _super.finishDate;
        this.goodsName = _super.goodsName;
        this.insertDate = _super.insertDate;
        this.isMask = _super.isMask;
        this.isMember = _super.isMember;
        this.orderAmt = _super.orderAmt;
        this.orderDate = _super.orderDate;
        this.orderNo = _super.orderNo;
        this.orderPayStatus = _super.orderPayStatus;
        this.orderStatusCode = _super.orderStatusCode;
        this.orderTypeCode = _super.orderTypeCode;
        this.pickupDate = _super.pickupDate;
        this.serviceAmt = _super.serviceAmt;
        this.store = _super.store;
        this.storeName = _super.storeName;
        this.storeNo = _super.storeNo;
        this.storeTel = _super.storeTel;
        this.updateDate = _super.updateDate;
        this.updateScn = _super.updateScn;
        this.workerName = _super.workerName;
        this.workerNo = _super.workerNo;
        this.workerTel = _super.workerTel;
    }

}

