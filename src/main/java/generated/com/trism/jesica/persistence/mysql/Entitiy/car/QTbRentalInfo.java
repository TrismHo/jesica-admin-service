package com.trism.jesica.persistence.mysql.Entitiy.car;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbRentalInfo is a Querydsl query type for TbRentalInfo
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbRentalInfo extends EntityPathBase<TbRentalInfo> {

    private static final long serialVersionUID = 408991878L;

    public static final QTbRentalInfo tbRentalInfo = new QTbRentalInfo("tbRentalInfo");

    public final StringPath carNum = createString("carNum");

    public final StringPath custDriverTel1 = createString("custDriverTel1");

    public final StringPath custDriverTel2 = createString("custDriverTel2");

    public final StringPath custTel = createString("custTel");

    public final DateTimePath<java.time.LocalDateTime> insertDate = createDateTime("insertDate", java.time.LocalDateTime.class);

    public final NumberPath<Integer> mappingCount = createNumber("mappingCount", Integer.class);

    public final StringPath mappingNum = createString("mappingNum");

    public final NumberPath<Long> rentalNo = createNumber("rentalNo", Long.class);

    public final DateTimePath<java.time.LocalDateTime> reservEndDate = createDateTime("reservEndDate", java.time.LocalDateTime.class);

    public final StringPath reservNum = createString("reservNum");

    public final DateTimePath<java.time.LocalDateTime> reservStartDate = createDateTime("reservStartDate", java.time.LocalDateTime.class);

    public final NumberPath<Long> returnOrderNo = createNumber("returnOrderNo", Long.class);

    public final DateTimePath<java.time.LocalDateTime> safenEndDate = createDateTime("safenEndDate", java.time.LocalDateTime.class);

    public final StringPath safenNum = createString("safenNum");

    public final DateTimePath<java.time.LocalDateTime> safenStartDate = createDateTime("safenStartDate", java.time.LocalDateTime.class);

    public final StringPath storeName = createString("storeName");

    public final NumberPath<Long> takeOrderNo = createNumber("takeOrderNo", Long.class);

    public QTbRentalInfo(String variable) {
        super(TbRentalInfo.class, forVariable(variable));
    }

    public QTbRentalInfo(Path<? extends TbRentalInfo> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbRentalInfo(PathMetadata metadata) {
        super(TbRentalInfo.class, metadata);
    }

}

