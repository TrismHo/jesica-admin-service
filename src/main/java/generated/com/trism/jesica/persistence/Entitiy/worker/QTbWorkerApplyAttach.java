package com.trism.jesica.persistence.Entitiy.worker;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbWorkerApplyAttach is a Querydsl query type for TbWorkerApplyAttach
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbWorkerApplyAttach extends EntityPathBase<TbWorkerApplyAttach> {

    private static final long serialVersionUID = -1294120105L;

    public static final QTbWorkerApplyAttach tbWorkerApplyAttach = new QTbWorkerApplyAttach("tbWorkerApplyAttach");

    public final com.trism.jesica.persistence.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.core.entity.QBaseEntity(this);

    public final NumberPath<Integer> applyAttachType = createNumber("applyAttachType", Integer.class);

    public final NumberPath<Integer> applyNo = createNumber("applyNo", Integer.class);

    public final NumberPath<Integer> attachNo = createNumber("attachNo", Integer.class);

    public final NumberPath<Integer> authStatus = createNumber("authStatus", Integer.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath param1 = createString("param1");

    public final StringPath param2 = createString("param2");

    public final StringPath param3 = createString("param3");

    public final StringPath rejectMemo = createString("rejectMemo");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    public final StringPath updateUserId = createString("updateUserId");

    public final StringPath uploadFile = createString("uploadFile");

    public QTbWorkerApplyAttach(String variable) {
        super(TbWorkerApplyAttach.class, forVariable(variable));
    }

    public QTbWorkerApplyAttach(Path<? extends TbWorkerApplyAttach> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbWorkerApplyAttach(PathMetadata metadata) {
        super(TbWorkerApplyAttach.class, metadata);
    }

}

