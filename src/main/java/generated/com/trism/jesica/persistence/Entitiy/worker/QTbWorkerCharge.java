package com.trism.jesica.persistence.Entitiy.worker;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbWorkerCharge is a Querydsl query type for TbWorkerCharge
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbWorkerCharge extends EntityPathBase<TbWorkerCharge> {

    private static final long serialVersionUID = -470910928L;

    public static final QTbWorkerCharge tbWorkerCharge = new QTbWorkerCharge("tbWorkerCharge");

    public final NumberPath<Integer> dailyCharge = createNumber("dailyCharge", Integer.class);

    public final NumberPath<Integer> monthlyCharge = createNumber("monthlyCharge", Integer.class);

    public final NumberPath<java.math.BigDecimal> mycarCharge = createNumber("mycarCharge", java.math.BigDecimal.class);

    public final NumberPath<Integer> mycarRateType = createNumber("mycarRateType", Integer.class);

    public final NumberPath<java.math.BigDecimal> olleCharge = createNumber("olleCharge", java.math.BigDecimal.class);

    public final NumberPath<Integer> olleRateType = createNumber("olleRateType", Integer.class);

    public final NumberPath<java.math.BigDecimal> returnCharge = createNumber("returnCharge", java.math.BigDecimal.class);

    public final NumberPath<Integer> returnRateType = createNumber("returnRateType", Integer.class);

    public final NumberPath<java.math.BigDecimal> takeoverCharge = createNumber("takeoverCharge", java.math.BigDecimal.class);

    public final NumberPath<Integer> takeoverRateType = createNumber("takeoverRateType", Integer.class);

    public final NumberPath<Integer> workerNo = createNumber("workerNo", Integer.class);

    public QTbWorkerCharge(String variable) {
        super(TbWorkerCharge.class, forVariable(variable));
    }

    public QTbWorkerCharge(Path<? extends TbWorkerCharge> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbWorkerCharge(PathMetadata metadata) {
        super(TbWorkerCharge.class, metadata);
    }

}

