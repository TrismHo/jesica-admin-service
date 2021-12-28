package com.trism.jesica.Util;

import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.filter.Filter;
import ch.qos.logback.core.spi.FilterReply;

public class RoleLogFilter extends Filter<ILoggingEvent> {


    //DENY : 로그 이벤트 동작을 취소하며, 남아있는 Filter들에 대하여 검증하지 않는다
    //NEUTRAL : 남아있는 다음 Filter에게 검증을 넘긴다. 만약 남아있는 Filter가 없다면 로그 이벤트가 정상적으로 동작된다.
    //ACCEPT : 로그 이벤트를 정상적으로 동작 시키며, 남아있는 Filter들에 대하여 검증하지 않는다.



    //포함하는것만 로그생성
    @Override
    public FilterReply decide(ILoggingEvent event) {
        if (event.getMessage().contains("Update_role")) {
            return FilterReply.NEUTRAL;
        } else {
            return FilterReply.DENY;
        }
    }
}
