package com.trism.jesica.persistence.Entitiy.order;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbOrderAllExtra is a Querydsl query type for TbOrderAllExtra
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbOrderAllExtra extends EntityPathBase<TbOrderAllExtra> {

    private static final long serialVersionUID = 20685839L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbOrderAllExtra tbOrderAllExtra = new QTbOrderAllExtra("tbOrderAllExtra");

    public final com.trism.jesica.persistence.mappedsuper.QBaseOrderExtraEntity _super;

    // inherited
    public final com.trism.jesica.persistence.Entitiy.business.QTbBranchSub acceptBranch;

    // inherited
    public final com.trism.jesica.persistence.Entitiy.business.QTbHeadSub acceptHead;

    // inherited
    public final com.trism.jesica.persistence.Entitiy.business.QTbStoreSub acceptStore;

    //inherited
    public final StringPath acceptStoreTel;

    //inherited
    public final StringPath cancelMemo;

    //inherited
    public final StringPath custMemo;

    //inherited
    public final StringPath custTel2;

    //inherited
    public final StringPath departAddr1;

    //inherited
    public final StringPath departAddr2;

    //inherited
    public final StringPath departAddr3;

    //inherited
    public final StringPath departAddr4;

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

    // inherited
    public final com.trism.jesica.persistence.Entitiy.business.QTbBranchSub giveBranch;

    // inherited
    public final com.trism.jesica.persistence.Entitiy.business.QTbHeadSub giveHead;

    // inherited
    public final com.trism.jesica.persistence.Entitiy.business.QTbStoreSub masterStore;

    // inherited
    public final com.trism.jesica.persistence.Entitiy.business.QTbBranchSub orderBranch;

    //inherited
    public final StringPath orderCancelCode;

    // inherited
    public final com.trism.jesica.persistence.Entitiy.business.QTbHeadSub orderHead;

    //inherited
    public final StringPath orderMemo;

    //inherited
    public final NumberPath<Long> orderNo;

    public QTbOrderAllExtra(String variable) {
        this(TbOrderAllExtra.class, forVariable(variable), INITS);
    }

    public QTbOrderAllExtra(Path<? extends TbOrderAllExtra> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbOrderAllExtra(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbOrderAllExtra(PathMetadata metadata, PathInits inits) {
        this(TbOrderAllExtra.class, metadata, inits);
    }

    public QTbOrderAllExtra(Class<? extends TbOrderAllExtra> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this._super = new com.trism.jesica.persistence.mappedsuper.QBaseOrderExtraEntity(type, metadata, inits);
        this.acceptBranch = _super.acceptBranch;
        this.acceptHead = _super.acceptHead;
        this.acceptStore = _super.acceptStore;
        this.acceptStoreTel = _super.acceptStoreTel;
        this.cancelMemo = _super.cancelMemo;
        this.custMemo = _super.custMemo;
        this.custTel2 = _super.custTel2;
        this.departAddr1 = _super.departAddr1;
        this.departAddr2 = _super.departAddr2;
        this.departAddr3 = _super.departAddr3;
        this.departAddr4 = _super.departAddr4;
        this.departAddr5 = _super.departAddr5;
        this.departMemo = _super.departMemo;
        this.departTel = _super.departTel;
        this.destAddr1 = _super.destAddr1;
        this.destAddr2 = _super.destAddr2;
        this.destAddr5 = _super.destAddr5;
        this.destMemo = _super.destMemo;
        this.destTel = _super.destTel;
        this.giveBranch = _super.giveBranch;
        this.giveHead = _super.giveHead;
        this.masterStore = _super.masterStore;
        this.orderBranch = _super.orderBranch;
        this.orderCancelCode = _super.orderCancelCode;
        this.orderHead = _super.orderHead;
        this.orderMemo = _super.orderMemo;
        this.orderNo = _super.orderNo;
    }

}

