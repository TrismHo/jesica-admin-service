package com.trism.jesica.persistence.mysql.Entitiy.service;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbStoreServiceCharge is a Querydsl query type for TbStoreServiceCharge
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbStoreServiceCharge extends EntityPathBase<TbStoreServiceCharge> {

    private static final long serialVersionUID = -491110213L;

    public static final QTbStoreServiceCharge tbStoreServiceCharge = new QTbStoreServiceCharge("tbStoreServiceCharge");

    public final NumberPath<Integer> chargeNo = createNumber("chargeNo", Integer.class);

    public final StringPath chargeStart = createString("chargeStart");

    public final NumberPath<Integer> platformType = createNumber("platformType", Integer.class);

    public final NumberPath<Integer> platformUseYn = createNumber("platformUseYn", Integer.class);

    public final NumberPath<Long> storeNo = createNumber("storeNo", Long.class);

    public final NumberPath<Integer> svcPrice = createNumber("svcPrice", Integer.class);

    public final NumberPath<Integer> svcRateType = createNumber("svcRateType", Integer.class);

    public QTbStoreServiceCharge(String variable) {
        super(TbStoreServiceCharge.class, forVariable(variable));
    }

    public QTbStoreServiceCharge(Path<? extends TbStoreServiceCharge> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbStoreServiceCharge(PathMetadata metadata) {
        super(TbStoreServiceCharge.class, metadata);
    }

}

