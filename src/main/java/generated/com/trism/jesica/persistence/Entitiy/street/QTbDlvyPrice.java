package com.trism.jesica.persistence.Entitiy.street;

import com.querydsl.core.types.Path;
import com.querydsl.core.types.PathMetadata;
import com.querydsl.core.types.dsl.DateTimePath;
import com.querydsl.core.types.dsl.EntityPathBase;
import com.querydsl.core.types.dsl.NumberPath;
import com.querydsl.core.types.dsl.StringPath;

import javax.annotation.Generated;

import static com.querydsl.core.types.PathMetadataFactory.forVariable;


/**
 * QTbDlvyPrice is a Querydsl query type for TbDlvyPrice
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbDlvyPrice extends EntityPathBase<TbDlvyPrice> {

    private static final long serialVersionUID = 2130934821L;

    public static final QTbDlvyPrice tbDlvyPrice = new QTbDlvyPrice("tbDlvyPrice");

    public final com.trism.jesica.persistence.core.entity.QCreatedDateEntity _super = new com.trism.jesica.persistence.core.entity.QCreatedDateEntity(this);

    public final NumberPath<Integer> dataStatus = createNumber("dataStatus", Integer.class);

    public final NumberPath<Integer> day = createNumber("day", Integer.class);

    public final NumberPath<Integer> endTime = createNumber("endTime", Integer.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath insertUserId = createString("insertUserId");

    public final NumberPath<Integer> price1 = createNumber("price1", Integer.class);

    public final NumberPath<Integer> price2 = createNumber("price2", Integer.class);

    public final NumberPath<Integer> price3 = createNumber("price3", Integer.class);

    public final NumberPath<Long> priceChargeNo = createNumber("priceChargeNo", Long.class);

    public final NumberPath<Long> priceNo = createNumber("priceNo", Long.class);

    public final NumberPath<Integer> radius = createNumber("radius", Integer.class);

    public final NumberPath<Integer> startTime = createNumber("startTime", Integer.class);

    public final DateTimePath<java.sql.Timestamp> updateDate = createDateTime("updateDate", java.sql.Timestamp.class);

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

