package com.trism.jesica.dto;

import com.querydsl.core.types.Order;
import com.querydsl.core.types.OrderSpecifier;
import com.querydsl.core.types.dsl.Expressions;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.servlet.http.HttpServletRequest;


@Getter
@NoArgsConstructor
@AllArgsConstructor
public class DataTableDTO {
    private int start = 0;
    private int length = 10;
    private String orderColumn;
    private String orderColumnName;
    private Order orderDir;
    private boolean useOrder = false;

    public void setStart(int start) {
        this.start = Math.max(start, 0);
    }

    public void setLength(int length) {
        this.length = Math.max(length, 0);
    }

    public void setOrder(HttpServletRequest request) {
        if (request.getParameter("order[0][column]") != null && request.getParameter("order[0][dir]") != null) {
            this.orderColumn = request.getParameter("order[0][column]");
            this.orderColumnName = request.getParameter("columns[" + orderColumn + "][data]");

            String orderDirection = request.getParameter("order[0][dir]");
            if ("asc".equals(orderDirection)) {
                this.orderDir = Order.ASC;
            } else if ("desc".equals(orderDirection)) {
                this.orderDir = Order.DESC;
            }

            this.useOrder = true;
        }
    }

    public OrderSpecifier<?> orderBy(String columnName, Order order) {
        if (this.isUseOrder()) {
            return new OrderSpecifier(this.getOrderDir(), Expressions.stringPath(this.getOrderColumnName()));
        } else {
            return new OrderSpecifier(order, Expressions.stringPath(columnName));
        }
    }
}
