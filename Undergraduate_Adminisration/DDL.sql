DROP INDEX UIX_studentClassInfo;

DROP INDEX UIX_lectureTime;

DROP INDEX UIX_paymentCode;

DROP INDEX UIX_registerDetail;

/* 학생 */
DROP TABLE student 
	CASCADE CONSTRAINTS;

/* 교직원 */
DROP TABLE employees 
	CASCADE CONSTRAINTS;

/* 관리자 */
DROP TABLE TABLE3 
	CASCADE CONSTRAINTS;

/* 강의 */
DROP TABLE lecture 
	CASCADE CONSTRAINTS;

/* 장학금 */
DROP TABLE scholarship 
	CASCADE CONSTRAINTS;

/* 새 테이블 */
DROP TABLE TABLE6 
	CASCADE CONSTRAINTS;

/* 지원자 */
DROP TABLE TABLE7 
	CASCADE CONSTRAINTS;

/* 교직원 */
DROP TABLE TABLE8 
	CASCADE CONSTRAINTS;

/* 성적 */
DROP TABLE GPA 
	CASCADE CONSTRAINTS;

/* 학적 */
DROP TABLE studentState 
	CASCADE CONSTRAINTS;

/* 학과 */
DROP TABLE major 
	CASCADE CONSTRAINTS;

/* 학생 수강 정보 */
DROP TABLE studentClassInfo 
	CASCADE CONSTRAINTS;

/* 교수 강의 정보 */
DROP TABLE TABLE13 
	CASCADE CONSTRAINTS;

/* 학점 */
DROP TABLE credit 
	CASCADE CONSTRAINTS;

/* 단과대 */
DROP TABLE faculty 
	CASCADE CONSTRAINTS;

/* 장학정보 */
DROP TABLE scholarshipInfo 
	CASCADE CONSTRAINTS;

/* 장학금 상태 */
DROP TABLE scholarState 
	CASCADE CONSTRAINTS;

/* USERS */
DROP TABLE users 
	CASCADE CONSTRAINTS;

/* 권한 */
DROP TABLE authority 
	CASCADE CONSTRAINTS;

/* 새 테이블2 */
DROP TABLE TABLE20 
	CASCADE CONSTRAINTS;

/* 교직원 코드 */
DROP TABLE employeesCode 
	CASCADE CONSTRAINTS;

/* 메뉴 코드 */
DROP TABLE TABLE22 
	CASCADE CONSTRAINTS;

/* 계좌 정보 */
DROP TABLE accountInfo 
	CASCADE CONSTRAINTS;

/* 급여 */
DROP TABLE TABLE24 
	CASCADE CONSTRAINTS;

/* 수당 항목 */
DROP TABLE incentiveMenu 
	CASCADE CONSTRAINTS;

/* 시간표 */
DROP TABLE timetable 
	CASCADE CONSTRAINTS;

/* 요일 */
DROP TABLE day 
	CASCADE CONSTRAINTS;

/* 강의 시간 */
DROP TABLE lectureTime 
	CASCADE CONSTRAINTS;

/* 수당 */
DROP TABLE TABLE29 
	CASCADE CONSTRAINTS;

/* 급여 코드 */
DROP TABLE paymentCode 
	CASCADE CONSTRAINTS;

/* 급여대장  */
DROP TABLE paymentList 
	CASCADE CONSTRAINTS;

/* 급여 대장 상세 내용 */
DROP TABLE registerDetail 
	CASCADE CONSTRAINTS;

/* 수강 신청 기간  */
DROP TABLE lectureSelectPeriod 
	CASCADE CONSTRAINTS;

/* 휴복학 내역 */
DROP TABLE schoolLeave 
	CASCADE CONSTRAINTS;

/* 등록금 */
DROP TABLE TABLE4 
	CASCADE CONSTRAINTS;

/* 학생 */
CREATE TABLE student (
	userNumber NVARCHAR2(9) NOT NULL, /* 사용자 번호 */
	majorNum NUMBER NOT NULL, /* 학과 번호 */
	stdName NVARCHAR2(30), /* 이름 */
	stdImage NVARCHAR2(150), /* 사진 */
	stdGrade NUMBER(1), /* 학년 */
	stdSsn NVARCHAR2(20), /* 주민등록번호 */
	stdCellNumber NVARCHAR2(20), /* 핸드폰 번호 */
	stdEmail NVARCHAR2(50), /* 이메일 */
	stdZipCode NVARCHAR2(10), /* 우편번호 */
	stdAddr1 NVARCHAR2(100), /* 주소1 */
	stdAddr2 NVARCHAR2(100), /* 주소2 */
	adDate DATE, /* 입학일 */
	graDate DATE, /* 졸업일 */
	delStatus NUMBER(1) /* 삭제상태 */
);

COMMENT ON TABLE student IS '학생';

COMMENT ON COLUMN student.userNumber IS '사용자 번호';

COMMENT ON COLUMN student.majorNum IS '학과 번호';

COMMENT ON COLUMN student.stdName IS '이름';

COMMENT ON COLUMN student.stdImage IS '사진';

COMMENT ON COLUMN student.stdGrade IS '학년';

COMMENT ON COLUMN student.stdSsn IS '주민등록번호';

COMMENT ON COLUMN student.stdCellNumber IS '핸드폰 번호';

COMMENT ON COLUMN student.stdEmail IS '이메일';

COMMENT ON COLUMN student.stdZipCode IS '우편번호';

COMMENT ON COLUMN student.stdAddr1 IS '주소1';

COMMENT ON COLUMN student.stdAddr2 IS '주소2';

COMMENT ON COLUMN student.adDate IS '입학일';

COMMENT ON COLUMN student.graDate IS '졸업일';

COMMENT ON COLUMN student.delStatus IS '삭제상태';

CREATE UNIQUE INDEX PK_student
	ON student (
		userNumber ASC
	);

ALTER TABLE student
	ADD
		CONSTRAINT PK_student
		PRIMARY KEY (
			userNumber
		);

/* 교직원 */
CREATE TABLE employees (
	userNumber NVARCHAR2(9) NOT NULL, /* 사용자 번호 */
	empCode NVARCHAR2(10) NOT NULL, /* 교직원 코드  */
	majorNum NUMBER NOT NULL, /* 학과 번호 */
	empName NVARCHAR2(30), /* 이름 */
	empEngName NVARCHAR2(50), /* 영문성명 */
	empImage NVARCHAR2(150), /* 사진 */
	empSsn NVARCHAR2(20), /* 주민등록 번호 */
	empCellNumber NVARCHAR2(20), /* 핸드폰 번호 */
	empEmail NVARCHAR2(50), /* 이메일 */
	empZipCode NVARCHAR2(10), /* 우편번호 */
	empAddress1 NVARCHAR2(100), /* 주소1 */
	empAddress2 NVARCHAR2(100), /* 주소2 */
	empHiredDate DATE, /* 입사일 */
	annualLevel NUMBER, /* 연차 */
	introduction NVARCHAR2(3500), /*  소개 */
	delStatus NUMBER(1) /* 삭제상태 */
);

COMMENT ON TABLE employees IS '교직원';

COMMENT ON COLUMN employees.userNumber IS '사용자 번호';

COMMENT ON COLUMN employees.empCode IS '교직원 코드 ';

COMMENT ON COLUMN employees.majorNum IS '학과 번호';

COMMENT ON COLUMN employees.empName IS '이름';

COMMENT ON COLUMN employees.empEngName IS '영문성명';

COMMENT ON COLUMN employees.empImage IS '사진';

COMMENT ON COLUMN employees.empSsn IS '주민등록 번호';

COMMENT ON COLUMN employees.empCellNumber IS '핸드폰 번호';

COMMENT ON COLUMN employees.empEmail IS '이메일';

COMMENT ON COLUMN employees.empZipCode IS '우편번호';

COMMENT ON COLUMN employees.empAddress1 IS '주소1';

COMMENT ON COLUMN employees.empAddress2 IS '주소2';

COMMENT ON COLUMN employees.empHiredDate IS '입사일';

COMMENT ON COLUMN employees.annualLevel IS '연차';

COMMENT ON COLUMN employees.introduction IS ' 소개';

COMMENT ON COLUMN employees.delStatus IS '삭제상태';

CREATE UNIQUE INDEX PK_employees
	ON employees (
		userNumber ASC
	);

ALTER TABLE employees
	ADD
		CONSTRAINT PK_employees
		PRIMARY KEY (
			userNumber
		);

/* 관리자 */
CREATE TABLE TABLE3 (
	COL <지정 되지 않음> NOT NULL /* 관리자ID */
);

COMMENT ON TABLE TABLE3 IS '관리자';

COMMENT ON COLUMN TABLE3.COL IS '관리자ID';

CREATE UNIQUE INDEX PK_TABLE3
	ON TABLE3 (
		COL ASC
	);

ALTER TABLE TABLE3
	ADD
		CONSTRAINT PK_TABLE3
		PRIMARY KEY (
			COL
		);

/* 강의 */
CREATE TABLE lecture (
	lecCode NVARCHAR2(10) NOT NULL, /* 강의번호 */
	majorNum NUMBER NOT NULL, /* 학과 번호 */
	userNumber NVARCHAR2(9) NOT NULL, /* 사용자 번호 */
	lectureName NVARCHAR2(20), /* 강의명 */
	lectureClassfication NVARCHAR2(10), /* 구분 */
	maximumCapacity NUMBER(5), /* 최대 인원수 */
	grade NUMBER(1), /* 학년 */
	grantedSemester NUMBER(1), /* 학기 */
	lectureScore NUMBER(1), /* 학점 */
	classRoom NVARCHAR2(30) /* 강의실 */
);

COMMENT ON TABLE lecture IS '강의';

COMMENT ON COLUMN lecture.lecCode IS '강의번호';

COMMENT ON COLUMN lecture.majorNum IS '학과 번호';

COMMENT ON COLUMN lecture.userNumber IS '사용자 번호';

COMMENT ON COLUMN lecture.lectureName IS '강의명';

COMMENT ON COLUMN lecture.lectureClassfication IS '구분';

COMMENT ON COLUMN lecture.maximumCapacity IS '최대 인원수';

COMMENT ON COLUMN lecture.grade IS '학년';

COMMENT ON COLUMN lecture.grantedSemester IS '학기';

COMMENT ON COLUMN lecture.lectureScore IS '학점';

COMMENT ON COLUMN lecture.classRoom IS '강의실';

CREATE UNIQUE INDEX PK_lecture
	ON lecture (
		lecCode ASC
	);

ALTER TABLE lecture
	ADD
		CONSTRAINT PK_lecture
		PRIMARY KEY (
			lecCode
		);

/* 장학금 */
CREATE TABLE scholarship (
	scholarPk NUMBER NOT NULL, /* 장학금번호 */
	scholarName NVARCHAR2(20), /* 장학금명 */
	Year DATE, /* 년도 */
	semester NUMBER(1), /* 학기 */
	kind NVARCHAR2(20), /* 구분 */
	amount NUMBER /* 신청금액 */
);

COMMENT ON TABLE scholarship IS '장학금';

COMMENT ON COLUMN scholarship.scholarPk IS '장학금번호';

COMMENT ON COLUMN scholarship.scholarName IS '장학금명';

COMMENT ON COLUMN scholarship.Year IS '년도';

COMMENT ON COLUMN scholarship.semester IS '학기';

COMMENT ON COLUMN scholarship.kind IS '구분';

COMMENT ON COLUMN scholarship.amount IS '신청금액';

CREATE UNIQUE INDEX PK_scholarship
	ON scholarship (
		scholarPk ASC
	);

ALTER TABLE scholarship
	ADD
		CONSTRAINT PK_scholarship
		PRIMARY KEY (
			scholarPk
		);

/* 새 테이블 */
CREATE TABLE TABLE6 (
);

COMMENT ON TABLE TABLE6 IS '새 테이블';

/* 지원자 */
CREATE TABLE TABLE7 (
	COL <지정 되지 않음> NOT NULL, /* 지원자번호 */
	majorNum NUMBER NOT NULL, /* 학과 번호 */
	COL2 <지정 되지 않음>, /* 이름 */
	COL3 <지정 되지 않음>, /* 성적 */
	COL4 <지정 되지 않음> /* 지원날짜 */
);

COMMENT ON TABLE TABLE7 IS '지원자';

COMMENT ON COLUMN TABLE7.COL IS '지원자번호';

COMMENT ON COLUMN TABLE7.majorNum IS '학과 번호';

COMMENT ON COLUMN TABLE7.COL2 IS '이름';

COMMENT ON COLUMN TABLE7.COL3 IS '성적';

COMMENT ON COLUMN TABLE7.COL4 IS '지원날짜';

CREATE UNIQUE INDEX PK_TABLE7
	ON TABLE7 (
		COL ASC,
		majorNum ASC
	);

ALTER TABLE TABLE7
	ADD
		CONSTRAINT PK_TABLE7
		PRIMARY KEY (
			COL,
			majorNum
		);

/* 교직원 */
CREATE TABLE TABLE8 (
	COL <지정 되지 않음> NOT NULL, /* 교직원번호 */
	COL2 <지정 되지 않음> /* 타입 */
);

COMMENT ON TABLE TABLE8 IS '교직원';

COMMENT ON COLUMN TABLE8.COL IS '교직원번호';

COMMENT ON COLUMN TABLE8.COL2 IS '타입';

CREATE UNIQUE INDEX PK_TABLE8
	ON TABLE8 (
		COL ASC
	);

ALTER TABLE TABLE8
	ADD
		CONSTRAINT PK_TABLE8
		PRIMARY KEY (
			COL
		);

/* 성적 */
CREATE TABLE GPA (
	credit NVARCHAR2(3) NOT NULL, /* 학점 */
	infoCode NUMBER NOT NULL /* 수강정보 코드 */
);

COMMENT ON TABLE GPA IS '성적';

COMMENT ON COLUMN GPA.credit IS '학점';

COMMENT ON COLUMN GPA.infoCode IS '수강정보 코드';

CREATE UNIQUE INDEX PK_GPA
	ON GPA (
		credit ASC,
		infoCode ASC
	);

ALTER TABLE GPA
	ADD
		CONSTRAINT PK_GPA
		PRIMARY KEY (
			credit,
			infoCode
		);

/* 학적 */
CREATE TABLE studentState (
	userNumber NVARCHAR2(9) NOT NULL, /* 사용자 번호 */
	grade NUMBER(1), /* 학년 */
	semester NUMBER(1), /* 학기 */
	graduation_state NUMBER(1) /* 줄업 여부 */
);

COMMENT ON TABLE studentState IS '학적';

COMMENT ON COLUMN studentState.userNumber IS '사용자 번호';

COMMENT ON COLUMN studentState.grade IS '학년';

COMMENT ON COLUMN studentState.semester IS '학기';

COMMENT ON COLUMN studentState.graduation_state IS '줄업 여부';

CREATE UNIQUE INDEX PK_studentState
	ON studentState (
		userNumber ASC
	);

ALTER TABLE studentState
	ADD
		CONSTRAINT PK_studentState
		PRIMARY KEY (
			userNumber
		);

/* 학과 */
CREATE TABLE major (
	majorNum NUMBER NOT NULL, /* 학과 번호 */
	faculty NVARCHAR2(20) NOT NULL, /* 단과대명 */
	majorName NVARCHAR2(50), /* 학과명 */
	maxNum NUMBER /* 최대인원수 */
);

COMMENT ON TABLE major IS '학과';

COMMENT ON COLUMN major.majorNum IS '학과 번호';

COMMENT ON COLUMN major.faculty IS '단과대명';

COMMENT ON COLUMN major.majorName IS '학과명';

COMMENT ON COLUMN major.maxNum IS '최대인원수';

CREATE UNIQUE INDEX PK_major
	ON major (
		majorNum ASC
	);

ALTER TABLE major
	ADD
		CONSTRAINT PK_major
		PRIMARY KEY (
			majorNum
		);

/* 학생 수강 정보 */
CREATE TABLE studentClassInfo (
	infoCode NUMBER NOT NULL, /* 수강정보 코드 */
	lecCode NVARCHAR2(10) NOT NULL, /* 강의번호 */
	userNumber NVARCHAR2(9) NOT NULL, /* 사용자 번호 */
	COL4 NUMBER(1) /* 상태 */
);

COMMENT ON TABLE studentClassInfo IS '학생 수강 정보';

COMMENT ON COLUMN studentClassInfo.infoCode IS '수강정보 코드';

COMMENT ON COLUMN studentClassInfo.lecCode IS '강의번호';

COMMENT ON COLUMN studentClassInfo.userNumber IS '사용자 번호';

COMMENT ON COLUMN studentClassInfo.COL4 IS '상태';

CREATE UNIQUE INDEX PK_studentClassInfo
	ON studentClassInfo (
		infoCode ASC
	);

CREATE UNIQUE INDEX UIX_studentClassInfo
	ON studentClassInfo (
		lecCode ASC,
		userNumber ASC
	);

ALTER TABLE studentClassInfo
	ADD
		CONSTRAINT PK_studentClassInfo
		PRIMARY KEY (
			infoCode
		);

ALTER TABLE studentClassInfo
	ADD
		CONSTRAINT UK_studentClassInfo
		UNIQUE (
			lecCode,
			userNumber
		);

/* 교수 강의 정보 */
CREATE TABLE TABLE13 (
	lecCode NVARCHAR2(10) NOT NULL /* 강의번호 */
);

COMMENT ON TABLE TABLE13 IS '교수 강의 정보';

COMMENT ON COLUMN TABLE13.lecCode IS '강의번호';

CREATE UNIQUE INDEX PK_TABLE13
	ON TABLE13 (
		lecCode ASC
	);

ALTER TABLE TABLE13
	ADD
		CONSTRAINT PK_TABLE13
		PRIMARY KEY (
			lecCode
		);

/* 학점 */
CREATE TABLE credit (
	credit NVARCHAR2(3) NOT NULL, /* 학점 */
	score NUMBER(1,1) /* 점수 */
);

COMMENT ON TABLE credit IS '학점';

COMMENT ON COLUMN credit.credit IS '학점';

COMMENT ON COLUMN credit.score IS '점수';

CREATE UNIQUE INDEX PK_credit
	ON credit (
		credit ASC
	);

ALTER TABLE credit
	ADD
		CONSTRAINT PK_credit
		PRIMARY KEY (
			credit
		);

/* 단과대 */
CREATE TABLE faculty (
	faculty NVARCHAR2(20) NOT NULL /* 단과대명 */
);

COMMENT ON TABLE faculty IS '단과대';

COMMENT ON COLUMN faculty.faculty IS '단과대명';

CREATE UNIQUE INDEX PK_faculty
	ON faculty (
		faculty ASC
	);

ALTER TABLE faculty
	ADD
		CONSTRAINT PK_faculty
		PRIMARY KEY (
			faculty
		);

/* 장학정보 */
CREATE TABLE scholarshipInfo (
	scholarPk NUMBER NOT NULL, /* 장학금번호 */
	userNumber NVARCHAR2(9) NOT NULL, /* 사용자 번호 */
	statCode NUMBER NOT NULL /* 상태 번호 */
);

COMMENT ON TABLE scholarshipInfo IS '장학정보';

COMMENT ON COLUMN scholarshipInfo.scholarPk IS '장학금번호';

COMMENT ON COLUMN scholarshipInfo.userNumber IS '사용자 번호';

COMMENT ON COLUMN scholarshipInfo.statCode IS '상태 번호';

CREATE UNIQUE INDEX PK_scholarshipInfo
	ON scholarshipInfo (
		scholarPk ASC,
		userNumber ASC
	);

ALTER TABLE scholarshipInfo
	ADD
		CONSTRAINT PK_scholarshipInfo
		PRIMARY KEY (
			scholarPk,
			userNumber
		);

/* 장학금 상태 */
CREATE TABLE scholarState (
	statCode NUMBER NOT NULL, /* 상태 번호 */
	scholarStatus NVARCHAR2(20) /* 상태명 */
);

COMMENT ON TABLE scholarState IS '장학금 상태';

COMMENT ON COLUMN scholarState.statCode IS '상태 번호';

COMMENT ON COLUMN scholarState.scholarStatus IS '상태명';

CREATE UNIQUE INDEX PK_scholarState
	ON scholarState (
		statCode ASC
	);

ALTER TABLE scholarState
	ADD
		CONSTRAINT PK_scholarState
		PRIMARY KEY (
			statCode
		);

/* USERS */
CREATE TABLE users (
	userNumber NVARCHAR2(9) NOT NULL, /* 사용자 번호 */
	userPassword NVARCHAR2(255) /* 비밀번호 */
);

COMMENT ON TABLE users IS 'USERS';

COMMENT ON COLUMN users.userNumber IS '사용자 번호';

COMMENT ON COLUMN users.userPassword IS '비밀번호';

CREATE UNIQUE INDEX PK_users
	ON users (
		userNumber ASC
	);

ALTER TABLE users
	ADD
		CONSTRAINT PK_users
		PRIMARY KEY (
			userNumber
		);

/* 권한 */
CREATE TABLE authority (
	authName NVARCHAR2(20) NOT NULL, /* 권한명 */
	userNumber NVARCHAR2(9) NOT NULL /* 사용자 번호 */
);

COMMENT ON TABLE authority IS '권한';

COMMENT ON COLUMN authority.authName IS '권한명';

COMMENT ON COLUMN authority.userNumber IS '사용자 번호';

CREATE UNIQUE INDEX PK_authority
	ON authority (
		authName ASC,
		userNumber ASC
	);

ALTER TABLE authority
	ADD
		CONSTRAINT PK_authority
		PRIMARY KEY (
			authName,
			userNumber
		);

/* 새 테이블2 */
CREATE TABLE TABLE20 (
);

COMMENT ON TABLE TABLE20 IS '새 테이블2';

/* 교직원 코드 */
CREATE TABLE employeesCode (
	empCode NVARCHAR2(10) NOT NULL, /* 교직원 코드  */
	employee NVARCHAR2(30) /* 교직원 명 */
);

COMMENT ON TABLE employeesCode IS '교직원 코드';

COMMENT ON COLUMN employeesCode.empCode IS '교직원 코드 ';

COMMENT ON COLUMN employeesCode.employee IS '교직원 명';

CREATE UNIQUE INDEX PK_employeesCode
	ON employeesCode (
		empCode ASC
	);

ALTER TABLE employeesCode
	ADD
		CONSTRAINT PK_employeesCode
		PRIMARY KEY (
			empCode
		);

/* 메뉴 코드 */
CREATE TABLE TABLE22 (
	COL <지정 되지 않음> NOT NULL, /* 메뉴코드 */
	COL2 <지정 되지 않음> /* 새 컬럼 */
);

COMMENT ON TABLE TABLE22 IS '메뉴 코드';

COMMENT ON COLUMN TABLE22.COL IS '메뉴코드';

COMMENT ON COLUMN TABLE22.COL2 IS '새 컬럼';

CREATE UNIQUE INDEX PK_TABLE22
	ON TABLE22 (
		COL ASC
	);

ALTER TABLE TABLE22
	ADD
		CONSTRAINT PK_TABLE22
		PRIMARY KEY (
			COL
		);

/* 계좌 정보 */
CREATE TABLE accountInfo (
	userNumber NVARCHAR2(9) NOT NULL, /* 사용자 번호 */
	bankName NVARCHAR2(50), /* 은행명 */
	accountNumber NVARCHAR2(50), /* 계좌번호 */
	accountHolder NVARCHAR2(30) /* 예금주 */
);

COMMENT ON TABLE accountInfo IS '계좌 정보';

COMMENT ON COLUMN accountInfo.userNumber IS '사용자 번호';

COMMENT ON COLUMN accountInfo.bankName IS '은행명';

COMMENT ON COLUMN accountInfo.accountNumber IS '계좌번호';

COMMENT ON COLUMN accountInfo.accountHolder IS '예금주';

CREATE UNIQUE INDEX PK_accountInfo
	ON accountInfo (
		userNumber ASC
	);

ALTER TABLE accountInfo
	ADD
		CONSTRAINT PK_accountInfo
		PRIMARY KEY (
			userNumber
		);

/* 급여 */
CREATE TABLE TABLE24 (
	userNumber NVARCHAR2(9) NOT NULL, /* 사용자 번호 */
	COL <지정 되지 않음>, /* 연차 */
	COL3 <지정 되지 않음> /* 기본급 */
);

COMMENT ON TABLE TABLE24 IS '급여';

COMMENT ON COLUMN TABLE24.userNumber IS '사용자 번호';

COMMENT ON COLUMN TABLE24.COL IS '연차';

COMMENT ON COLUMN TABLE24.COL3 IS '기본급';

CREATE UNIQUE INDEX PK_TABLE24
	ON TABLE24 (
		userNumber ASC
	);

ALTER TABLE TABLE24
	ADD
		CONSTRAINT PK_TABLE24
		PRIMARY KEY (
			userNumber
		);

/* 수당 항목 */
CREATE TABLE incentiveMenu (
	incentiveCode NUMBER NOT NULL, /* 수당코드 */
	incentiveName NVARCHAR2(10), /* 수당명 */
	incentiveIndex NUMBER, /* 표시순서 */
	dividendRate NUMBER(2,1) /* 배율 */
);

COMMENT ON TABLE incentiveMenu IS '수당 항목';

COMMENT ON COLUMN incentiveMenu.incentiveCode IS '수당코드';

COMMENT ON COLUMN incentiveMenu.incentiveName IS '수당명';

COMMENT ON COLUMN incentiveMenu.incentiveIndex IS '표시순서';

COMMENT ON COLUMN incentiveMenu.dividendRate IS '배율';

CREATE UNIQUE INDEX PK_incentiveMenu
	ON incentiveMenu (
		incentiveCode ASC
	);

ALTER TABLE incentiveMenu
	ADD
		CONSTRAINT PK_incentiveMenu
		PRIMARY KEY (
			incentiveCode
		);

/* 시간표 */
CREATE TABLE timetable (
	timetblCode NUMBER NOT NULL, /*  시간표 코드 */
	lectureDay NVARCHAR2(1) NOT NULL, /* 요일 */
	lectureTime NUMBER, /* 교시 */
	beginningLectureTime NVARCHAR2(5), /* 시작 시간 */
	endLectureTime NVARCHAR2(5) /* 종료 시간 */
);

COMMENT ON TABLE timetable IS '시간표';

COMMENT ON COLUMN timetable.timetblCode IS ' 시간표 코드';

COMMENT ON COLUMN timetable.lectureDay IS '요일';

COMMENT ON COLUMN timetable.lectureTime IS '교시';

COMMENT ON COLUMN timetable.beginningLectureTime IS '시작 시간';

COMMENT ON COLUMN timetable.endLectureTime IS '종료 시간';

CREATE UNIQUE INDEX PK_timetable
	ON timetable (
		timetblCode ASC
	);

ALTER TABLE timetable
	ADD
		CONSTRAINT PK_timetable
		PRIMARY KEY (
			timetblCode
		);

/* 요일 */
CREATE TABLE day (
	lectureDay NVARCHAR2(1) NOT NULL /* 요일 */
);

COMMENT ON TABLE day IS '요일';

COMMENT ON COLUMN day.lectureDay IS '요일';

CREATE UNIQUE INDEX PK_day
	ON day (
		lectureDay ASC
	);

ALTER TABLE day
	ADD
		CONSTRAINT PK_day
		PRIMARY KEY (
			lectureDay
		);

/* 강의 시간 */
CREATE TABLE lectureTime (
	lectureTimeCode NUMBER NOT NULL, /* 강의시간코드 */
	lecCode NVARCHAR2(10) NOT NULL, /* 강의번호 */
	timetblCode NUMBER NOT NULL /*  시간표 코드 */
);

COMMENT ON TABLE lectureTime IS '강의 시간';

COMMENT ON COLUMN lectureTime.lectureTimeCode IS '강의시간코드';

COMMENT ON COLUMN lectureTime.lecCode IS '강의번호';

COMMENT ON COLUMN lectureTime.timetblCode IS ' 시간표 코드';

CREATE UNIQUE INDEX PK_lectureTime
	ON lectureTime (
		lectureTimeCode ASC
	);

CREATE UNIQUE INDEX UIX_lectureTime
	ON lectureTime (
		lecCode ASC,
		timetblCode ASC
	);

ALTER TABLE lectureTime
	ADD
		CONSTRAINT PK_lectureTime
		PRIMARY KEY (
			lectureTimeCode
		);

ALTER TABLE lectureTime
	ADD
		CONSTRAINT UK_lectureTime
		UNIQUE (
			lecCode,
			timetblCode
		);

/* 수당 */
CREATE TABLE TABLE29 (
	userNumber NVARCHAR2(9) NOT NULL, /* 사용자 번호 */
	incentiveCode NUMBER NOT NULL /* 수당코드 */
);

COMMENT ON TABLE TABLE29 IS '수당';

COMMENT ON COLUMN TABLE29.userNumber IS '사용자 번호';

COMMENT ON COLUMN TABLE29.incentiveCode IS '수당코드';

CREATE UNIQUE INDEX PK_TABLE29
	ON TABLE29 (
		userNumber ASC,
		incentiveCode ASC
	);

ALTER TABLE TABLE29
	ADD
		CONSTRAINT PK_TABLE29
		PRIMARY KEY (
			userNumber,
			incentiveCode
		);

/* 급여 코드 */
CREATE TABLE paymentCode (
	paymentCode NUMBER NOT NULL, /* 급여 코드 */
	userNumber NVARCHAR2(9) NOT NULL, /* 사용자 번호 */
	incentiveCode NUMBER NOT NULL /* 수당코드 */
);

COMMENT ON TABLE paymentCode IS '급여 코드';

COMMENT ON COLUMN paymentCode.paymentCode IS '급여 코드';

COMMENT ON COLUMN paymentCode.userNumber IS '사용자 번호';

COMMENT ON COLUMN paymentCode.incentiveCode IS '수당코드';

CREATE UNIQUE INDEX PK_paymentCode
	ON paymentCode (
		paymentCode ASC
	);

CREATE UNIQUE INDEX UIX_paymentCode
	ON paymentCode (
		userNumber ASC,
		incentiveCode ASC
	);

ALTER TABLE paymentCode
	ADD
		CONSTRAINT PK_paymentCode
		PRIMARY KEY (
			paymentCode
		);

ALTER TABLE paymentCode
	ADD
		CONSTRAINT UK_paymentCode
		UNIQUE (
			userNumber,
			incentiveCode
		);

/* 급여대장  */
CREATE TABLE paymentList (
	paylistNum NUMBER NOT NULL, /* 급여대장 번호 */
	imputedYear DATE, /* 귀속 연월 */
	paymentClassfication NVARCHAR2(10), /* 급여 구분 */
	beginningPeriod DATE, /* 대상 시작 기간 */
	endPeriod DATE, /* 대상 종료 기간 */
	paymentDate DATE, /* 지급일 */
	paymentYear DATE, /* 지급 연월 */
	registerName NVARCHAR2(30) /* 대장 명칭 */
);

COMMENT ON TABLE paymentList IS '급여대장 ';

COMMENT ON COLUMN paymentList.paylistNum IS '급여대장 번호';

COMMENT ON COLUMN paymentList.imputedYear IS '귀속 연월';

COMMENT ON COLUMN paymentList.paymentClassfication IS '급여 구분';

COMMENT ON COLUMN paymentList.beginningPeriod IS '대상 시작 기간';

COMMENT ON COLUMN paymentList.endPeriod IS '대상 종료 기간';

COMMENT ON COLUMN paymentList.paymentDate IS '지급일';

COMMENT ON COLUMN paymentList.paymentYear IS '지급 연월';

COMMENT ON COLUMN paymentList.registerName IS '대장 명칭';

CREATE UNIQUE INDEX PK_paymentList
	ON paymentList (
		paylistNum ASC
	);

ALTER TABLE paymentList
	ADD
		CONSTRAINT PK_paymentList
		PRIMARY KEY (
			paylistNum
		);

/* 급여 대장 상세 내용 */
CREATE TABLE registerDetail (
	regDeCode NUMBER NOT NULL, /* 급여대장 상세 내용 코드 */
	paylistNum NUMBER NOT NULL, /* 급여대장 번호 */
	paymentCode NUMBER NOT NULL, /* 급여 코드 */
	totalPayment NUMBER /* 총 금액 */
);

COMMENT ON TABLE registerDetail IS '급여 대장 상세 내용';

COMMENT ON COLUMN registerDetail.regDeCode IS '급여대장 상세 내용 코드';

COMMENT ON COLUMN registerDetail.paylistNum IS '급여대장 번호';

COMMENT ON COLUMN registerDetail.paymentCode IS '급여 코드';

COMMENT ON COLUMN registerDetail.totalPayment IS '총 금액';

CREATE UNIQUE INDEX registerDetail_PK
	ON registerDetail (
		regDeCode ASC
	);

CREATE UNIQUE INDEX UIX_registerDetail
	ON registerDetail (
		paylistNum ASC,
		paymentCode ASC
	);

ALTER TABLE registerDetail
	ADD
		CONSTRAINT registerDetail_PK
		PRIMARY KEY (
			regDeCode
		);

ALTER TABLE registerDetail
	ADD
		CONSTRAINT UK_registerDetail
		UNIQUE (
			paylistNum,
			paymentCode
		);

/* 수강 신청 기간  */
CREATE TABLE lectureSelectPeriod (
	Year DATE NOT NULL, /* 년도 */
	semester NUMBER(1) NOT NULL, /* 학기 */
	grade NUMBER(1) NOT NULL, /* 학년 */
	startSelectLecture DATE, /* 시작일 */
	endSelectLecture DATE /* 종료일 */
);

COMMENT ON TABLE lectureSelectPeriod IS '수강 신청 기간 ';

COMMENT ON COLUMN lectureSelectPeriod.Year IS '년도';

COMMENT ON COLUMN lectureSelectPeriod.semester IS '학기';

COMMENT ON COLUMN lectureSelectPeriod.grade IS '학년';

COMMENT ON COLUMN lectureSelectPeriod.startSelectLecture IS '시작일';

COMMENT ON COLUMN lectureSelectPeriod.endSelectLecture IS '종료일';

CREATE UNIQUE INDEX PK_lectureSelectPeriod
	ON lectureSelectPeriod (
		Year ASC,
		semester ASC,
		grade ASC
	);

ALTER TABLE lectureSelectPeriod
	ADD
		CONSTRAINT PK_lectureSelectPeriod
		PRIMARY KEY (
			Year,
			semester,
			grade
		);

/* 휴복학 내역 */
CREATE TABLE schoolLeave (
	schoolLeaveStateCode NUMBER NOT NULL, /* 휴복학 내역 코드 */
	userNumber NVARCHAR2(9) NOT NULL, /* 사용자 번호 */
	kind NVARCHAR2(10), /* 구분 */
	leaveStart DATE, /* 시작일 */
	leaveEnd DATE, /* 종료일 */
	leaveStatus NUMBER /* 상태 */
);

COMMENT ON TABLE schoolLeave IS '휴복학 내역';

COMMENT ON COLUMN schoolLeave.schoolLeaveStateCode IS '휴복학 내역 코드';

COMMENT ON COLUMN schoolLeave.userNumber IS '사용자 번호';

COMMENT ON COLUMN schoolLeave.kind IS '구분';

COMMENT ON COLUMN schoolLeave.leaveStart IS '시작일';

COMMENT ON COLUMN schoolLeave.leaveEnd IS '종료일';

COMMENT ON COLUMN schoolLeave.leaveStatus IS '상태';

CREATE UNIQUE INDEX PK_schoolLeave
	ON schoolLeave (
		schoolLeaveStateCode ASC
	);

ALTER TABLE schoolLeave
	ADD
		CONSTRAINT PK_schoolLeave
		PRIMARY KEY (
			schoolLeaveStateCode
		);

/* 등록금 */
CREATE TABLE TABLE4 (
);

COMMENT ON TABLE TABLE4 IS '등록금';

ALTER TABLE student
	ADD
		CONSTRAINT FK_major_TO_student
		FOREIGN KEY (
			majorNum
		)
		REFERENCES major (
			majorNum
		);

ALTER TABLE student
	ADD
		CONSTRAINT FK_users_TO_student
		FOREIGN KEY (
			userNumber
		)
		REFERENCES users (
			userNumber
		);

ALTER TABLE employees
	ADD
		CONSTRAINT FK_major_TO_employees
		FOREIGN KEY (
			majorNum
		)
		REFERENCES major (
			majorNum
		);

ALTER TABLE employees
	ADD
		CONSTRAINT FK_users_TO_employees
		FOREIGN KEY (
			userNumber
		)
		REFERENCES users (
			userNumber
		);

ALTER TABLE employees
	ADD
		CONSTRAINT FK_employeesCode_TO_employees
		FOREIGN KEY (
			empCode
		)
		REFERENCES employeesCode (
			empCode
		);

ALTER TABLE lecture
	ADD
		CONSTRAINT FK_employees_TO_lecture
		FOREIGN KEY (
			userNumber
		)
		REFERENCES employees (
			userNumber
		);

ALTER TABLE lecture
	ADD
		CONSTRAINT FK_major_TO_lecture
		FOREIGN KEY (
			majorNum
		)
		REFERENCES major (
			majorNum
		);

ALTER TABLE TABLE7
	ADD
		CONSTRAINT FK_major_TO_TABLE7
		FOREIGN KEY (
			majorNum
		)
		REFERENCES major (
			majorNum
		);

ALTER TABLE GPA
	ADD
		CONSTRAINT FK_studentClassInfo_TO_GPA
		FOREIGN KEY (
			infoCode
		)
		REFERENCES studentClassInfo (
			infoCode
		);

ALTER TABLE GPA
	ADD
		CONSTRAINT FK_credit_TO_GPA
		FOREIGN KEY (
			credit
		)
		REFERENCES credit (
			credit
		);

ALTER TABLE studentState
	ADD
		CONSTRAINT FK_student_TO_studentState
		FOREIGN KEY (
			userNumber
		)
		REFERENCES student (
			userNumber
		);

ALTER TABLE major
	ADD
		CONSTRAINT FK_faculty_TO_major
		FOREIGN KEY (
			faculty
		)
		REFERENCES faculty (
			faculty
		);

ALTER TABLE studentClassInfo
	ADD
		CONSTRAINT FK_lecture_TO_studentClassInfo
		FOREIGN KEY (
			lecCode
		)
		REFERENCES lecture (
			lecCode
		);

ALTER TABLE studentClassInfo
	ADD
		CONSTRAINT FK_student_TO_studentClassInfo
		FOREIGN KEY (
			userNumber
		)
		REFERENCES student (
			userNumber
		);

ALTER TABLE TABLE13
	ADD
		CONSTRAINT FK_lecture_TO_TABLE13
		FOREIGN KEY (
			lecCode
		)
		REFERENCES lecture (
			lecCode
		);

ALTER TABLE scholarshipInfo
	ADD
		CONSTRAINT FK_scholarship_TO_scholarshipInfo
		FOREIGN KEY (
			scholarPk
		)
		REFERENCES scholarship (
			scholarPk
		);

ALTER TABLE scholarshipInfo
	ADD
		CONSTRAINT FK_scholarState_TO_scholarshipInfo
		FOREIGN KEY (
			statCode
		)
		REFERENCES scholarState (
			statCode
		);

ALTER TABLE scholarshipInfo
	ADD
		CONSTRAINT FK_student_TO_scholarshipInfo
		FOREIGN KEY (
			userNumber
		)
		REFERENCES student (
			userNumber
		);

ALTER TABLE authority
	ADD
		CONSTRAINT FK_users_TO_authority
		FOREIGN KEY (
			userNumber
		)
		REFERENCES users (
			userNumber
		);

ALTER TABLE accountInfo
	ADD
		CONSTRAINT FK_employees_TO_accountInfo
		FOREIGN KEY (
			userNumber
		)
		REFERENCES employees (
			userNumber
		);

ALTER TABLE TABLE24
	ADD
		CONSTRAINT FK_employees_TO_TABLE24
		FOREIGN KEY (
			userNumber
		)
		REFERENCES employees (
			userNumber
		);

ALTER TABLE timetable
	ADD
		CONSTRAINT FK_day_TO_timetable
		FOREIGN KEY (
			lectureDay
		)
		REFERENCES day (
			lectureDay
		);

ALTER TABLE lectureTime
	ADD
		CONSTRAINT FK_lecture_TO_lectureTime
		FOREIGN KEY (
			lecCode
		)
		REFERENCES lecture (
			lecCode
		);

ALTER TABLE lectureTime
	ADD
		CONSTRAINT FK_timetable_TO_lectureTime
		FOREIGN KEY (
			timetblCode
		)
		REFERENCES timetable (
			timetblCode
		);

ALTER TABLE TABLE29
	ADD
		CONSTRAINT FK_employees_TO_TABLE29
		FOREIGN KEY (
			userNumber
		)
		REFERENCES employees (
			userNumber
		);

ALTER TABLE TABLE29
	ADD
		CONSTRAINT FK_incentiveMenu_TO_TABLE29
		FOREIGN KEY (
			incentiveCode
		)
		REFERENCES incentiveMenu (
			incentiveCode
		);

ALTER TABLE paymentCode
	ADD
		CONSTRAINT FK_employees_TO_paymentCode
		FOREIGN KEY (
			userNumber
		)
		REFERENCES employees (
			userNumber
		);

ALTER TABLE paymentCode
	ADD
		CONSTRAINT FK_incentiveMenu_TO_paymentCode
		FOREIGN KEY (
			incentiveCode
		)
		REFERENCES incentiveMenu (
			incentiveCode
		);

ALTER TABLE registerDetail
	ADD
		CONSTRAINT FK_paymentCode_TO_registerDetail
		FOREIGN KEY (
			paymentCode
		)
		REFERENCES paymentCode (
			paymentCode
		);

ALTER TABLE registerDetail
	ADD
		CONSTRAINT FK_paymentList_TO_registerDetail
		FOREIGN KEY (
			paylistNum
		)
		REFERENCES paymentList (
			paylistNum
		);

ALTER TABLE schoolLeave
	ADD
		CONSTRAINT FK_studentState_TO_schoolLeave
		FOREIGN KEY (
			userNumber
		)
		REFERENCES studentState (
			userNumber
		);