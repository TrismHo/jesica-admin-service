package com.trism.jesica.persistence.mysql.Repository.board;

import com.trism.jesica.persistence.mysql.Entitiy.board.TbAppBanner;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Order;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

@Repository
public class TbAppBannerRepositoryImpl implements TbAppBannerRepositoryCustom {

    @PersistenceContext(unitName = "mysql")
    private EntityManager em;

    @Override
    public Page<Long> findAllIds(
            Specification<TbAppBanner> spec,
            Pageable pageable
    ) {
        CriteriaBuilder cb = em.getCriteriaBuilder();

        // =========================
        // Content Query
        // =========================
        CriteriaQuery<Long> cq = cb.createQuery(Long.class);

        Root<TbAppBanner> root = cq.from(TbAppBanner.class);

        cq.select(root.get("bannerNo"));

        if (spec != null) {
            Predicate p = spec.toPredicate(root, cq, cb);

            if (p != null) {
                cq.where(p);
            }
        }

        // =========================
        // Sort
        // =========================
        List<Order> orders = new ArrayList<>();

        for (Sort.Order s : pageable.getSort()) {

            Path<Object> path = root.get(s.getProperty());

            orders.add(
                    s.isAscending()
                            ? cb.asc(path)
                            : cb.desc(path)
            );
        }

        if (!orders.isEmpty()) {
            cq.orderBy(orders);
        }

        TypedQuery<Long> query = em.createQuery(cq);

        query.setFirstResult(
                (int) pageable.getOffset()
        );

        query.setMaxResults(
                pageable.getPageSize()
        );

        List<Long> ids = query.getResultList();

        // =========================
        // Count Query
        // =========================
        CriteriaQuery<Long> countCq =
                cb.createQuery(Long.class);

        Root<TbAppBanner> countRoot =
                countCq.from(TbAppBanner.class);

        countCq.select(
                cb.count(countRoot)
        );

        if (spec != null) {

            Predicate cp =
                    spec.toPredicate(
                            countRoot,
                            countCq,
                            cb
                    );

            if (cp != null) {
                countCq.where(cp);
            }
        }

        Long total =
                em.createQuery(countCq)
                        .getSingleResult();

        return new PageImpl<>(
                ids,
                pageable,
                total
        );
    }
}
