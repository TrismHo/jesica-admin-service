package com.trism.jesica.persistence.mysql.Entitiy.call;

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

    private static final long serialVersionUID = 983210737L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbCallAll tbCallAll = new QTbCallAll("tbCallAll");

    public final com.trism.jesica.persistence.mysql.mappedsuper.QBaseCallEntity _super;

    //inherited
    public final NumberPath<Integer> acceptBranchNo;

    //inherited
    public final NumberPath<Integer> acceptHeadNo;

    //inherited
    public final NumberPath<Integer> acceptStoreNo;

    //inherited
    public final NumberPath<Integer> acceptStoreTel;

    //inherited
    public final NumberPath<Integer> branchNo;

    public final ListPath<TbCallAllRelay, QTbCallAllRelay> callAllRelay = this.<TbCallAllRelay, QTbCallAllRelay>createList("callAllRelay", TbCallAllRelay.class, QTbCallAllRelay.class, PathInits.DIRECT2);

    public final ListPath<TbCallAllWk, QTbCallAllWk> callAllWk = this.<TbCallAllWk, QTbCallAllWk>createList("callAllWk", TbCallAllWk.class, QTbCallAllWk.class, PathInits.DIRECT2);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> cancelDate;

    //inherited
    public final StringPath cancelMemo;

    //inherited
    public final StringPath carModel;

    //inherited
    public final StringPath carNum;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> carUseDate;

    //inherited
    public final StringPath contractName;

    //inherited
    public final StringPath contractTel;

    //inherited
    public final NumberPath<Integer> custDriverName;

    //inherited
    public final NumberPath<Integer> custDriverTel;

    //inherited
    public final StringPath custMemo;

    //inherited
    public final NumberPath<Integer> custNo;

    //inherited
    public final NumberPath<Integer> custPlaceType;

    //inherited
    public final StringPath custTel;

    //inherited
    public final StringPath custTel2;

    //inherited
    public final StringPath defaultFuel;

    //inherited
    public final NumberPath<Integer> discountAmt;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> dlvyAccDate;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> dlvyReqDate;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> finishDate;

    // inherited
    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbHead head;

    //inherited
    public final NumberPath<Integer> headNo;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate;

    //inherited
    public final NumberPath<Integer> orderAmt;

    //inherited
    public final StringPath orderCancelCode;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> orderDate;

    //inherited
    public final StringPath orderMemo;

    //inherited
    public final NumberPath<Long> orderNo;

    //inherited
    public final StringPath orderPayStatus;

    //inherited
    public final StringPath orderStatusCode;

    //inherited
    public final StringPath orderTypeCode;

    //inherited
    public final StringPath outboundFlag;

    //inherited
    public final NumberPath<Integer> passengerNum;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> pickupDate;

    //inherited
    public final NumberPath<Integer> preCheckIn;

    //inherited
    public final NumberPath<Integer> pubCouponNo;

    //inherited
    public final NumberPath<Integer> relayCnt;

    //inherited
    public final NumberPath<Integer> relayStep;

    //inherited
    public final NumberPath<Integer> rentalCarUnpaid;

    //inherited
    public final StringPath reservNum;

    //inherited
    public final NumberPath<Integer> serviceAmt;

    //inherited
    public final StringPath storeName;

    //inherited
    public final NumberPath<Integer> storeNo;

    //inherited
    public final StringPath storeTel;

    //inherited
    public final NumberPath<Integer> totalAmt;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate;

    //inherited
    public final NumberPath<Integer> updateScn;

    //inherited
    public final NumberPath<Integer> useCount;

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
        this._super = new com.trism.jesica.persistence.mysql.mappedsuper.QBaseCallEntity(type, metadata, inits);
        this.acceptBranchNo = _super.acceptBranchNo;
        this.acceptHeadNo = _super.acceptHeadNo;
        this.acceptStoreNo = _super.acceptStoreNo;
        this.acceptStoreTel = _super.acceptStoreTel;
        this.branchNo = _super.branchNo;
        this.cancelDate = _super.cancelDate;
        this.cancelMemo = _super.cancelMemo;
        this.carModel = _super.carModel;
        this.carNum = _super.carNum;
        this.carUseDate = _super.carUseDate;
        this.contractName = _super.contractName;
        this.contractTel = _super.contractTel;
        this.custDriverName = _super.custDriverName;
        this.custDriverTel = _super.custDriverTel;
        this.custMemo = _super.custMemo;
        this.custNo = _super.custNo;
        this.custPlaceType = _super.custPlaceType;
        this.custTel = _super.custTel;
        this.custTel2 = _super.custTel2;
        this.defaultFuel = _super.defaultFuel;
        this.discountAmt = _super.discountAmt;
        this.dlvyAccDate = _super.dlvyAccDate;
        this.dlvyReqDate = _super.dlvyReqDate;
        this.finishDate = _super.finishDate;
        this.head = _super.head;
        this.headNo = _super.headNo;
        this.insertDate = _super.insertDate;
        this.orderAmt = _super.orderAmt;
        this.orderCancelCode = _super.orderCancelCode;
        this.orderDate = _super.orderDate;
        this.orderMemo = _super.orderMemo;
        this.orderNo = _super.orderNo;
        this.orderPayStatus = _super.orderPayStatus;
        this.orderStatusCode = _super.orderStatusCode;
        this.orderTypeCode = _super.orderTypeCode;
        this.outboundFlag = _super.outboundFlag;
        this.passengerNum = _super.passengerNum;
        this.pickupDate = _super.pickupDate;
        this.preCheckIn = _super.preCheckIn;
        this.pubCouponNo = _super.pubCouponNo;
        this.relayCnt = _super.relayCnt;
        this.relayStep = _super.relayStep;
        this.rentalCarUnpaid = _super.rentalCarUnpaid;
        this.reservNum = _super.reservNum;
        this.serviceAmt = _super.serviceAmt;
        this.storeName = _super.storeName;
        this.storeNo = _super.storeNo;
        this.storeTel = _super.storeTel;
        this.totalAmt = _super.totalAmt;
        this.updateDate = _super.updateDate;
        this.updateScn = _super.updateScn;
        this.useCount = _super.useCount;
        this.workerName = _super.workerName;
        this.workerNo = _super.workerNo;
        this.workerTel = _super.workerTel;
    }

}

