package com.trism.jesica.persistence.Entitiy.cust;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbCustSub is a Querydsl query type for TbCustSub
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbCustSub extends EntityPathBase<TbCustSub> {

    private static final long serialVersionUID = -1762285468L;

    public static final QTbCustSub tbCustSub = new QTbCustSub("tbCustSub");

    public final com.trism.jesica.persistence.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.core.entity.QBaseEntity(this);

    public final NumberPath<Integer> cash = createNumber("cash", Integer.class);

    public final StringPath custName = createString("custName");

    public final NumberPath<Long> custNo = createNumber("custNo", Long.class);

    public final StringPath custTel = createString("custTel");

    public final EnumPath<com.trism.jesica.persistence.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.type.DataStatus.class);

    public final EnumPath<com.trism.jesica.persistence.type.GenderType> gender = createEnum("gender", com.trism.jesica.persistence.type.GenderType.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath loginId = createString("loginId");

    public final StringPath loginPwd = createString("loginPwd");

    public final NumberPath<Integer> mileage = createNumber("mileage", Integer.class);

    public final BooleanPath pushMarketingYn = createBoolean("pushMarketingYn");

    public final BooleanPath pushNoticeYn = createBoolean("pushNoticeYn");

    public final BooleanPath pushOrderYn = createBoolean("pushOrderYn");

    public final BooleanPath smsYn = createBoolean("smsYn");

    public final StringPath snsToken1 = createString("snsToken1");

    public final StringPath snsToken2 = createString("snsToken2");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    public QTbCustSub(String variable) {
        super(TbCustSub.class, forVariable(variable));
    }

    public QTbCustSub(Path<? extends TbCustSub> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbCustSub(PathMetadata metadata) {
        super(TbCustSub.class, metadata);
    }

}

