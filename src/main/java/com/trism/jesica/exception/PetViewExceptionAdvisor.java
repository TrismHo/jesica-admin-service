package com.trism.jesica.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Slf4j
@RestControllerAdvice
public class PetViewExceptionAdvisor {

    @ExceptionHandler(HttpMessageNotReadableException.class)
    public ResponseEntity<String> exceptions(HttpMessageNotReadableException e) {
        log.info("ee={}", e.getHttpInputMessage());
        log.info("exp={}", e.getMessage());
        return new ResponseEntity<String>(HttpStatus.OK);
    }
}
