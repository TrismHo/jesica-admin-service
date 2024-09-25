package com.trism.jesica.persistence.mysql.Entitiy.business;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbDeliveryShare is a Querydsl query type for TbDeliveryShare
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbDeliveryShare extends EntityPathBase<TbDeliveryShare> {

    private static final long serialVersionUID = 1688251835L;

    public static final QTbDeliveryShare tbDeliveryShare = new QTbDeliveryShare("tbDeliveryShare");

    public final com.trism.jesica.persistence.mysql.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.mysql.core.entity.QBaseEntity(this);

    public final NumberPath<Long> acceptDlvyNo = createNumber("acceptDlvyNo", Long.class);

    public final NumberPath<Long> giveDlvyNo = createNumber("giveDlvyNo", Long.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    public QTbDeliveryShare(String variable) {
        super(TbDeliveryShare.class, forVariable(variable));
    }

    public QTbDeliveryShare(Path<? extends TbDeliveryShare> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbDeliveryShare(PathMetadata metadata) {
        super(TbDeliveryShare.class, metadata);
    }

}

