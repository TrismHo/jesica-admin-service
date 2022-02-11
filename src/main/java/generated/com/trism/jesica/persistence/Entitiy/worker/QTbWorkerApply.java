package com.trism.jesica.persistence.Entitiy.worker;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbWorkerApply is a Querydsl query type for TbWorkerApply
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbWorkerApply extends EntityPathBase<TbWorkerApply> {

    private static final long serialVersionUID = -709521806L;

    public static final QTbWorkerApply tbWorkerApply = new QTbWorkerApply("tbWorkerApply");

    public final NumberPath<Integer> applyNo = createNumber("applyNo", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> authDate = createDateTime("authDate", java.time.LocalDateTime.class);

    public final NumberPath<Integer> authStatus = createNumber("authStatus", Integer.class);

    public final NumberPath<Integer> branchNo = createNumber("branchNo", Integer.class);

    public final NumberPath<Integer> careerAuthStatus = createNumber("careerAuthStatus", Integer.class);

    public final StringPath careerFile = createString("careerFile");

    public final DateTimePath<java.time.LocalDateTime> insertDate = createDateTime("insertDate", java.time.LocalDateTime.class);

    public final NumberPath<Integer> licenseAuthStatus = createNumber("licenseAuthStatus", Integer.class);

    public final StringPath licenseExpDate = createString("licenseExpDate");

    public final StringPath licenseFile = createString("licenseFile");

    public final StringPath licenseNum = createString("licenseNum");

    public final StringPath licenseType = createString("licenseType");

    public final StringPath name = createString("name");

    public final StringPath phone = createString("phone");

    public final NumberPath<Integer> profileAuthStatus = createNumber("profileAuthStatus", Integer.class);

    public final StringPath profileFile = createString("profileFile");

    public final StringPath profileFileSmall = createString("profileFileSmall");

    public final StringPath residentNum = createString("residentNum");

    public final NumberPath<Integer> serviceType = createNumber("serviceType", Integer.class);

    public final NumberPath<Integer> signYn = createNumber("signYn", Integer.class);

    public final NumberPath<Integer> smsYn = createNumber("smsYn", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> updateDate = createDateTime("updateDate", java.time.LocalDateTime.class);

    public final NumberPath<Integer> workerNo = createNumber("workerNo", Integer.class);

    public QTbWorkerApply(String variable) {
        super(TbWorkerApply.class, forVariable(variable));
    }

    public QTbWorkerApply(Path<? extends TbWorkerApply> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbWorkerApply(PathMetadata metadata) {
        super(TbWorkerApply.class, metadata);
    }

}

