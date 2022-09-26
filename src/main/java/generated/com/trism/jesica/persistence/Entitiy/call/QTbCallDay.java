package com.trism.jesica.persistence.Entitiy.call;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbCallDay is a Querydsl query type for TbCallDay
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbCallDay extends EntityPathBase<TbCallDay> {

    private static final long serialVersionUID = -181363680L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbCallDay tbCallDay = new QTbCallDay("tbCallDay");

    public final com.trism.jesica.persistence.mappedsuper.QBaseOrderEntity _super;

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
    public final DateTimePath<java.time.LocalDateTime> dlvyArrDate;

    //inherited
    public final NumberPath<Integer> dlvyCancelTime;

    //inherited
    public final NumberPath<Integer> dlvyCnt;

    //inherited
    public final NumberPath<Integer> dlvyDistance;

    //inherited
    public final NumberPath<Integer> dlvyExtraCharge;

    //inherited
    public final NumberPath<Integer> dlvyNo;

    //inherited
    public final EnumPath<com.trism.jesica.persistence.type.DlvyPayMethodType> dlvyPayMethod;

    //inherited
    public final NumberPath<Integer> dlvyPenaltyAmt;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> dlvyReqDate;

    //inherited
    public final NumberPath<Long> exOrderNo;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> expectArrTime;

    //inherited
    public final StringPath exStoreCd;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> finishDate;

    //inherited
    public final StringPath goodsName;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate;

    //inherited
    public final NumberPath<Integer> orderAmt;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> orderDate;

    public final CollectionPath<com.trism.jesica.persistence.Entitiy.order.TbOrderDayHistory, com.trism.jesica.persistence.Entitiy.order.QTbOrderDayHistory> orderHistories = this.<com.trism.jesica.persistence.Entitiy.order.TbOrderDayHistory, com.trism.jesica.persistence.Entitiy.order.QTbOrderDayHistory>createCollection("orderHistories", com.trism.jesica.persistence.Entitiy.order.TbOrderDayHistory.class, com.trism.jesica.persistence.Entitiy.order.QTbOrderDayHistory.class, PathInits.DIRECT2);

    //inherited
    public final NumberPath<Long> orderNo;

    //inherited
    public final StringPath orderPathCode;

    //inherited
    public final StringPath orderStatusCode;

    //inherited
    public final StringPath orderTypeCode;

    //inherited
    public final EnumPath<com.trism.jesica.persistence.type.PayMethodType> payMethod;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> pickupDate;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> readyDate;

    //inherited
    public final NumberPath<Integer> readyTime;

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
    public final DateTimePath<java.time.LocalDateTime> takeoutDate;

    //inherited
    public final BooleanPath takeoutYn;

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

    public QTbCallDay(String variable) {
        this(TbCallDay.class, forVariable(variable), INITS);
    }

    public QTbCallDay(Path<? extends TbCallDay> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbCallDay(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbCallDay(PathMetadata metadata, PathInits inits) {
        this(TbCallDay.class, metadata, inits);
    }

    public QTbCallDay(Class<? extends TbCallDay> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this._super = new com.trism.jesica.persistence.mappedsuper.QBaseOrderEntity(type, metadata, inits);
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
        this.dlvyArrDate = _super.dlvyArrDate;
        this.dlvyCancelTime = _super.dlvyCancelTime;
        this.dlvyCnt = _super.dlvyCnt;
        this.dlvyDistance = _super.dlvyDistance;
        this.dlvyExtraCharge = _super.dlvyExtraCharge;
        this.dlvyNo = _super.dlvyNo;
        this.dlvyPayMethod = _super.dlvyPayMethod;
        this.dlvyPenaltyAmt = _super.dlvyPenaltyAmt;
        this.dlvyReqDate = _super.dlvyReqDate;
        this.exOrderNo = _super.exOrderNo;
        this.expectArrTime = _super.expectArrTime;
        this.exStoreCd = _super.exStoreCd;
        this.finishDate = _super.finishDate;
        this.goodsName = _super.goodsName;
        this.insertDate = _super.insertDate;
        this.orderAmt = _super.orderAmt;
        this.orderDate = _super.orderDate;
        this.orderNo = _super.orderNo;
        this.orderPathCode = _super.orderPathCode;
        this.orderStatusCode = _super.orderStatusCode;
        this.orderTypeCode = _super.orderTypeCode;
        this.payMethod = _super.payMethod;
        this.pickupDate = _super.pickupDate;
        this.readyDate = _super.readyDate;
        this.readyTime = _super.readyTime;
        this.serviceAmt = _super.serviceAmt;
        this.store = _super.store;
        this.storeName = _super.storeName;
        this.storeNo = _super.storeNo;
        this.storeTel = _super.storeTel;
        this.takeoutDate = _super.takeoutDate;
        this.takeoutYn = _super.takeoutYn;
        this.updateDate = _super.updateDate;
        this.updateScn = _super.updateScn;
        this.workerName = _super.workerName;
        this.workerNo = _super.workerNo;
        this.workerTel = _super.workerTel;
    }

}

