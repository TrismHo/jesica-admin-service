
package com.trism.jesica.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.trism.jesica.persistence.oracle.Entity.MnA1Today;
import com.trism.jesica.persistence.oracle.Entity.MnGrSt;
import com.trism.jesica.persistence.oracle.Repository.MnA1TodayRepository;
import com.trism.jesica.persistence.oracle.Repository.MnGrStRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.driver.OracleConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.sql.Array;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@RequiredArgsConstructor
@Service
@Slf4j
public class OracleService {

    @Autowired
    private JdbcTemplate oracleJdbcTemplate;
    @Autowired
    private SimpleJdbcCall oracleSimpleJdbcCall;
    private final MnA1TodayRepository mnA1TodayRepository;

    private final MnGrStRepository mnGrStRepository;

    @Transactional(readOnly = true, value="oracleTransactionManager")
    public MnA1Today oracleTest() {
        Optional<MnA1Today> optional = mnA1TodayRepository.findById("240624000064");
        return optional.get();
    }

    @Transactional(readOnly = true, value="oracleTransactionManager")
    @PostConstruct
    public void init() {
        // SimpleJdbcCall 초기화
        this.oracleSimpleJdbcCall = new SimpleJdbcCall(oracleJdbcTemplate)
                .withProcedureName("SP_SV_API_APP_CU_MS")
                .declareParameters(
                        // 입력 파라미터 선언
                        new SqlParameter("in_REQ_NUM", Types.VARCHAR),
                        new SqlParameter("in_LANGUAGE", Types.VARCHAR),
                        new SqlParameter("in_DEVICE", Types.VARCHAR),
                        new SqlParameter("in_SERVICE_YN", Types.VARCHAR),
                        new SqlParameter("in_VALUE", Types.CLOB),
                        new SqlParameter("in_INFO", Types.VARCHAR),
                        new SqlParameter("in_ARRAY_STR1", Types.ARRAY),
                        new SqlParameter("in_ARRAY_STR2", Types.ARRAY),
                        new SqlParameter("in_ARRAY_STR3", Types.ARRAY),
                        new SqlParameter("in_ARRAY_NUM1", Types.ARRAY),
                        new SqlParameter("in_ARRAY_NUM2", Types.ARRAY),
                        new SqlParameter("in_ARRAY_NUM3", Types.ARRAY),

                        // 출력 파라미터 선언
                        new SqlOutParameter("out_CODE", Types.NUMERIC),
                        new SqlOutParameter("out_MSG", Types.VARCHAR),
                        new SqlOutParameter("out_VALUE", Types.VARCHAR),
                        new SqlOutParameter("out_ROW1", oracle.jdbc.OracleTypes.CURSOR),
                        new SqlOutParameter("out_ROW2", oracle.jdbc.OracleTypes.CURSOR),
                        new SqlOutParameter("out_ROW3", oracle.jdbc.OracleTypes.CURSOR),
                        new SqlOutParameter("out_ROW4", oracle.jdbc.OracleTypes.CURSOR),
                        new SqlOutParameter("out_ROW5", oracle.jdbc.OracleTypes.CURSOR)
                );
    }

    public Map<String, Object> callProcedure(Map<String, Object> inputParams) throws JsonProcessingException, SQLException {
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, String> jsonMap = new HashMap<>();
        jsonMap.put("custNo", "490");
        jsonMap.put("ordPathCd", "1069");

        String jsonValue = objectMapper.writeValueAsString(jsonMap);
        Connection conn = oracleJdbcTemplate.getDataSource().getConnection();
        Array emptyArray = conn.unwrap(OracleConnection.class).createARRAY("DTP_TBL_VARCHAR2", new String[]{});
        Array emptyArray2 = conn.unwrap(OracleConnection.class).createARRAY("DTP_TBL_NUMBER", new String[]{});

        // 프로시저에 전달할 입력 파라미터 설정
        Map<String, Object> inParams = new HashMap<>();
        inParams.put("in_REQ_NUM", inputParams.get("in_REQ_NUM"));
        inParams.put("in_LANGUAGE", inputParams.get("in_LANGUAGE"));
        inParams.put("in_DEVICE", inputParams.get("in_DEVICE"));
        inParams.put("in_SERVICE_YN", inputParams.get("in_SERVICE_YN"));
        inParams.put("in_VALUE", jsonValue);
        inParams.put("in_INFO", inputParams.get("in_INFO"));
        inParams.put("in_ARRAY_STR1", emptyArray);
        inParams.put("in_ARRAY_STR2", emptyArray);
        inParams.put("in_ARRAY_STR3", emptyArray);
        inParams.put("in_ARRAY_NUM1", emptyArray2);
        inParams.put("in_ARRAY_NUM2", emptyArray2);
        inParams.put("in_ARRAY_NUM3", emptyArray2);

        // 프로시저 실행 및 결과 받기
        Map<String, Object> outParams = oracleSimpleJdbcCall.execute(inParams);

        // 결과를 반환
        return outParams;
    }

    @Transactional(readOnly = true, value = "oracleTransactionManager")
    public MnGrSt findStore(String stCode) {
        return mnGrStRepository
                .findByStCodeAndDataStatus(stCode, "1")
                .orElse(null);
    }
}


