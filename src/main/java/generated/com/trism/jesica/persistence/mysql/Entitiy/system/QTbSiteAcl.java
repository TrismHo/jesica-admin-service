package com.trism.jesica.persistence.mysql.Entitiy.system;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbSiteAcl is a Querydsl query type for TbSiteAcl
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbSiteAcl extends EntityPathBase<TbSiteAcl> {

    private static final long serialVersionUID = -882224158L;

    public static final QTbSiteAcl tbSiteAcl = new QTbSiteAcl("tbSiteAcl");

    public final NumberPath<Long> menuNo = createNumber("menuNo", Long.class);

    public final NumberPath<Integer> permission = createNumber("permission", Integer.class);

    public final NumberPath<Long> staffNo = createNumber("staffNo", Long.class);

    public QTbSiteAcl(String variable) {
        super(TbSiteAcl.class, forVariable(variable));
    }

    public QTbSiteAcl(Path<? extends TbSiteAcl> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbSiteAcl(PathMetadata metadata) {
        super(TbSiteAcl.class, metadata);
    }

}

