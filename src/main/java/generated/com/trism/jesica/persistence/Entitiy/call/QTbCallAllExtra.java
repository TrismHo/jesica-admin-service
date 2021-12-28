package com.trism.jesica.persistence.Entitiy.call;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbCallAllExtra is a Querydsl query type for TbCallAllExtra
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbCallAllExtra extends EntityPathBase<TbCallAllExtra> {

    private static final long serialVersionUID = 797090027L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbCallAllExtra tbCallAllExtra = new QTbCallAllExtra("tbCallAllExtra");

    public final com.trism.jesica.persistence.mappedsuper.QBaseCallExtraEntity _super;

    // inherited
    public final com.trism.jesica.persistence.Entitiy.business.QTbBranchSub acceptBranch;

    // inherited
    public final com.trism.jesica.persistence.Entitiy.business.QTbHeadSub acceptHead;

    // inherited
    public final com.trism.jesica.persistence.Entitiy.business.QTbStoreSub acceptStore;

    //inherited
    public final StringPath acceptStoreTel;

    // inherited
    public final com.trism.jesica.persistence.Entitiy.business.QTbBranchSub callBranch;

    //inherited
    public final StringPath cancelMemo;

    //inherited
    public final StringPath carModel;

    //inherited
    public final StringPath carNum;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> carUseDate;

    //inherited
    public final StringPath custMemo;

    //inherited
    public final StringPath custTel2;

    //inherited
    public final StringPath departAddr1;

    //inherited
    public final StringPath departAddr2;

    //inherited
    public final StringPath departAddr5;

    //inherited
    public final StringPath departMemo;

    //inherited
    public final StringPath departTel;

    //inherited
    public final StringPath destAddr1;

    //inherited
    public final StringPath destAddr2;

    //inherited
    public final StringPath destAddr5;

    //inherited
    public final StringPath destMemo;

    //inherited
    public final StringPath destTel;

    //inherited
    public final StringPath orderCancelCode;

    // inherited
    public final com.trism.jesica.persistence.Entitiy.business.QTbHeadSub orderHead;

    //inherited
    public final StringPath orderMemo;

    //inherited
    public final NumberPath<Long> orderNo;

    public QTbCallAllExtra(String variable) {
        this(TbCallAllExtra.class, forVariable(variable), INITS);
    }

    public QTbCallAllExtra(Path<? extends TbCallAllExtra> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbCallAllExtra(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbCallAllExtra(PathMetadata metadata, PathInits inits) {
        this(TbCallAllExtra.class, metadata, inits);
    }

    public QTbCallAllExtra(Class<? extends TbCallAllExtra> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this._super = new com.trism.jesica.persistence.mappedsuper.QBaseCallExtraEntity(type, metadata, inits);
        this.acceptBranch = _super.acceptBranch;
        this.acceptHead = _super.acceptHead;
        this.acceptStore = _super.acceptStore;
        this.acceptStoreTel = _super.acceptStoreTel;
        this.callBranch = _super.callBranch;
        this.cancelMemo = _super.cancelMemo;
        this.carModel = _super.carModel;
        this.carNum = _super.carNum;
        this.carUseDate = _super.carUseDate;
        this.custMemo = _super.custMemo;
        this.custTel2 = _super.custTel2;
        this.departAddr1 = _super.departAddr1;
        this.departAddr2 = _super.departAddr2;
        this.departAddr5 = _super.departAddr5;
        this.departMemo = _super.departMemo;
        this.departTel = _super.departTel;
        this.destAddr1 = _super.destAddr1;
        this.destAddr2 = _super.destAddr2;
        this.destAddr5 = _super.destAddr5;
        this.destMemo = _super.destMemo;
        this.destTel = _super.destTel;
        this.orderCancelCode = _super.orderCancelCode;
        this.orderHead = _super.orderHead;
        this.orderMemo = _super.orderMemo;
        this.orderNo = _super.orderNo;
    }

}

