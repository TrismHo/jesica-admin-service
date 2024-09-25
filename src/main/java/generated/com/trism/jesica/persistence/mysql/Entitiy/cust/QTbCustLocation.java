package com.trism.jesica.persistence.mysql.Entitiy.cust;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbCustLocation is a Querydsl query type for TbCustLocation
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbCustLocation extends EntityPathBase<TbCustLocation> {

    private static final long serialVersionUID = 1432617669L;

    public static final QTbCustLocation tbCustLocation = new QTbCustLocation("tbCustLocation");

    public final StringPath addr1 = createString("addr1");

    public final StringPath addr2 = createString("addr2");

    public final NumberPath<Long> custNo = createNumber("custNo", Long.class);

    public final DateTimePath<java.time.LocalDateTime> insertDate = createDateTime("insertDate", java.time.LocalDateTime.class);

    public final DateTimePath<java.time.LocalDateTime> updateDate = createDateTime("updateDate", java.time.LocalDateTime.class);

    public QTbCustLocation(String variable) {
        super(TbCustLocation.class, forVariable(variable));
    }

    public QTbCustLocation(Path<? extends TbCustLocation> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbCustLocation(PathMetadata metadata) {
        super(TbCustLocation.class, metadata);
    }

}

