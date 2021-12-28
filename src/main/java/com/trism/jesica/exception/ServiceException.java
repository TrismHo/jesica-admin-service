package com.trism.jesica.exception;

@SuppressWarnings("serial")
public class ServiceException extends RuntimeException {
	private ErrorCode errorCode;

	public ServiceException(ErrorCode errorCode) {
		super(errorCode.getMessage());
		this.errorCode = errorCode;
	}
	
	public int getErrorNumber() {
		return errorCode.getNumber();
	}
	
	public String getErrorMessage() {
		return errorCode.getMessage();
	}
}
