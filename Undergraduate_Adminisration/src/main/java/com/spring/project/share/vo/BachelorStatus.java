package com.spring.project.share.vo;

public enum BachelorStatus {
	ADDLEC_START("수강 신청 기간", 0),
	ADDLEC_END("수강 신청 종료", 4),
	OPEN_SEMESTER("개강", 1),
	INSERT_GRADE("학점 입력 기간", 2),
	CLOSE_SEMESTER("종강", 3);
	
	private String strValue;
	private int intValue;
	
	private BachelorStatus(String strValue, int intValue) {
		this.strValue = strValue;
		this.intValue = intValue;
	}

	public String getStrValue() {
		return strValue;
	}

	public int getIntValue() {
		return intValue;
	}

	public static BachelorStatus valueOf(int b_status) {
		BachelorStatus bachelorStatus = BachelorStatus.ADDLEC_START;
		
		switch(b_status) {
		case 0:
			bachelorStatus = BachelorStatus.ADDLEC_START;
			break;
		case 1:
			bachelorStatus = BachelorStatus.OPEN_SEMESTER;
			break;
		case 2:
			bachelorStatus = BachelorStatus.INSERT_GRADE;
			break;
		case 3:
			bachelorStatus = BachelorStatus.CLOSE_SEMESTER;
			break;
		case 4:
			bachelorStatus = BachelorStatus.ADDLEC_END;
			break;
		}
		
		return bachelorStatus;
	}
	
}
