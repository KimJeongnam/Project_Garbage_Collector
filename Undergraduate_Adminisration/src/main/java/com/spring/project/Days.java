package com.spring.project;

public enum Days {
	SUN("일", -1),
	MON("월", 0),
	THE("화", 1),
	WED("수", 2),
	THU("목", 3),
	FRI("금", 4),
	SAT("토", 5),
	EMPTY("없음", -100);
	
	
	private String days1Value;
	private int days2Value;
	
	Days(String days1Value, int days2Value) {
		this.days1Value = days1Value;
		this.days2Value = days2Value;
	}

	public String getDays1Value() {
		return days1Value;
	}

	public int getDays2Value() {
		return days2Value;
	}
	
	public Days valueOf(int day) {
		Days eday = null;
		
		switch(day) {
		case -1:
			eday = Days.SUN;
			break;
		case 0:
			eday = Days.MON;
			break;
		case 1:
			eday = Days.THE;
			break;
		case 2:
			eday = Days.WED;
			break;
		case 3:
			eday = Days.THU;
			break;
		case 4:
			eday = Days.FRI;
			break;
		case 5:
			eday = Days.SAT;
			break;
		}
		
		return eday;
	}
	
	public int stringOf(String day) {
		Days eday = null;
		
		switch(day) {
		case "일":
			eday = Days.SUN;
			break;
		case "월":
			eday = Days.MON;
			break;
		case "화":
			eday = Days.THE;
			break;
		case "수":
			eday = Days.WED;
			break;
		case "목":
			eday = Days.THU;
			break;
		case "금":
			eday = Days.FRI;
			break;
		case "토":
			eday = Days.SAT;
			break;
		}
		
		return eday.getDays2Value();
	}
}

	
