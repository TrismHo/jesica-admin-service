package com.trism.jesica.exception;

public enum ErrorCode {

	/* redirect to return.jsp */
	BAD_CONFIRM(1000, "입력값이 올바르지 않거나 없습니다."),
	PWD_CONFIRM_MISMATCH(1001, "비밀번호 입력값이 일치하지 않습니다."),
	NOT_MAPPING(3001, "안심번호 매핑에 실패하였습니다."),

	/* error.jsp */
	BAD_PARAMETER(2000, "잘못된 요청입니다."),
	BAD_REQUEST(2001, "처리중 오류가 발생하였습니다. 관리자에 문의 바랍니다.");

	private int errorNumber;
	private String errorMessage;
	
	private ErrorCode(int errorNumber, String errorMessage) {
		this.errorNumber = errorNumber;
		this.errorMessage = errorMessage;
	}
	
	public int getNumber() {
		return errorNumber;
	}
	
	public String getMessage() {
		return errorMessage;
	}
}
