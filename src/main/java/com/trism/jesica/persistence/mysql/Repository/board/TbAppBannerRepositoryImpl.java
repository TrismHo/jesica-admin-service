package com.trism.jesica.persistence.mysql.Repository.board;

import com.trism.jesica.persistence.mysql.Entitiy.board.TbAppBanner;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.*;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import javax.persistence.criteria.*;
import java.util.*;

@Repository
@RequiredArgsConstructor
public class TbAppBannerRepositoryImpl implements TbAppBannerRepositoryCustom {

    private final EntityManager em;

    @Override
    public Page<Long> findAllIds(Specification<TbAppBanner> spec, Pageable pageable) {
        CriteriaBuilder cb = em.getCriteriaBuilder();

        // content query
        CriteriaQuery<Long> cq = cb.createQuery(Long.class);
        Root<TbAppBanner> root = cq.from(TbAppBanner.class);
        cq.select(root.get("bannerNo"));

        Predicate p = spec.toPredicate(root, cq, cb);
        if (p != null) cq.where(p);

        // sort
        List<Order> orders = new ArrayList<>();
        for (Sort.Order s : pageable.getSort()) {
            Path<Object> path = root.get(s.getProperty());
            orders.add(s.isAscending() ? cb.asc(path) : cb.desc(path));
        }
        if (!orders.isEmpty()) cq.orderBy(orders);

        TypedQuery<Long> q = em.createQuery(cq);
        q.setFirstResult((int) pageable.getOffset());
        q.setMaxResults(pageable.getPageSize());
        List<Long> ids = q.getResultList();

        // count query
        CriteriaQuery<Long> countCq = cb.createQuery(Long.class);
        Root<TbAppBanner> countRoot = countCq.from(TbAppBanner.class);
        countCq.select(cb.count(countRoot));

        Predicate cp = spec.toPredicate(countRoot, countCq, cb);
        if (cp != null) countCq.where(cp);

        Long total = em.createQuery(countCq).getSingleResult();

        return new PageImpl<>(ids, pageable, total);
    }
}
