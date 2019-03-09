package com.spring.project.student.vo;

import java.util.Arrays;

public enum ScholarStatus {
	FALSE("불합격", 0),
	TRUE("합격", 1),
	UNDER_PROCESSING("심사중", 2);
	
	private String strValue;
	private int intValue;
	
	private ScholarStatus(String strValue, int intValue) {
		this.strValue = strValue;
		this.intValue = intValue;
	}

	public String getStrValue() {
		return strValue;
	}

	public int getIntValue() {
		return intValue;
	}
	
	public ScholarStatus findByType(int value) {
		return Arrays.stream(ScholarStatus.values())
				.filter(scholarStatus -> scholarStatus.hasValue(value))
				.findAny()
				.orElse(null);
	}
	
	public boolean hasValue(int value) {return value==intValue;}
	
}
