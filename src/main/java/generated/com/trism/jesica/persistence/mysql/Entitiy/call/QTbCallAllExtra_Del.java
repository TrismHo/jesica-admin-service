package com.trism.jesica.persistence.mysql.Entitiy.call;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbCallAllExtra_Del is a Querydsl query type for TbCallAllExtra_Del
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbCallAllExtra_Del extends EntityPathBase<TbCallAllExtra_Del> {

    private static final long serialVersionUID = -1573680309L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbCallAllExtra_Del tbCallAllExtra_Del = new QTbCallAllExtra_Del("tbCallAllExtra_Del");

    public final com.trism.jesica.persistence.mysql.mappedsuper.QBaseCallExtraEntity _super;

    // inherited
    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbBranchSub acceptBranch;

    // inherited
    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbHeadSub acceptHead;

    // inherited
    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbStoreSub acceptStore;

    //inherited
    public final StringPath acceptStoreTel;

    // inherited
    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbBranchSub callBranch;

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
    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbHeadSub orderHead;

    //inherited
    public final StringPath orderMemo;

    //inherited
    public final NumberPath<Long> orderNo;

    public QTbCallAllExtra_Del(String variable) {
        this(TbCallAllExtra_Del.class, forVariable(variable), INITS);
    }

    public QTbCallAllExtra_Del(Path<? extends TbCallAllExtra_Del> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbCallAllExtra_Del(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbCallAllExtra_Del(PathMetadata metadata, PathInits inits) {
        this(TbCallAllExtra_Del.class, metadata, inits);
    }

    public QTbCallAllExtra_Del(Class<? extends TbCallAllExtra_Del> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this._super = new com.trism.jesica.persistence.mysql.mappedsuper.QBaseCallExtraEntity(type, metadata, inits);
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

