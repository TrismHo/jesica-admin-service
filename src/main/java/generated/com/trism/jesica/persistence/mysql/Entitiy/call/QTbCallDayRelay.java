package com.trism.jesica.persistence.mysql.Entitiy.call;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbCallDayRelay is a Querydsl query type for TbCallDayRelay
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbCallDayRelay extends EntityPathBase<TbCallDayRelay> {

    private static final long serialVersionUID = -942235387L;

    public static final QTbCallDayRelay tbCallDayRelay = new QTbCallDayRelay("tbCallDayRelay");

    public final com.trism.jesica.persistence.mysql.mappedsuper.QBaseCallRelayEntity _super = new com.trism.jesica.persistence.mysql.mappedsuper.QBaseCallRelayEntity(this);

    //inherited
    public final StringPath departAddr1 = _super.departAddr1;

    //inherited
    public final StringPath departAddr2 = _super.departAddr2;

    //inherited
    public final StringPath departAddr3 = _super.departAddr3;

    //inherited
    public final StringPath departAddr4 = _super.departAddr4;

    //inherited
    public final StringPath departAddr5 = _super.departAddr5;

    //inherited
    public final NumberPath<java.math.BigDecimal> departLat = _super.departLat;

    //inherited
    public final NumberPath<java.math.BigDecimal> departLng = _super.departLng;

    //inherited
    public final StringPath departMemo = _super.departMemo;

    //inherited
    public final NumberPath<Integer> departPlaceType = _super.departPlaceType;

    //inherited
    public final StringPath departPoi = _super.departPoi;

    //inherited
    public final StringPath departTel = _super.departTel;

    //inherited
    public final StringPath destAddr1 = _super.destAddr1;

    //inherited
    public final StringPath destAddr2 = _super.destAddr2;

    //inherited
    public final StringPath destAddr3 = _super.destAddr3;

    //inherited
    public final StringPath destAddr4 = _super.destAddr4;

    //inherited
    public final StringPath destAddr5 = _super.destAddr5;

    //inherited
    public final NumberPath<java.math.BigDecimal> destLat = _super.destLat;

    //inherited
    public final NumberPath<java.math.BigDecimal> destLng = _super.destLng;

    //inherited
    public final StringPath destMemo = _super.destMemo;

    //inherited
    public final NumberPath<Integer> destPlaceType = _super.destPlaceType;

    //inherited
    public final StringPath destPoi = _super.destPoi;

    //inherited
    public final StringPath destTel = _super.destTel;

    //inherited
    public final NumberPath<Integer> dlvyAmt = _super.dlvyAmt;

    //inherited
    public final NumberPath<Integer> dlvyDistance = _super.dlvyDistance;

    //inherited
    public final NumberPath<Integer> dlvyExtraCharge = _super.dlvyExtraCharge;

    //inherited
    public final NumberPath<Integer> dlvyPenaltyAmt = _super.dlvyPenaltyAmt;

    //inherited
    public final NumberPath<Integer> dlvyTotalAmt = _super.dlvyTotalAmt;

    //inherited
    public final NumberPath<Long> orderNo = _super.orderNo;

    //inherited
    public final NumberPath<Long> relayStep = _super.relayStep;

    //inherited
    public final NumberPath<java.math.BigDecimal> viaLat = _super.viaLat;

    //inherited
    public final NumberPath<java.math.BigDecimal> viaLng = _super.viaLng;

    //inherited
    public final NumberPath<Integer> viaPlaceType = _super.viaPlaceType;

    //inherited
    public final StringPath viaPoi = _super.viaPoi;

    public QTbCallDayRelay(String variable) {
        super(TbCallDayRelay.class, forVariable(variable));
    }

    public QTbCallDayRelay(Path<? extends TbCallDayRelay> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbCallDayRelay(PathMetadata metadata) {
        super(TbCallDayRelay.class, metadata);
    }

}

