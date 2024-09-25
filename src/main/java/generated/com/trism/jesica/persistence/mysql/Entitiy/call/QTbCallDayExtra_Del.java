package com.trism.jesica.persistence.mysql.Entitiy.call;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbCallDayExtra_Del is a Querydsl query type for TbCallDayExtra_Del
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbCallDayExtra_Del extends EntityPathBase<TbCallDayExtra_Del> {

    private static final long serialVersionUID = -1154511952L;

    public static final QTbCallDayExtra_Del tbCallDayExtra_Del = new QTbCallDayExtra_Del("tbCallDayExtra_Del");

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

    public QTbCallDayExtra_Del(String variable) {
        super(TbCallDayExtra_Del.class, forVariable(variable));
    }

    public QTbCallDayExtra_Del(Path<? extends TbCallDayExtra_Del> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbCallDayExtra_Del(PathMetadata metadata) {
        super(TbCallDayExtra_Del.class, metadata);
    }

}

