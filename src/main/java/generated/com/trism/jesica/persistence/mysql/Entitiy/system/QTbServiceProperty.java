package com.trism.jesica.persistence.mysql.Entitiy.system;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbServiceProperty is a Querydsl query type for TbServiceProperty
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbServiceProperty extends EntityPathBase<TbServiceProperty> {

    private static final long serialVersionUID = -224050999L;

    public static final QTbServiceProperty tbServiceProperty = new QTbServiceProperty("tbServiceProperty");

    public final NumberPath<Integer> dataStatus = createNumber("dataStatus", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> insertDate = createDateTime("insertDate", java.time.LocalDateTime.class);

    public final StringPath memo = createString("memo");

    public final NumberPath<Integer> platformType = createNumber("platformType", Integer.class);

    public final StringPath propName = createString("propName");

    public final StringPath propValue = createString("propValue");

    public final DateTimePath<java.time.LocalDateTime> updateDate = createDateTime("updateDate", java.time.LocalDateTime.class);

    public QTbServiceProperty(String variable) {
        super(TbServiceProperty.class, forVariable(variable));
    }

    public QTbServiceProperty(Path<? extends TbServiceProperty> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbServiceProperty(PathMetadata metadata) {
        super(TbServiceProperty.class, metadata);
    }

}

