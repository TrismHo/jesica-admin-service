package com.trism.jesica.persistence.mysql.Entitiy.cash;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbCashWithdraw is a Querydsl query type for TbCashWithdraw
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbCashWithdraw extends EntityPathBase<TbCashWithdraw> {

    private static final long serialVersionUID = 683291162L;

    public static final QTbCashWithdraw tbCashWithdraw = new QTbCashWithdraw("tbCashWithdraw");

    public final com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity _super = new com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity(this);

    public final StringPath accountName = createString("accountName");

    public final StringPath accountNo = createString("accountNo");

    public final StringPath bankCode = createString("bankCode");

    public final StringPath bankName = createString("bankName");

    public final NumberPath<Integer> cash = createNumber("cash", Integer.class);

    public final NumberPath<Integer> fee = createNumber("fee", Integer.class);

    public final StringPath groupName = createString("groupName");

    public final NumberPath<Integer> groupNo = createNumber("groupNo", Integer.class);

    public final NumberPath<Integer> groupType = createNumber("groupType", Integer.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath insertUserId = createString("insertUserId");

    public final StringPath memo = createString("memo");

    public final StringPath phone = createString("phone");

    public final NumberPath<Integer> reqAmount = createNumber("reqAmount", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> withdrawDate = createDateTime("withdrawDate", java.time.LocalDateTime.class);

    public final NumberPath<Long> withdrawNo = createNumber("withdrawNo", Long.class);

    public final NumberPath<Integer> withdrawStatus = createNumber("withdrawStatus", Integer.class);

    public QTbCashWithdraw(String variable) {
        super(TbCashWithdraw.class, forVariable(variable));
    }

    public QTbCashWithdraw(Path<? extends TbCashWithdraw> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbCashWithdraw(PathMetadata metadata) {
        super(TbCashWithdraw.class, metadata);
    }

}

