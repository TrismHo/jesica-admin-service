package com.trism.jesica.persistence.Entitiy.cust;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbCustFavorite is a Querydsl query type for TbCustFavorite
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbCustFavorite extends EntityPathBase<TbCustFavorite> {

    private static final long serialVersionUID = -1828809224L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbCustFavorite tbCustFavorite = new QTbCustFavorite("tbCustFavorite");

    public final com.trism.jesica.persistence.core.entity.QCreatedDateEntity _super = new com.trism.jesica.persistence.core.entity.QCreatedDateEntity(this);

    public final QTbCust cust;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final com.trism.jesica.persistence.Entitiy.business.QTbStore store;

    public QTbCustFavorite(String variable) {
        this(TbCustFavorite.class, forVariable(variable), INITS);
    }

    public QTbCustFavorite(Path<? extends TbCustFavorite> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbCustFavorite(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbCustFavorite(PathMetadata metadata, PathInits inits) {
        this(TbCustFavorite.class, metadata, inits);
    }

    public QTbCustFavorite(Class<? extends TbCustFavorite> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.cust = inits.isInitialized("cust") ? new QTbCust(forProperty("cust"), inits.get("cust")) : null;
        this.store = inits.isInitialized("store") ? new com.trism.jesica.persistence.Entitiy.business.QTbStore(forProperty("store"), inits.get("store")) : null;
    }

}

