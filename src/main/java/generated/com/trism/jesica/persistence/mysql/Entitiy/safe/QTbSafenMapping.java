package com.trism.jesica.persistence.mysql.Entitiy.safe;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbSafenMapping is a Querydsl query type for TbSafenMapping
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbSafenMapping extends EntityPathBase<TbSafenMapping> {

    private static final long serialVersionUID = 145965616L;

    public static final QTbSafenMapping tbSafenMapping = new QTbSafenMapping("tbSafenMapping");

    public final EnumPath<com.trism.jesica.persistence.mysql.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.mysql.type.DataStatus.class);

    public final DateTimePath<java.time.LocalDateTime> insertDate = createDateTime("insertDate", java.time.LocalDateTime.class);

    public final NumberPath<Integer> rentalCarNo = createNumber("rentalCarNo", Integer.class);

    public final StringPath safenNum = createString("safenNum");

    public QTbSafenMapping(String variable) {
        super(TbSafenMapping.class, forVariable(variable));
    }

    public QTbSafenMapping(Path<? extends TbSafenMapping> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbSafenMapping(PathMetadata metadata) {
        super(TbSafenMapping.class, metadata);
    }

}

