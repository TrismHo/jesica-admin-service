package com.trism.jesica.persistence.mysql.Entitiy.app;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbAppVersion is a Querydsl query type for TbAppVersion
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbAppVersion extends EntityPathBase<TbAppVersion> {

    private static final long serialVersionUID = -1620098338L;

    public static final QTbAppVersion tbAppVersion = new QTbAppVersion("tbAppVersion");

    public final StringPath appCode = createString("appCode");

    public final StringPath codeMemo = createString("codeMemo");

    public final NumberPath<Integer> deviceType = createNumber("deviceType", Integer.class);

    public final StringPath releaseVer = createString("releaseVer");

    public final StringPath updateVer = createString("updateVer");

    public QTbAppVersion(String variable) {
        super(TbAppVersion.class, forVariable(variable));
    }

    public QTbAppVersion(Path<? extends TbAppVersion> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbAppVersion(PathMetadata metadata) {
        super(TbAppVersion.class, metadata);
    }

}

