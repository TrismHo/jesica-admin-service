package com.trism.jesica.persistence.mysql.Entitiy.goods;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbStoreCharge is a Querydsl query type for TbStoreCharge
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbStoreCharge extends EntityPathBase<TbStoreCharge> {

    private static final long serialVersionUID = -1775355933L;

    public static final QTbStoreCharge tbStoreCharge = new QTbStoreCharge("tbStoreCharge");

    public final NumberPath<java.math.BigDecimal> mycarCharge = createNumber("mycarCharge", java.math.BigDecimal.class);

    public final NumberPath<Integer> mycarRateType = createNumber("mycarRateType", Integer.class);

    public final NumberPath<Integer> mycarUseYn = createNumber("mycarUseYn", Integer.class);

    public final NumberPath<java.math.BigDecimal> olleCharge = createNumber("olleCharge", java.math.BigDecimal.class);

    public final NumberPath<Integer> olleRateType = createNumber("olleRateType", Integer.class);

    public final NumberPath<Integer> olleUseYn = createNumber("olleUseYn", Integer.class);

    public final NumberPath<java.math.BigDecimal> pgCharge = createNumber("pgCharge", java.math.BigDecimal.class);

    public final NumberPath<Integer> pgRateType = createNumber("pgRateType", Integer.class);

    public final NumberPath<java.math.BigDecimal> returnCharge = createNumber("returnCharge", java.math.BigDecimal.class);

    public final NumberPath<Integer> returnRateType = createNumber("returnRateType", Integer.class);

    public final NumberPath<Integer> returnUseYn = createNumber("returnUseYn", Integer.class);

    public final NumberPath<Long> storeNo = createNumber("storeNo", Long.class);

    public final NumberPath<java.math.BigDecimal> takeoverCharge = createNumber("takeoverCharge", java.math.BigDecimal.class);

    public final NumberPath<Integer> takeoverRateType = createNumber("takeoverRateType", Integer.class);

    public final NumberPath<Integer> takeoverUseYn = createNumber("takeoverUseYn", Integer.class);

    public QTbStoreCharge(String variable) {
        super(TbStoreCharge.class, forVariable(variable));
    }

    public QTbStoreCharge(Path<? extends TbStoreCharge> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbStoreCharge(PathMetadata metadata) {
        super(TbStoreCharge.class, metadata);
    }

}

