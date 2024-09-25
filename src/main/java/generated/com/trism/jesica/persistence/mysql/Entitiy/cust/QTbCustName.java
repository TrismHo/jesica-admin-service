package com.trism.jesica.persistence.mysql.Entitiy.cust;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbCustName is a Querydsl query type for TbCustName
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbCustName extends EntityPathBase<TbCustName> {

    private static final long serialVersionUID = -1349261925L;

    public static final QTbCustName tbCustName = new QTbCustName("tbCustName");

    public final StringPath custName = createString("custName");

    public final NumberPath<Long> custNo = createNumber("custNo", Long.class);

    public final StringPath custTel = createString("custTel");

    public final EnumPath<com.trism.jesica.persistence.mysql.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.mysql.type.DataStatus.class);

    public final StringPath loginId = createString("loginId");

    public QTbCustName(String variable) {
        super(TbCustName.class, forVariable(variable));
    }

    public QTbCustName(Path<? extends TbCustName> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbCustName(PathMetadata metadata) {
        super(TbCustName.class, metadata);
    }

}

