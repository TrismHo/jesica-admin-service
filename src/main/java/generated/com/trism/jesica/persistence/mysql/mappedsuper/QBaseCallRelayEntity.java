package com.trism.jesica.persistence.mysql.mappedsuper;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QBaseCallRelayEntity is a Querydsl query type for BaseCallRelayEntity
 */
@Generated("com.querydsl.codegen.SupertypeSerializer")
public class QBaseCallRelayEntity extends EntityPathBase<BaseCallRelayEntity> {

    private static final long serialVersionUID = -503874149L;

    public static final QBaseCallRelayEntity baseCallRelayEntity = new QBaseCallRelayEntity("baseCallRelayEntity");

    public final StringPath departAddr1 = createString("departAddr1");

    public final StringPath departAddr2 = createString("departAddr2");

    public final StringPath departAddr3 = createString("departAddr3");

    public final StringPath departAddr4 = createString("departAddr4");

    public final StringPath departAddr5 = createString("departAddr5");

    public final NumberPath<java.math.BigDecimal> departLat = createNumber("departLat", java.math.BigDecimal.class);

    public final NumberPath<java.math.BigDecimal> departLng = createNumber("departLng", java.math.BigDecimal.class);

    public final StringPath departMemo = createString("departMemo");

    public final NumberPath<Integer> departPlaceType = createNumber("departPlaceType", Integer.class);

    public final StringPath departPoi = createString("departPoi");

    public final StringPath departTel = createString("departTel");

    public final StringPath destAddr1 = createString("destAddr1");

    public final StringPath destAddr2 = createString("destAddr2");

    public final StringPath destAddr3 = createString("destAddr3");

    public final StringPath destAddr4 = createString("destAddr4");

    public final StringPath destAddr5 = createString("destAddr5");

    public final NumberPath<java.math.BigDecimal> destLat = createNumber("destLat", java.math.BigDecimal.class);

    public final NumberPath<java.math.BigDecimal> destLng = createNumber("destLng", java.math.BigDecimal.class);

    public final StringPath destMemo = createString("destMemo");

    public final NumberPath<Integer> destPlaceType = createNumber("destPlaceType", Integer.class);

    public final StringPath destPoi = createString("destPoi");

    public final StringPath destTel = createString("destTel");

    public final NumberPath<Integer> dlvyAmt = createNumber("dlvyAmt", Integer.class);

    public final NumberPath<Integer> dlvyDistance = createNumber("dlvyDistance", Integer.class);

    public final NumberPath<Integer> dlvyExtraCharge = createNumber("dlvyExtraCharge", Integer.class);

    public final NumberPath<Integer> dlvyPenaltyAmt = createNumber("dlvyPenaltyAmt", Integer.class);

    public final NumberPath<Integer> dlvyTotalAmt = createNumber("dlvyTotalAmt", Integer.class);

    public final NumberPath<Long> orderNo = createNumber("orderNo", Long.class);

    public final NumberPath<Long> relayStep = createNumber("relayStep", Long.class);

    public final NumberPath<java.math.BigDecimal> viaLat = createNumber("viaLat", java.math.BigDecimal.class);

    public final NumberPath<java.math.BigDecimal> viaLng = createNumber("viaLng", java.math.BigDecimal.class);

    public final NumberPath<Integer> viaPlaceType = createNumber("viaPlaceType", Integer.class);

    public final StringPath viaPoi = createString("viaPoi");

    public QBaseCallRelayEntity(String variable) {
        super(BaseCallRelayEntity.class, forVariable(variable));
    }

    public QBaseCallRelayEntity(Path<? extends BaseCallRelayEntity> path) {
        super(path.getType(), path.getMetadata());
    }

    public QBaseCallRelayEntity(PathMetadata metadata) {
        super(BaseCallRelayEntity.class, metadata);
    }

}

