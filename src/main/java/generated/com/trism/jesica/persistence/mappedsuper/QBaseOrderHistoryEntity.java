package com.trism.jesica.persistence.mappedsuper;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QBaseOrderHistoryEntity is a Querydsl query type for BaseOrderHistoryEntity
 */
@Generated("com.querydsl.codegen.SupertypeSerializer")
public class QBaseOrderHistoryEntity extends EntityPathBase<BaseOrderHistoryEntity> {

    private static final long serialVersionUID = 20342520L;

    public static final QBaseOrderHistoryEntity baseOrderHistoryEntity = new QBaseOrderHistoryEntity("baseOrderHistoryEntity");

    public final StringPath destAddr5 = createString("destAddr5");

    public final NumberPath<Integer> discountAmt = createNumber("discountAmt", Integer.class);

    public final NumberPath<Integer> dlvyAmt = createNumber("dlvyAmt", Integer.class);

    public final NumberPath<Integer> dlvyCnt = createNumber("dlvyCnt", Integer.class);

    public final NumberPath<Integer> dlvyNo = createNumber("dlvyNo", Integer.class);

    public final EnumPath<com.trism.jesica.persistence.type.DlvyPayMethodType> dlvyPayMethod = createEnum("dlvyPayMethod", com.trism.jesica.persistence.type.DlvyPayMethodType.class);

    public final NumberPath<Integer> orderAmt = createNumber("orderAmt", Integer.class);

    public final StringPath orderStatusCode = createString("orderStatusCode");

    public final StringPath orderTypeCode = createString("orderTypeCode");

    public final EnumPath<com.trism.jesica.persistence.type.PayMethodType> payMethod = createEnum("payMethod", com.trism.jesica.persistence.type.PayMethodType.class);

    public final NumberPath<Integer> serviceAmt = createNumber("serviceAmt", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> takeoutDate = createDateTime("takeoutDate", java.time.LocalDateTime.class);

    public final BooleanPath takeoutYn = createBoolean("takeoutYn");

    public final DateTimePath<java.time.LocalDateTime> updateDate = createDateTime("updateDate", java.time.LocalDateTime.class);

    public final StringPath updateMemo = createString("updateMemo");

    public final NumberPath<Integer> updateScn = createNumber("updateScn", Integer.class);

    public final NumberPath<Long> updateUserNo = createNumber("updateUserNo", Long.class);

    public final EnumPath<com.trism.jesica.persistence.type.UserType> updateUserType = createEnum("updateUserType", com.trism.jesica.persistence.type.UserType.class);

    public final StringPath workerName = createString("workerName");

    public final NumberPath<Long> workerNo = createNumber("workerNo", Long.class);

    public QBaseOrderHistoryEntity(String variable) {
        super(BaseOrderHistoryEntity.class, forVariable(variable));
    }

    public QBaseOrderHistoryEntity(Path<? extends BaseOrderHistoryEntity> path) {
        super(path.getType(), path.getMetadata());
    }

    public QBaseOrderHistoryEntity(PathMetadata metadata) {
        super(BaseOrderHistoryEntity.class, metadata);
    }

}

