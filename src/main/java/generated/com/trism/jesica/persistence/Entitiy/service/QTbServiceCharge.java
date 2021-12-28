package com.trism.jesica.persistence.Entitiy.service;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbServiceCharge is a Querydsl query type for TbServiceCharge
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbServiceCharge extends EntityPathBase<TbServiceCharge> {

    private static final long serialVersionUID = 1169431266L;

    public static final QTbServiceCharge tbServiceCharge = new QTbServiceCharge("tbServiceCharge");

    public final NumberPath<Integer> branchNo1 = createNumber("branchNo1", Integer.class);

    public final NumberPath<Integer> branchNo2 = createNumber("branchNo2", Integer.class);

    public final NumberPath<Integer> branchNo3 = createNumber("branchNo3", Integer.class);

    public final NumberPath<Long> chargeNo = createNumber("chargeNo", Long.class);

    public final NumberPath<Integer> headNo1 = createNumber("headNo1", Integer.class);

    public final NumberPath<Integer> headNo2 = createNumber("headNo2", Integer.class);

    public final NumberPath<Integer> headNo3 = createNumber("headNo3", Integer.class);

    public final NumberPath<Integer> platformType = createNumber("platformType", Integer.class);

    public final NumberPath<Integer> serviceType = createNumber("serviceType", Integer.class);

    public final NumberPath<Integer> svcRate0 = createNumber("svcRate0", Integer.class);

    public final NumberPath<Integer> svcRate1 = createNumber("svcRate1", Integer.class);

    public final NumberPath<Integer> svcRate2 = createNumber("svcRate2", Integer.class);

    public final NumberPath<Integer> svcRate3 = createNumber("svcRate3", Integer.class);

    public QTbServiceCharge(String variable) {
        super(TbServiceCharge.class, forVariable(variable));
    }

    public QTbServiceCharge(Path<? extends TbServiceCharge> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbServiceCharge(PathMetadata metadata) {
        super(TbServiceCharge.class, metadata);
    }

}

