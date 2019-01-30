
/* USERS */
DROP TABLE users 
	CASCADE CONSTRAINTS;

create table users(
    userNumber      nvarchar2(9) primary key,
    userPassword    nvarchar2(255)
);

COMMENT ON TABLE users IS 'USERS';

COMMENT ON COLUMN users.userNumber IS '사용자 번호';

COMMENT ON COLUMN users.userPassword IS '비밀번호';

/* 권한 */
ALTER TABLE authority
DROP PRIMARY KEY CASCADE;

DROP TABLE authority 
	CASCADE CONSTRAINTS;
    
create table authority(
    authName    nvarchar2(20),
    userNumber  nvarchar2(9),
    primary key(authName, userNumber)
);

COMMENT ON TABLE authority IS '권한';

COMMENT ON COLUMN authority.authName IS '권한명';

COMMENT ON COLUMN authority.userNumber IS '사용자 번호';

/* 학생 */
DROP TABLE student 
	CASCADE CONSTRAINTS;

create table student(
    userNumber      nvarchar2(9) primary key,
    majorNum        number,
    stdName         nvarchar2(30),
    stdImage        nvarchar2(150),
    stdGrade        number(1),
    stdSsn          nvarchar2(20),
    stdCellNumber   nvarchar2(20),
    stdEmail        nvarchar2(50),
    stdZipCode      nvarchar2(10),
    stdAddr1        nvarchar2(100),
    stdAddr2        nvarchar2(100),
    adDate          date,
    graDate         date,
    delStatus       number(1)
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


/* 학적 */
DROP TABLE studentState 
	CASCADE CONSTRAINTS;

create table studentState(
    userNumber         nvarchar2(9) primary key,
    grade              number(1),
    semester           number(1),
    graduation_state   number(1)
);

COMMENT ON TABLE studentState IS '학적';

COMMENT ON COLUMN studentState.userNumber IS '사용자 번호';

COMMENT ON COLUMN studentState.grade IS '학년';

COMMENT ON COLUMN studentState.semester IS '학기';

COMMENT ON COLUMN studentState.graduation_state IS '줄업 여부';




/* 휴복학 내역 */
DROP TABLE schoolLeave 
	CASCADE CONSTRAINTS;
    
create table schoolLeave (
    schoolLeaveStateCode    number primary key,
    userNumber              nvarchar2(9),
    kind                    nvarchar2(10),
    leaveStart              date,
    leaveEnd                date,
    leaveStatus             number
);

COMMENT ON TABLE schoolLeave IS '휴복학 내역';

COMMENT ON COLUMN schoolLeave.schoolLeaveStateCode IS '휴복학 내역 코드';

COMMENT ON COLUMN schoolLeave.userNumber IS '사용자 번호';

COMMENT ON COLUMN schoolLeave.kind IS '구분';

COMMENT ON COLUMN schoolLeave.leaveStart IS '시작일';

COMMENT ON COLUMN schoolLeave.leaveEnd IS '종료일';

COMMENT ON COLUMN schoolLeave.leaveStatus IS '상태';




/* 교직원 */
DROP TABLE employees 
	CASCADE CONSTRAINTS;

create table employees(
    userNumber  nvarchar2(9) primary key,
    empCode     nvarchar2(10),
    majorNum    number,
    empName     nvarchar2(30),
    empEngName  nvarchar2(50),
    empImage    nvarchar2(150),
    empSsn      nvarchar2(20),
    empCellNumber   nvarchar2(20),
    empEmail        nvarchar2(50),
    empZipCode      nvarchar2(10),
    empAddress1     nvarchar2(100),
    empAddress2     nvarchar2(100),
    empHireDate     date,
    annualLevel     number,
    introduction    nvarchar2(2000),
    delStatus       number(1)
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

COMMENT ON COLUMN employees.empHireDate IS '입사일';

COMMENT ON COLUMN employees.annualLevel IS '연차';

COMMENT ON COLUMN employees.introduction IS ' 소개';

COMMENT ON COLUMN employees.delStatus IS '삭제상태';



/* 계좌 정보 */
DROP TABLE accountInfo 
	CASCADE CONSTRAINTS;
    
create table accountInfo (
    userNumber      nvarchar2(9) primary key,
    bankName        nvarchar2(50),
    accountNumber   nvarchar2(50),
    accountHolder   nvarchar2(30)
);

COMMENT ON TABLE accountInfo IS '계좌 정보';

COMMENT ON COLUMN accountInfo.userNumber IS '사용자 번호';

COMMENT ON COLUMN accountInfo.bankName IS '은행명';

COMMENT ON COLUMN accountInfo.accountNumber IS '계좌번호';

COMMENT ON COLUMN accountInfo.accountHolder IS '예금주';



/* 교직원 코드 */
DROP TABLE employeesCode 
	CASCADE CONSTRAINTS;

create table employeesCode(
    empCode     nvarchar2(10) primary key,
    employee    nvarchar2(30)
);

COMMENT ON TABLE employeesCode IS '교직원 코드';

COMMENT ON COLUMN employeesCode.empCode IS '교직원 코드 ';

COMMENT ON COLUMN employeesCode.employee IS '교직원 명';



/* 수당 항목 */
DROP TABLE incentiveMenu 
	CASCADE CONSTRAINTS;
    
create table incentiveMenu (
    incentiveCode   number primary key,
    incentiveName   nvarchar2(10),
    incentiveIndex  number,
    dividendRate    number(2,1)
);

COMMENT ON TABLE incentiveMenu IS '수당 항목';

COMMENT ON COLUMN incentiveMenu.incentiveCode IS '수당코드';

COMMENT ON COLUMN incentiveMenu.incentiveName IS '수당명';

COMMENT ON COLUMN incentiveMenu.incentiveIndex IS '표시순서';

COMMENT ON COLUMN incentiveMenu.dividendRate IS '배율';


/* 급여 코드 */
DROP TABLE paymentCode 
	CASCADE CONSTRAINTS;
    
create table paymentCode(
    paymentCode     number primary key,
    userNumber      nvarchar2(9),
    incentiveCode   number
);

COMMENT ON TABLE paymentCode IS '급여 코드';

COMMENT ON COLUMN paymentCode.paymentCode IS '급여 코드';

COMMENT ON COLUMN paymentCode.userNumber IS '사용자 번호';

COMMENT ON COLUMN paymentCode.incentiveCode IS '수당코드';

CREATE UNIQUE INDEX UIX_paymentCode
	ON paymentCode (
		userNumber ASC,
		incentiveCode ASC
	);
    




/* 급여대장  */

DROP TABLE paymentList 
	CASCADE CONSTRAINTS;

create table paymentList(
    paylistNum  number primary key,
    imputedYear date,
    paymentClassfication nvarchar2(10),
    beginningPeriod date,
    endPeriod       date,
    paymentDate     date,
    paymentYear     date,
    registerName    nvarchar2(30)
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

/* 급여 대장 상세 내용 */
DROP TABLE registerDetail 
	CASCADE CONSTRAINTS;

create table registerDetail(
    regDeCode number primary key,
    paylistNum  number,
    paymentCode number,
    totalPayment number
);

COMMENT ON TABLE registerDetail IS '급여 대장 상세 내용';

COMMENT ON COLUMN registerDetail.regDeCode IS '급여대장 상세 내용 코드';

COMMENT ON COLUMN registerDetail.paylistNum IS '급여대장 번호';

COMMENT ON COLUMN registerDetail.paymentCode IS '급여 코드';

COMMENT ON COLUMN registerDetail.totalPayment IS '총 금액';

CREATE UNIQUE INDEX UIX_registerDetail
	ON registerDetail (
		paylistNum ASC,
		paymentCode ASC
	);

/* 단과대 */
DROP TABLE faculty 
	CASCADE CONSTRAINTS;

create table faculty(
    faculty     nvarchar2(20) primary key
);

COMMENT ON TABLE faculty IS '단과대';

COMMENT ON COLUMN faculty.faculty IS '단과대명';

/* 학과 */
DROP TABLE major 
	CASCADE CONSTRAINTS;
    
create table major(
    majorNum    number primary key,
    faculty     nvarchar2(20),
    majorName   nvarchar2(50),
    maxNum      number
);

COMMENT ON TABLE major IS '학과';

COMMENT ON COLUMN major.majorNum IS '학과 번호';

COMMENT ON COLUMN major.faculty IS '단과대명';

COMMENT ON COLUMN major.majorName IS '학과명';

COMMENT ON COLUMN major.maxNum IS '최대인원수';



/* 강의 */
DROP TABLE lecture 
	CASCADE CONSTRAINTS;

create table lecture(
    lecCode     nvarchar2(10) primary key,
    majorNum    number,
    userNumber  nvarchar2(9),
    lectureName nvarchar2(20),
    lectureClassfication    nvarchar2(10),
    maximumCapacity         number,
    grade       number(1),
    grantedSemester         number(1),
    lectureScore            number(1),
    classRoom   nvarchar2(30)
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

/* 학생 수강 정보 */
DROP TABLE studentClassInfo 
	CASCADE CONSTRAINTS;

create table studentClassInfo(
    infoCode    number primary key,
    lecCode     nvarchar2(10),
    userNumber  nvarchar2(9),
    COL4        number(1)
);

COMMENT ON TABLE studentClassInfo IS '학생 수강 정보';

COMMENT ON COLUMN studentClassInfo.infoCode IS '수강정보 코드';

COMMENT ON COLUMN studentClassInfo.lecCode IS '강의번호';

COMMENT ON COLUMN studentClassInfo.userNumber IS '사용자 번호';

COMMENT ON COLUMN studentClassInfo.COL4 IS '상태';

ALTER TABLE studentClassInfo
	ADD
		CONSTRAINT UK_studentClassInfo
		UNIQUE (
			lecCode,
			userNumber
		);

/* 강의 시간 */
DROP TABLE lectureTime 
	CASCADE CONSTRAINTS;

create table lectureTime(
    lectureTimeCode  number primary key,
    lecCode         nvarchar2(10),
    timetblCode     number
);

COMMENT ON TABLE lectureTime IS '강의 시간';

COMMENT ON COLUMN lectureTime.lectureTimeCode IS '강의시간코드';

COMMENT ON COLUMN lectureTime.lecCode IS '강의번호';

COMMENT ON COLUMN lectureTime.timetblCode IS ' 시간표 코드';

CREATE UNIQUE INDEX UIX_lectureTime
	ON lectureTime (
		lecCode ASC,
		timetblCode ASC
	);

/* 시간표 */
DROP TABLE timetable 
	CASCADE CONSTRAINTS;

create table timetable(
    timetblCode     number primary key,
    lectureDay     nvarchar2(1),
    lectureTime     number,
    beginningLectureTime    nvarchar2(5),
    endLectureTime          nvarchar2(5)
);

COMMENT ON TABLE timetable IS '시간표';

COMMENT ON COLUMN timetable.timetblCode IS ' 시간표 코드';

COMMENT ON COLUMN timetable.lectureDay IS '요일';

COMMENT ON COLUMN timetable.lectureTime IS '교시';

COMMENT ON COLUMN timetable.beginningLectureTime IS '시작 시간';

COMMENT ON COLUMN timetable.endLectureTime IS '종료 시간';

/* 요일 */
DROP TABLE day 
	CASCADE CONSTRAINTS;

create table day(
    lectureDay     nvarchar2(1) primary key
);

COMMENT ON TABLE day IS '요일';

COMMENT ON COLUMN day.lectureDay IS '요일';

/* 장학금 */
DROP TABLE scholarship 
	CASCADE CONSTRAINTS;

create table scholarship(
    scholarPk   number primary key,
    scholarName nvarchar2(20),
    Year        date,
    semester    number(1),
    kind        nvarchar2(20),
    amount      number
);

COMMENT ON TABLE scholarship IS '장학금';

COMMENT ON COLUMN scholarship.scholarPk IS '장학금번호';

COMMENT ON COLUMN scholarship.scholarName IS '장학금명';

COMMENT ON COLUMN scholarship.Year IS '년도';

COMMENT ON COLUMN scholarship.semester IS '학기';

COMMENT ON COLUMN scholarship.kind IS '구분';

COMMENT ON COLUMN scholarship.amount IS '신청금액';

/* 장학금 상태 */
DROP TABLE scholarState 
	CASCADE CONSTRAINTS;

create table scholarState(
    stateCode       number primary key,
    scholarStatus   nvarchar2(20)
);

COMMENT ON TABLE scholarState IS '장학금 상태';

COMMENT ON COLUMN scholarState.stateCode IS '상태 번호';

COMMENT ON COLUMN scholarState.scholarStatus IS '상태명';

/* 장학정보 */
DROP TABLE scholarshipInfo 
	CASCADE CONSTRAINTS;

create table scholarshipInfo(
    scholarPk      number,
    userNumber     nvarchar2(9),
    stateCode       number,
    primary key(scholarPk, userNumber)
);

COMMENT ON TABLE scholarshipInfo IS '장학정보';

COMMENT ON COLUMN scholarshipInfo.scholarPk IS '장학금번호';

COMMENT ON COLUMN scholarshipInfo.userNumber IS '사용자 번호';

COMMENT ON COLUMN scholarshipInfo.stateCode IS '상태 번호';

/* 성적 */
DROP TABLE GPA 
	CASCADE CONSTRAINTS;


create table GPA(
    credit      nvarchar2(3),
    infoCode    number(1,1),
    primary key(credit, infoCode)
);

COMMENT ON TABLE GPA IS '성적';

COMMENT ON COLUMN GPA.credit IS '학점';

COMMENT ON COLUMN GPA.infoCode IS '수강정보 코드';


/* 학점 */
DROP TABLE credit 
	CASCADE CONSTRAINTS;

create table credit(
    credit      nvarchar2(3) primary key,
    score       number(1, 1)
);

COMMENT ON TABLE credit IS '학점';

COMMENT ON COLUMN credit.credit IS '학점';

COMMENT ON COLUMN credit.score IS '점수';

/* 수강 신청 기간  */

DROP TABLE lectureSelectPeriod 
	CASCADE CONSTRAINTS;

create table lectureSelectPeriod(
    Year    date,
    semester    number(1),
    grade       number(1),
    startSelectLecture  date,
    endSelectLecture    date,
    primary key(Year, semester, grade)
);

COMMENT ON TABLE lectureSelectPeriod IS '수강 신청 기간 ';

COMMENT ON COLUMN lectureSelectPeriod.Year IS '년도';

COMMENT ON COLUMN lectureSelectPeriod.semester IS '학기';

COMMENT ON COLUMN lectureSelectPeriod.grade IS '학년';

COMMENT ON COLUMN lectureSelectPeriod.startSelectLecture IS '시작일';

COMMENT ON COLUMN lectureSelectPeriod.endSelectLecture IS '종료일';

/* 메세지 테이블 */
DROP TABLE messages 
	CASCADE CONSTRAINTS;

create table messages(
    userNumber  NVARCHAR2(9) primary key,
    sendUser	NVARCHAR2(9) NOT NULL,
    Message		NVARCHAR2(2000),
    readStatus	NUMBER(1),
    sendTime		TIMESTAMP,
    notifyStatus NUMBER(1)
);

COMMENT ON TABLE messages IS '메세지';
COMMENT ON COLUMN messages.sendUser IS '보낸사용자';
COMMENT ON COLUMN messages.Message IS '메세지';
COMMENT ON COLUMN messages.readStatus IS '읽었는지 여부';
COMMENT ON COLUMN messages.sendTime IS '보낸 시간';
COMMENT ON COLUMN messages.notifyStatus IS '공지 여부';

--fk start
ALTER TABLE authority
	ADD
		FOREIGN KEY (
			userNumber
		)
		REFERENCES users (
			userNumber
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;
       
ALTER TABLE major
	ADD
		FOREIGN KEY (
			faculty
		)
		REFERENCES faculty (
			faculty
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE student
	ADD
		FOREIGN KEY (
			majorNum
		)
		REFERENCES major (
			majorNum
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE student
	ADD
		FOREIGN KEY (
			userNumber
		)
		REFERENCES users (
			userNumber
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE studentState
	ADD
		FOREIGN KEY (
			userNumber
		)
		REFERENCES student (
			userNumber
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE schoolLeave
	ADD
		FOREIGN KEY (
			userNumber
		)
		REFERENCES studentState (
			userNumber
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;
        
ALTER TABLE employees
	ADD
		FOREIGN KEY (
			majorNum
		)
		REFERENCES major (
			majorNum
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE employees
	ADD
		FOREIGN KEY (
			userNumber
		)
		REFERENCES users (
			userNumber
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE employees
	ADD
		FOREIGN KEY (
			empCode
		)
		REFERENCES employeesCode (
			empCode
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE accountInfo
	ADD
		FOREIGN KEY (
			userNumber
		)
		REFERENCES employees (
			userNumber
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;
        
ALTER TABLE paymentCode
	ADD
		FOREIGN KEY (
			userNumber
		)
		REFERENCES employees (
			userNumber
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE paymentCode
	ADD
		FOREIGN KEY (
			incentiveCode
		)
		REFERENCES incentiveMenu (
			incentiveCode
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE lecture
	ADD
		FOREIGN KEY (
			userNumber
		)
		REFERENCES employees (
			userNumber
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE lecture
	ADD
		FOREIGN KEY (
			majorNum
		)
		REFERENCES major (
			majorNum
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;
        
ALTER TABLE studentClassInfo
	ADD
		FOREIGN KEY (
			lecCode
		)
		REFERENCES lecture (
			lecCode
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE studentClassInfo
	ADD
		FOREIGN KEY (
			userNumber
		)
		REFERENCES student (
			userNumber
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;
        
ALTER TABLE lectureTime
	ADD
		FOREIGN KEY (
			lecCode
		)
		REFERENCES lecture (
			lecCode
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE lectureTime
	ADD
		FOREIGN KEY (
			timetblCode
		)
		REFERENCES timetable (
			timetblCode
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;
        
ALTER TABLE timetable
	ADD
		FOREIGN KEY (
			lectureDay
		)
		REFERENCES day (
			lectureDay
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;
        
ALTER TABLE scholarshipInfo
	ADD
		FOREIGN KEY (
			scholarPk
		)
		REFERENCES scholarship (
			scholarPk
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE scholarshipInfo
	ADD
		FOREIGN KEY (
			stateCode
		)
		REFERENCES scholarState (
			stateCode
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE scholarshipInfo
	ADD
		FOREIGN KEY (
			userNumber
		)
		REFERENCES student (
			userNumber
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE GPA
	ADD
		FOREIGN KEY (
			infoCode
		)
		REFERENCES studentClassInfo (
			infoCode
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE GPA
	ADD
		FOREIGN KEY (
			credit
		)
		REFERENCES credit (
			credit
		)NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;
        
ALTER TABLE messages
	ADD
		FOREIGN KEY(
			userNumber
		)
		REFERENCES users(
			userNumber
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

		ALTER TABLE messages
	ADD
		FOREIGN KEY(
			sendUser
		)
		REFERENCES users(
			userNumber
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE scholarship
    DROP COLUMN kind;

ALTER TABLE scholarship
    ADD (scholarContent NVARCHAR2(2000));

COMMENT ON COLUMN scholarship.scholarContent IS '장학금 내용';

--------------- sequence start  ----------------------------------
DROP SEQUENCE seq_major_majorNum;

------------------ seq_테이블명_컬럼명
CREATE SEQUENCE seq_major_majorNum
    START WITH 100
    INCREMENT BY 1
    MAXVALUE 999;

-- 시퀀스들 조회
select sequence_name, min_value, max_value, increment_by, last_number
from user_sequences;

-- 시퀀스의 캐쉬 확인
select sequence_name, cache_size
from user_sequences
where sequence_name = 'SEQ_MAJOR_MAJORNUM';

-- 시퀀스 캐쉬 사용x
alter sequence SEQ_MAJOR_MAJORNUM nocache;
--------------- sequence end  ----------------------------------
