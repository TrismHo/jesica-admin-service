/*
package com.trism.manna.persistence.Repository.support;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.QueryResults;
import com.querydsl.core.types.OrderSpecifier;
import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.manna.persistence.Entitiy.business.TbHead;
import com.woorien.petview.dto.BrdEventData;
import com.woorien.petview.dto.CriteriaRequest;
import com.woorien.petview.persistence.Entitiy.BrdEvent;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;

import static com.woorien.petview.persistence.Entitiy.QBasManager.basManager;
import static com.woorien.petview.persistence.Entitiy.QBrdEvent.brdEvent;

public interface TbHeadRepositorySupport {

    QueryResults<TbHead> findAllBrdEventByLimit(CriteriaRequest req, int bmRole);

    class TbHeadRepositorySupportImpl extends QuerydslRepositorySupport implements TbHeadRepositorySupport {
        private final JPAQueryFactory queryFactory;

        public TbHeadRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(BrdEvent.class);
            this.queryFactory = queryFactory;
        }

        @Override
        public QueryResults<BrdEventData> findAllBrdEventByLimit(CriteriaRequest req, int bmRole) {
            long start = req.getStart();
            long length = req.getLength();
            CriteriaRequest.Search search = req.getSearch();
            CriteriaRequest.Order order = req.getOrder();

            //search 검색
            BooleanBuilder searchBuilder = new BooleanBuilder();
            String searchCondition = "";
            String searchKeyword = "";

            if(search.getValue() != null && !search.getValue().equals("")) {
                searchKeyword = search.getValue();
            }

            if(!searchKeyword.equals("")) {
                if (search.getKey() != null && !search.getKey().equals("-1")) {
                    searchCondition = search.getKey();
                    if (searchCondition.equalsIgnoreCase("breTitle")) {
                        searchBuilder.and(brdEvent.breTitle.contains(searchKeyword));
                    } else {
                        searchBuilder.and(brdEvent.breContent.contains(searchKeyword));
                    }
                } else {
                    searchBuilder.or(brdEvent.breTitle.contains(searchKeyword));
                    searchBuilder.or(brdEvent.breContent.contains(searchKeyword));
                }
            }

            if(bmRole != 0) searchBuilder.and(brdEvent.breShow.eq(1));
            searchBuilder.and(brdEvent.breActive.eq(1));

            //Order 정렬
            OrderSpecifier orderSpecifier = brdEvent.breStartDate.desc();
            String column = order.getColumn();
            String orderType = order.getOrder();

            if (StringUtils.isNotEmpty(order.getColumn())) {
                if(column.equals("bmLoginId")) {
                    orderSpecifier = orderType.equals("asc") ? basManager.bmLoginId.asc() : basManager.bmLoginId.desc();
                } else if(column.equals("breTerm")) {
                    orderSpecifier = orderType.equals("asc") ? brdEvent.breStartDate.asc() : brdEvent.breStartDate.desc();
                } else if(column.equals("breTitle")) {
                    orderSpecifier = orderType.equals("asc") ? brdEvent.breTitle.asc() : brdEvent.breTitle.desc();
                } else if(column.equals("breInsertDtm")) {
                    orderSpecifier = orderType.equals("asc") ? brdEvent.breInsertDtm.asc() : brdEvent.breInsertDtm.desc();
                } else if(column.equals("breShow")) {
                    orderSpecifier = orderType.equals("asc") ? brdEvent.breShow.asc() : brdEvent.breShow.desc();
                }
            }

            return queryFactory.select(Projections.constructor(BrdEventData.class
                    , brdEvent.breId
                    , brdEvent.breStartDate
                    , brdEvent.breEndDate
                    , brdEvent.breTitle
                    , brdEvent.breContent
                    , brdEvent.breBmId
                    , basManager.bmLoginId
                    , brdEvent.breShow
                    , brdEvent.breActive
                    , brdEvent.breInsertDtm
            ))

                    .from(brdEvent)
                    .leftJoin(basManager)
                    .on(brdEvent.breBmId.eq(basManager.bmId))
                    .where(searchBuilder)
                    .offset(start)
                    .limit(length)
                    .orderBy(orderSpecifier)
                    .fetchResults();
        }
    }
}
*/
