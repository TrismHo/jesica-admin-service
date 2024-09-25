package com.trism.jesica.persistence.mysql.Entitiy.call;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbCallHistory is a Querydsl query type for TbCallHistory
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbCallHistory extends EntityPathBase<TbCallHistory> {

    private static final long serialVersionUID = 1388830180L;

    public static final QTbCallHistory tbCallHistory = new QTbCallHistory("tbCallHistory");

    public final StringPath departAddr5 = createString("departAddr5");

    public final StringPath destAddr5 = createString("destAddr5");

    public final NumberPath<Integer> discountAmt = createNumber("discountAmt", Integer.class);

    public final NumberPath<Integer> dlvyAmt = createNumber("dlvyAmt", Integer.class);

    public final NumberPath<Integer> dlvyNo = createNumber("dlvyNo", Integer.class);

    public final NumberPath<Integer> orderAmt = createNumber("orderAmt", Integer.class);

    public final NumberPath<Long> orderNo = createNumber("orderNo", Long.class);

    public final NumberPath<Integer> orderPayStatus = createNumber("orderPayStatus", Integer.class);

    public final StringPath orderStatusCode = createString("orderStatusCode");

    public final StringPath orderTypeCode = createString("orderTypeCode");

    public final NumberPath<Integer> serviceAmt = createNumber("serviceAmt", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> updateDate = createDateTime("updateDate", java.time.LocalDateTime.class);

    public final StringPath updateMemo = createString("updateMemo");

    public final NumberPath<Integer> updateScn = createNumber("updateScn", Integer.class);

    public final NumberPath<Integer> updateUserNo = createNumber("updateUserNo", Integer.class);

    public final NumberPath<Integer> updateUserType = createNumber("updateUserType", Integer.class);

    public final StringPath workerName = createString("workerName");

    public final NumberPath<Integer> workerNo = createNumber("workerNo", Integer.class);

    public QTbCallHistory(String variable) {
        super(TbCallHistory.class, forVariable(variable));
    }

    public QTbCallHistory(Path<? extends TbCallHistory> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbCallHistory(PathMetadata metadata) {
        super(TbCallHistory.class, metadata);
    }

}

