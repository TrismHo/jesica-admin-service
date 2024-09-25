package com.trism.jesica.persistence.mysql.Entitiy.street;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbDlvyPrice is a Querydsl query type for TbDlvyPrice
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbDlvyPrice extends EntityPathBase<TbDlvyPrice> {

    private static final long serialVersionUID = 2070167281L;

    public static final QTbDlvyPrice tbDlvyPrice = new QTbDlvyPrice("tbDlvyPrice");

    public final com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity _super = new com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity(this);

    public final NumberPath<Integer> custPrice = createNumber("custPrice", Integer.class);

    public final NumberPath<Integer> dataStatus = createNumber("dataStatus", Integer.class);

    public final NumberPath<Integer> day = createNumber("day", Integer.class);

    public final NumberPath<Integer> dlvyPrice = createNumber("dlvyPrice", Integer.class);

    public final NumberPath<Integer> endTime = createNumber("endTime", Integer.class);

    public final NumberPath<Long> groupNo = createNumber("groupNo", Long.class);

    public final NumberPath<Integer> groupType = createNumber("groupType", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> insertDate = createDateTime("insertDate", java.time.LocalDateTime.class);

    public final StringPath insertUserId = createString("insertUserId");

    public final NumberPath<Long> priceNo = createNumber("priceNo", Long.class);

    public final NumberPath<Integer> radius = createNumber("radius", Integer.class);

    public final NumberPath<Integer> startTime = createNumber("startTime", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> updateDate = createDateTime("updateDate", java.time.LocalDateTime.class);

    public final StringPath updateUserId = createString("updateUserId");

    public QTbDlvyPrice(String variable) {
        super(TbDlvyPrice.class, forVariable(variable));
    }

    public QTbDlvyPrice(Path<? extends TbDlvyPrice> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbDlvyPrice(PathMetadata metadata) {
        super(TbDlvyPrice.class, metadata);
    }

}

