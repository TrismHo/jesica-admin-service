package com.trism.jesica.persistence.Entitiy.call;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbCallDayExtra is a Querydsl query type for TbCallDayExtra
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbCallDayExtra extends EntityPathBase<TbCallDayExtra> {

    private static final long serialVersionUID = 930126800L;

    public static final QTbCallDayExtra tbCallDayExtra = new QTbCallDayExtra("tbCallDayExtra");

    public final NumberPath<Integer> acceptBranchNo = createNumber("acceptBranchNo", Integer.class);

    public final NumberPath<Integer> acceptHeadNo = createNumber("acceptHeadNo", Integer.class);

    public final NumberPath<Integer> acceptStoreNo = createNumber("acceptStoreNo", Integer.class);

    public final StringPath acceptStoreTel = createString("acceptStoreTel");

    public final StringPath cancelMemo = createString("cancelMemo");

    public final StringPath carModel = createString("carModel");

    public final StringPath carNum = createString("carNum");

    public final DateTimePath<java.time.LocalDateTime> carUseDate = createDateTime("carUseDate", java.time.LocalDateTime.class);

    public final StringPath custMemo = createString("custMemo");

    public final StringPath custTel2 = createString("custTel2");

    public final StringPath departAddr1 = createString("departAddr1");

    public final StringPath departAddr2 = createString("departAddr2");

    public final StringPath departAddr5 = createString("departAddr5");

    public final StringPath departMemo = createString("departMemo");

    public final StringPath departTel = createString("departTel");

    public final StringPath destAddr1 = createString("destAddr1");

    public final StringPath destAddr2 = createString("destAddr2");

    public final StringPath destAddr5 = createString("destAddr5");

    public final StringPath destMemo = createString("destMemo");

    public final StringPath destTel = createString("destTel");

    public final NumberPath<Integer> orderBranchNo = createNumber("orderBranchNo", Integer.class);

    public final StringPath orderCancelCode = createString("orderCancelCode");

    public final NumberPath<Integer> orderHeadNo = createNumber("orderHeadNo", Integer.class);

    public final StringPath orderMemo = createString("orderMemo");

    public final NumberPath<Long> orderNo = createNumber("orderNo", Long.class);

    public QTbCallDayExtra(String variable) {
        super(TbCallDayExtra.class, forVariable(variable));
    }

    public QTbCallDayExtra(Path<? extends TbCallDayExtra> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbCallDayExtra(PathMetadata metadata) {
        super(TbCallDayExtra.class, metadata);
    }

}

