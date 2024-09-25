package com.trism.jesica.persistence.mysql.Entitiy.poinhistory;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbPointHistory is a Querydsl query type for TbPointHistory
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbPointHistory extends EntityPathBase<TbPointHistory> {

    private static final long serialVersionUID = 771616796L;

    public static final QTbPointHistory tbPointHistory = new QTbPointHistory("tbPointHistory");

    public final NumberPath<Integer> dataStatus = createNumber("dataStatus", Integer.class);

    public final NumberPath<Long> orderNo = createNumber("orderNo", Long.class);

    public final NumberPath<Integer> ordPointAmt = createNumber("ordPointAmt", Integer.class);

    public final NumberPath<java.math.BigDecimal> point = createNumber("point", java.math.BigDecimal.class);

    public final StringPath pointHisId = createString("pointHisId");

    public final NumberPath<Integer> pointType = createNumber("pointType", Integer.class);

    public final StringPath preCustAccPoint = createString("preCustAccPoint");

    public final NumberPath<Integer> preCustPoint = createNumber("preCustPoint", Integer.class);

    public final NumberPath<Long> userNo = createNumber("userNo", Long.class);

    public QTbPointHistory(String variable) {
        super(TbPointHistory.class, forVariable(variable));
    }

    public QTbPointHistory(Path<? extends TbPointHistory> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbPointHistory(PathMetadata metadata) {
        super(TbPointHistory.class, metadata);
    }

}

