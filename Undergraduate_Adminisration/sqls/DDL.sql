-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- 생성되어 있는 트리거 DROP 하는 쿼리 생성문
SELECT 'DROP TRIGGER ' || trigger_name || ';'  FROM USER_TRIGGERS;

-- 테이블 드랍 쿼리 생성문
SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;

DROP TABLE "FACULTY" CASCADE CONSTRAINTS;
DROP TABLE "USERS" CASCADE CONSTRAINTS;
DROP TABLE "MAJOR" CASCADE CONSTRAINTS;
DROP TABLE "STUDENT" CASCADE CONSTRAINTS;
DROP TABLE "EMPLOYEE" CASCADE CONSTRAINTS;
DROP TABLE "LECTURE" CASCADE CONSTRAINTS;
DROP TABLE "DAY" CASCADE CONSTRAINTS;
DROP TABLE "INCENTIVEMENU" CASCADE CONSTRAINTS;
DROP TABLE "SCHOLARSTATE" CASCADE CONSTRAINTS;
DROP TABLE "SCHOLARSHIP" CASCADE CONSTRAINTS;
DROP TABLE "PAYMENT" CASCADE CONSTRAINTS;
DROP TABLE "PAYMENTLIST" CASCADE CONSTRAINTS;
DROP TABLE "STUDENTCLASSINFO" CASCADE CONSTRAINTS;
DROP TABLE "CREDIT" CASCADE CONSTRAINTS;
DROP TABLE "TIMETABLE" CASCADE CONSTRAINTS;
DROP TABLE "MESSAGES" CASCADE CONSTRAINTS;
DROP TABLE "STUDENTSTATE" CASCADE CONSTRAINTS;
DROP TABLE "SCHOOLLEAVE" CASCADE CONSTRAINTS;
DROP TABLE "SCHOLARSHIPINFO" CASCADE CONSTRAINTS;
DROP TABLE "REGISTERDETAIL" CASCADE CONSTRAINTS;
DROP TABLE "GPA" CASCADE CONSTRAINTS;
DROP TABLE "LECTURETIME" CASCADE CONSTRAINTS;
DROP TABLE "LECTURESELECTPERIOD" CASCADE CONSTRAINTS;

-- 트리거 조회
SELECT * FROM USER_TRIGGERS;

-- 시퀀스 조회
SELECT *
FROM USER_SEQUENCES;

DROP SEQUENCE INCENTIVEMENU_SEQ;
DROP SEQUENCE LECTURETIME_SEQ;
DROP SEQUENCE MESSAGES_SEQ;
DROP SEQUENCE PAYMENTLIST_SEQ;
DROP SEQUENCE PAYMENT_SEQ;
DROP SEQUENCE REGISTERDETAIL_SEQ;
DROP SEQUENCE SCHOLARSHIPINFO_SEQ;
DROP SEQUENCE SCHOLARSHIP_SEQ;
DROP SEQUENCE SCHOLARSTATE_SEQ;
DROP SEQUENCE STUDENTCLASSINFO_SEQ;

-- faculty Table Create SQL
CREATE TABLE faculty
(
    faculty    NVARCHAR2(20)    NOT NULL, 
    CONSTRAINT FACULTY_PK PRIMARY KEY (faculty)
)
/

COMMENT ON TABLE faculty IS '단과대'
/

COMMENT ON COLUMN faculty.faculty IS '단과대명'
/


-- users Table Create SQL
CREATE TABLE users
(
    userNumber      NVARCHAR2(20)     NOT NULL, 
    userPassword    NVARCHAR2(255)    NOT NULL, 
    userName        NVARCHAR2(20)     NOT NULL, 
    userEngName     NVARCHAR2(20)     NOT NULL, 
    userImage       NVARCHAR2(50)     NOT NULL, 
    gender          NVARCHAR2(1)      NOT NULL, 
    userCellNum     NVARCHAR2(20)     NULL, 
    userEmail       NVARCHAR2(30)     NOT NULL, 
    userSsn         NVARCHAR2(20)     NOT NULL, 
    userZipCode     NVARCHAR2(20)     NOT NULL, 
    userAddr1       NVARCHAR2(50)     NOT NULL, 
    userAddr2       NVARCHAR2(50)     NOT NULL, 
    delStatus       NUMBER(1)         NOT NULL, 
    authority       NVARCHAR2(20)     NOT NULL, 
    CONSTRAINT USERS_PK PRIMARY KEY (userNumber)
)
/

COMMENT ON TABLE users IS '사용자'
/

COMMENT ON COLUMN users.userNumber IS '사용자 번호'
/

COMMENT ON COLUMN users.userPassword IS '비밀번호'
/

COMMENT ON COLUMN users.userName IS '이름'
/

COMMENT ON COLUMN users.userEngName IS '영문성명'
/

COMMENT ON COLUMN users.userImage IS '사진'
/

COMMENT ON COLUMN users.gender IS '성별'
/

COMMENT ON COLUMN users.userCellNum IS '핸드폰번호'
/

COMMENT ON COLUMN users.userEmail IS '이메일'
/

COMMENT ON COLUMN users.userSsn IS '주민등록번호'
/

COMMENT ON COLUMN users.userZipCode IS '우편번호'
/

COMMENT ON COLUMN users.userAddr1 IS '주소1'
/

COMMENT ON COLUMN users.userAddr2 IS '주소2'
/

COMMENT ON COLUMN users.delStatus IS '삭제상태'
/

COMMENT ON COLUMN users.authority IS '권한'
/


-- major Table Create SQL
CREATE TABLE major
(
    majorNum     NUMBER           NOT NULL, 
    faculty      NVARCHAR2(20)    NULL, 
    majorName    NVARCHAR2(50)    NULL, 
    maxNum       NUMBER           NULL, 
    CONSTRAINT MAJOR_PK PRIMARY KEY (majorNum)
)
/

COMMENT ON TABLE major IS '학과'
/

COMMENT ON COLUMN major.majorNum IS '학과 번호'
/

COMMENT ON COLUMN major.faculty IS '단과대명'
/

COMMENT ON COLUMN major.majorName IS '학과명'
/

COMMENT ON COLUMN major.maxNum IS '최대인원수'
/

ALTER TABLE major
    ADD CONSTRAINT FK_major_faculty_faculty_facul FOREIGN KEY (faculty)
        REFERENCES faculty (faculty)
/


-- student Table Create SQL
CREATE TABLE student
(
    stdNumber    NVARCHAR2(20)    NOT NULL, 
    majorNum     NUMBER           NOT NULL, 
    grade        NUMBER(1)        NULL, 
    adDate       DATE             NULL, 
    graDate      DATE             NULL, 
    CONSTRAINT STUDENT_PK PRIMARY KEY (stdNumber)
)
/

COMMENT ON TABLE student IS '학생'
/

COMMENT ON COLUMN student.stdNumber IS '학번'
/

COMMENT ON COLUMN student.majorNum IS '학과번호'
/

COMMENT ON COLUMN student.grade IS '학년'
/

COMMENT ON COLUMN student.adDate IS '입학일'
/

COMMENT ON COLUMN student.graDate IS '졸업일'
/

ALTER TABLE student
    ADD CONSTRAINT FK_student_stdNumber_users_use FOREIGN KEY (stdNumber)
        REFERENCES users (userNumber)
/

ALTER TABLE student
    ADD CONSTRAINT FK_student_majorNum_major_majo FOREIGN KEY (majorNum)
        REFERENCES major (majorNum)
/


-- employee Table Create SQL
CREATE TABLE employee
(
    empNumber        NVARCHAR2(20)      NOT NULL, 
    majorNum         NUMBER             NOT NULL, 
    empHiredDate     DATE               NOT NULL, 
    annualLevel      NUMBER             NOT NULL, 
    introduction     NVARCHAR2(2000)    NOT NULL, 
    bankName         NVARCHAR2(50)      NOT NULL, 
    accountNumber    NVARCHAR2(50)      NOT NULL, 
    accountHolder    NVARCHAR2(30)      NOT NULL, 
    CONSTRAINT EMPLOYEE_PK PRIMARY KEY (empNumber)
)
/

COMMENT ON TABLE employee IS '교직원'
/

COMMENT ON COLUMN employee.empNumber IS '교번'
/

COMMENT ON COLUMN employee.majorNum IS '학과 번호'
/

COMMENT ON COLUMN employee.empHiredDate IS '입사일'
/

COMMENT ON COLUMN employee.annualLevel IS '연차'
/

COMMENT ON COLUMN employee.introduction IS '소개'
/

COMMENT ON COLUMN employee.bankName IS '은행명'
/

COMMENT ON COLUMN employee.accountNumber IS '계좌번호'
/

COMMENT ON COLUMN employee.accountHolder IS '예금주'
/

ALTER TABLE employee
    ADD CONSTRAINT FK_employee_empNumber_users_us FOREIGN KEY (empNumber)
        REFERENCES users (userNumber)
/

ALTER TABLE employee
    ADD CONSTRAINT FK_employee_majorNum_major_maj FOREIGN KEY (majorNum)
        REFERENCES major (majorNum)
/


-- lecture Table Create SQL
CREATE TABLE lecture
(
    lecCode                 NVARCHAR2(10)    NOT NULL, 
    majorNum                NUMBER           NOT NULL, 
    empNumber               NVARCHAR2(20)    NOT NULL, 
    lectureName             NVARCHAR2(30)    NOT NULL, 
    lectureClassfication    NVARCHAR2(10)    NOT NULL, 
    maximumCapacity         NUMBER(5)        NOT NULL, 
    grade                   NUMBER(1)        NOT NULL, 
    grantedSemester         NUMBER(1)        NOT NULL, 
    lectureScore            NUMBER(1)        NOT NULL, 
    classRoom               NVARCHAR2(30)    NOT NULL, 
    CONSTRAINT LECTURE_PK PRIMARY KEY (lecCode)
)
/

COMMENT ON TABLE lecture IS '강의'
/

COMMENT ON COLUMN lecture.lecCode IS '강의번호'
/

COMMENT ON COLUMN lecture.majorNum IS '학과 번호'
/

COMMENT ON COLUMN lecture.empNumber IS '교번'
/

COMMENT ON COLUMN lecture.lectureName IS '강의명'
/

COMMENT ON COLUMN lecture.lectureClassfication IS '구분'
/

COMMENT ON COLUMN lecture.maximumCapacity IS '최대 인원수'
/

COMMENT ON COLUMN lecture.grade IS '학년'
/

COMMENT ON COLUMN lecture.grantedSemester IS '학기'
/

COMMENT ON COLUMN lecture.lectureScore IS '학점'
/

COMMENT ON COLUMN lecture.classRoom IS '강의실'
/

ALTER TABLE lecture
    ADD CONSTRAINT FK_lecture_majorNum_major_majo FOREIGN KEY (majorNum)
        REFERENCES major (majorNum)
/

ALTER TABLE lecture
    ADD CONSTRAINT FK_lecture_empNumber_employee_ FOREIGN KEY (empNumber)
        REFERENCES employee (empNumber)
/


-- day Table Create SQL
CREATE TABLE day
(
    lectureDay    NVARCHAR2(1)    NOT NULL, 
    CONSTRAINT DAY_PK PRIMARY KEY (lectureDay)
)
/

COMMENT ON TABLE day IS '요일'
/

COMMENT ON COLUMN day.lectureDay IS '요일'
/


-- incentiveMenu Table Create SQL
CREATE TABLE incentiveMenu
(
    incentiveCode     NUMBER           NOT NULL, 
    incentiveName     NVARCHAR2(10)    NULL, 
    incentiveIndex    NUMBER           NULL, 
    dividendRate      NUMBER(2,1)      NULL, 
    CONSTRAINT INCENTIVEMENU_PK PRIMARY KEY (incentiveCode)
)
/

CREATE SEQUENCE incentiveMenu_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER incentiveMenu_AI_TRG
BEFORE INSERT ON incentiveMenu 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT incentiveMenu_SEQ.NEXTVAL
    INTO: NEW.incentiveCode
    FROM DUAL;
END;
/

--DROP TRIGGER incentiveMenu_AI_TRG;
/

--DROP SEQUENCE incentiveMenu_SEQ;
/

COMMENT ON TABLE incentiveMenu IS '수당항목'
/

COMMENT ON COLUMN incentiveMenu.incentiveCode IS '수당코드'
/

COMMENT ON COLUMN incentiveMenu.incentiveName IS '수당명'
/

COMMENT ON COLUMN incentiveMenu.incentiveIndex IS '표시순서'
/

COMMENT ON COLUMN incentiveMenu.dividendRate IS '배율'
/


-- scholarState Table Create SQL
CREATE TABLE scholarState
(
    statCode         NUMBER          NOT NULL, 
    scholarStatus    VARCHAR2(20)    NULL, 
    CONSTRAINT SCHOLARSTATE_PK PRIMARY KEY (statCode)
)
/

CREATE SEQUENCE scholarState_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER scholarState_AI_TRG
BEFORE INSERT ON scholarState 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT scholarState_SEQ.NEXTVAL
    INTO: NEW.statCode
    FROM DUAL;
END;
/

--DROP TRIGGER scholarState_AI_TRG;
/

--DROP SEQUENCE scholarState_SEQ;
/

COMMENT ON TABLE scholarState IS '장학금 상태'
/

COMMENT ON COLUMN scholarState.statCode IS '상태 번호'
/

COMMENT ON COLUMN scholarState.scholarStatus IS '상태명'
/


-- scholarship Table Create SQL
CREATE TABLE scholarship
(
    scholarPk         NUMBER             NOT NULL, 
    scholarName       NVARCHAR2(20)      NOT NULL, 
    Year              DATE               NOT NULL, 
    semester          NUMBER(1)          NOT NULL, 
    scholarContent    NVARCHAR2(2000)    NOT NULL, 
    amount            NUMBER             NOT NULL, 
    delStatus			NUMBER(1)				NOT NULL,
    CONSTRAINT SCHOLARSHIP_PK PRIMARY KEY (scholarPk)
)
/

CREATE SEQUENCE scholarship_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER scholarship_AI_TRG
BEFORE INSERT ON scholarship 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT scholarship_SEQ.NEXTVAL
    INTO: NEW.scholarPk
    FROM DUAL;
END;
/

--DROP TRIGGER scholarship_AI_TRG;
/

--DROP SEQUENCE scholarship_SEQ;
/

COMMENT ON TABLE scholarship IS '장학금'
/

COMMENT ON COLUMN scholarship.scholarPk IS '장학금번호'
/

COMMENT ON COLUMN scholarship.scholarName IS '장학금명'
/

COMMENT ON COLUMN scholarship.Year IS '년도'
/

COMMENT ON COLUMN scholarship.semester IS '학기'
/

COMMENT ON COLUMN scholarship.scholarContent IS '장학금 내용'
/

COMMENT ON COLUMN scholarship.amount IS '신청금액'
/


-- payment Table Create SQL
CREATE TABLE payment
(
    paymentCode      NUMBER           NOT NULL, 
    empNumber        NVARCHAR2(20)    NOT NULL, 
    incentiveCode    NUMBER           NOT NULL, 
    CONSTRAINT PAYMENT_PK PRIMARY KEY (paymentCode)
)
/

CREATE SEQUENCE payment_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER payment_AI_TRG
BEFORE INSERT ON payment 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT payment_SEQ.NEXTVAL
    INTO: NEW.paymentCode
    FROM DUAL;
END;
/

--DROP TRIGGER payment_AI_TRG;
/

--DROP SEQUENCE payment_SEQ;
/

COMMENT ON TABLE payment IS '급여'
/

COMMENT ON COLUMN payment.paymentCode IS '급여 코드'
/

COMMENT ON COLUMN payment.empNumber IS '교번'
/

COMMENT ON COLUMN payment.incentiveCode IS '수당코드'
/

CREATE UNIQUE INDEX payment_Index_1 ON payment (
    empNumber ASC, 
    incentiveCode ASC
)
/

ALTER TABLE payment
    ADD CONSTRAINT FK_payment_empNumber_employee_ FOREIGN KEY (empNumber)
        REFERENCES employee (empNumber)
/

ALTER TABLE payment
    ADD CONSTRAINT FK_payment_incentiveCode_incen FOREIGN KEY (incentiveCode)
        REFERENCES incentiveMenu (incentiveCode)
/


-- paymentList Table Create SQL
CREATE TABLE paymentList
(
    paylistNum              NUMBER           NOT NULL, 
    imputedYear             DATE             NULL, 
    paymentClassfication    NVARCHAR2(10)    NULL, 
    beginningPeriod         DATE             NULL, 
    endPeriod               DATE             NULL, 
    paymentDate             DATE             NULL, 
    paymentYear             DATE             NULL, 
    registerName            NVARCHAR2(30)    NULL, 
    CONSTRAINT PAYMENTLIST_PK PRIMARY KEY (paylistNum)
)
/

CREATE SEQUENCE paymentList_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER paymentList_AI_TRG
BEFORE INSERT ON paymentList 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT paymentList_SEQ.NEXTVAL
    INTO: NEW.paylistNum
    FROM DUAL;
END;
/

--DROP TRIGGER paymentList_AI_TRG;
/

--DROP SEQUENCE paymentList_SEQ;
/

COMMENT ON TABLE paymentList IS '급여대장'
/

COMMENT ON COLUMN paymentList.paylistNum IS '급여대장 번호'
/

COMMENT ON COLUMN paymentList.imputedYear IS '귀속 연월'
/

COMMENT ON COLUMN paymentList.paymentClassfication IS '급여 구분'
/

COMMENT ON COLUMN paymentList.beginningPeriod IS '대상 시작 기간'
/

COMMENT ON COLUMN paymentList.endPeriod IS '대상 종료 기간'
/

COMMENT ON COLUMN paymentList.paymentDate IS '지급일'
/

COMMENT ON COLUMN paymentList.paymentYear IS '지급 연월'
/

COMMENT ON COLUMN paymentList.registerName IS '대장 명칭'
/


-- studentClassInfo Table Create SQL
CREATE TABLE studentClassInfo
(
    infoCode      NUMBER           NOT NULL, 
    lecCode       NVARCHAR2(10)    NOT NULL, 
    userNumber    NVARCHAR2(20)    NOT NULL, 
    status        NUMBER           NOT NULL, 
    CONSTRAINT STUDENTCLASSINFO_PK PRIMARY KEY (infoCode)
)
/

CREATE SEQUENCE studentClassInfo_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER studentClassInfo_AI_TRG
BEFORE INSERT ON studentClassInfo 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT studentClassInfo_SEQ.NEXTVAL
    INTO: NEW.infoCode
    FROM DUAL;
END;
/

--DROP TRIGGER studentClassInfo_AI_TRG;
/

--DROP SEQUENCE studentClassInfo_SEQ;
/

COMMENT ON TABLE studentClassInfo IS '학생 수강 정보'
/

COMMENT ON COLUMN studentClassInfo.infoCode IS '수강정보 코드'
/

COMMENT ON COLUMN studentClassInfo.lecCode IS '강의번호'
/

COMMENT ON COLUMN studentClassInfo.userNumber IS '사용자 번호'
/

COMMENT ON COLUMN studentClassInfo.status IS '상태'
/

ALTER TABLE studentClassInfo
    ADD CONSTRAINT FK_studentClassInfo_userNumber FOREIGN KEY (userNumber)
        REFERENCES student (stdNumber)
/

ALTER TABLE studentClassInfo
    ADD CONSTRAINT FK_studentClassInfo_lecCode_le FOREIGN KEY (lecCode)
        REFERENCES lecture (lecCode)
/


-- credit Table Create SQL
CREATE TABLE credit
(
    credit    NVARCHAR2(3)    NOT NULL, 
    score     NUMBER(1,1)     NOT NULL, 
    CONSTRAINT CREDIT_PK PRIMARY KEY (credit)
)
/

COMMENT ON TABLE credit IS '학점'
/

COMMENT ON COLUMN credit.credit IS '학점'
/

COMMENT ON COLUMN credit.score IS '점수'
/


-- timetable Table Create SQL
CREATE TABLE timetable
(
    timetblCode             NUMBER          NOT NULL, 
    lectureDay              NVARCHAR2(1)    NOT NULL, 
    lectureTimeCode         NUMBER          NOT NULL, 
    beginningLectureTime    NVARCHAR2(5)    NOT NULL, 
    endLectureTime          NVARCHAR2(5)    NOT NULL, 
    CONSTRAINT TIMETABLE_PK PRIMARY KEY (timetblCode)
)
/

COMMENT ON TABLE timetable IS '시간표'
/

COMMENT ON COLUMN timetable.timetblCode IS 'timetblCode'
/

COMMENT ON COLUMN timetable.lectureDay IS 'lectureDay'
/

COMMENT ON COLUMN timetable.lectureTimeCode IS 'lectureTime'
/

COMMENT ON COLUMN timetable.beginningLectureTime IS 'beginningLectureTime'
/

COMMENT ON COLUMN timetable.endLectureTime IS 'endLectureTime'
/

ALTER TABLE timetable
    ADD CONSTRAINT FK_timetable_lectureDay_day_le FOREIGN KEY (lectureDay)
        REFERENCES day (lectureDay)
/


-- messages Table Create SQL
CREATE TABLE messages
(
    messagecode     NUMBER             NOT NULL, 
    userNumber      NVARCHAR2(20)      NOT NULL, 
    sendUser        NVARCHAR2(20)      NOT NULL, 
    message         NVARCHAR2(2000)    NULL, 
    readStatus      NUMBER(1)          NULL, 
    sendTime        TIMESTAMP          NULL, 
    notifyStatus    NUMBER(1)          NULL, 
    CONSTRAINT MESSAGES_PK PRIMARY KEY (messagecode)
)
/

CREATE SEQUENCE messages_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER messages_AI_TRG
BEFORE INSERT ON messages 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT messages_SEQ.NEXTVAL
    INTO: NEW.messagecode
    FROM DUAL;
END;
/

--DROP TRIGGER messages_AI_TRG;
/

--DROP SEQUENCE messages_SEQ;
/

COMMENT ON TABLE messages IS '메세지'
/

COMMENT ON COLUMN messages.messagecode IS '메세지코드'
/

COMMENT ON COLUMN messages.userNumber IS '사용자번호'
/

COMMENT ON COLUMN messages.sendUser IS '보낸사용자'
/

COMMENT ON COLUMN messages.message IS '메세지'
/

COMMENT ON COLUMN messages.readStatus IS '읽었는지 여부'
/

COMMENT ON COLUMN messages.sendTime IS '보낸시간'
/

COMMENT ON COLUMN messages.notifyStatus IS '공지 여부'
/

ALTER TABLE messages
    ADD CONSTRAINT FK_messages_userNumber_users_u FOREIGN KEY (userNumber)
        REFERENCES users (userNumber)
/

ALTER TABLE messages
    ADD CONSTRAINT FK_messages_sendUser_users_use FOREIGN KEY (sendUser)
        REFERENCES users (userNumber)
/


-- studentState Table Create SQL
CREATE TABLE studentState
(
    stdNumber           NVARCHAR2(20)    NOT NULL, 
    semester            NUMBER(1)        NOT NULL, 
    graduation_state    NUMBER(1)        NOT NULL, 
    CONSTRAINT STUDENTSTATE_PK PRIMARY KEY (stdNumber)
)
/

COMMENT ON TABLE studentState IS '학적'
/

COMMENT ON COLUMN studentState.stdNumber IS '학번'
/

COMMENT ON COLUMN studentState.semester IS '학기'
/

COMMENT ON COLUMN studentState.graduation_state IS '졸업여부'
/

ALTER TABLE studentState
    ADD CONSTRAINT FK_studentState_stdNumber_stud FOREIGN KEY (stdNumber)
        REFERENCES student (stdNumber)
/


-- schoolLeave Table Create SQL
CREATE TABLE schoolLeave
(
    schoolLeaveStateCode    NUMBER           NOT NULL, 
    stdNumber               NVARCHAR2(20)    NOT NULL, 
    kind                    NVARCHAR2(10)    NULL, 
    leaveStart              DATE             NULL, 
    leaveEnd                DATE             NULL, 
    leaveStatus             NUMBER(1)        NULL, 
    CONSTRAINT SCHOOLLEAVE_PK PRIMARY KEY (schoolLeaveStateCode)
)
/

COMMENT ON TABLE schoolLeave IS '휴복학 내역'
/

COMMENT ON COLUMN schoolLeave.schoolLeaveStateCode IS '휴복학 내역 코드'
/

COMMENT ON COLUMN schoolLeave.stdNumber IS '학번'
/

COMMENT ON COLUMN schoolLeave.kind IS '구분'
/

COMMENT ON COLUMN schoolLeave.leaveStart IS '시작일'
/

COMMENT ON COLUMN schoolLeave.leaveEnd IS '종료일'
/

COMMENT ON COLUMN schoolLeave.leaveStatus IS '상태'
/

ALTER TABLE schoolLeave
    ADD CONSTRAINT FK_schoolLeave_stdNumber_stude FOREIGN KEY (stdNumber)
        REFERENCES student (stdNumber)
/


-- scholarshipInfo Table Create SQL
CREATE TABLE scholarshipInfo
(
    schInfoPk    NUMBER           NOT NULL, 
    scholarPk    NUMBER           NOT NULL, 
    stdNumber    NVARCHAR2(20)    NOT NULL, 
    statCode     NUMBER           NOT NULL, 
    CONSTRAINT SCHOLARSHIPINFO_PK PRIMARY KEY (schInfoPk)
)
/

CREATE SEQUENCE scholarshipInfo_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER scholarshipInfo_AI_TRG
BEFORE INSERT ON scholarshipInfo 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT scholarshipInfo_SEQ.NEXTVAL
    INTO: NEW.schInfoPk
    FROM DUAL;
END;
/

--DROP TRIGGER scholarshipInfo_AI_TRG;
/

--DROP SEQUENCE scholarshipInfo_SEQ;
/

COMMENT ON TABLE scholarshipInfo IS '장학정보'
/

COMMENT ON COLUMN scholarshipInfo.schInfoPk IS '장학금 상세코드'
/

COMMENT ON COLUMN scholarshipInfo.scholarPk IS '장학금번호'
/

COMMENT ON COLUMN scholarshipInfo.stdNumber IS '학번'
/

COMMENT ON COLUMN scholarshipInfo.statCode IS '상태 번호'
/

CREATE UNIQUE INDEX scholarshipInfo_Index_1 ON scholarshipInfo (
    scholarPk ASC, 
    statCode ASC
)
/

ALTER TABLE scholarshipInfo
    ADD CONSTRAINT FK_scholarshipInfo_stdNumber_s FOREIGN KEY (stdNumber)
        REFERENCES student (stdNumber)
/

ALTER TABLE scholarshipInfo
    ADD CONSTRAINT FK_scholarshipInfo_statCode_sc FOREIGN KEY (statCode)
        REFERENCES scholarState (statCode)
/

ALTER TABLE scholarshipInfo
    ADD CONSTRAINT FK_scholarshipInfo_scholarPk_s FOREIGN KEY (scholarPk)
        REFERENCES scholarship (scholarPk)
/


-- registerDetail Table Create SQL
CREATE TABLE registerDetail
(
    regDeCode       NUMBER    NOT NULL, 
    paylistNum      NUMBER    NOT NULL, 
    paymentCode     NUMBER    NOT NULL, 
    totalPayment    NUMBER    NULL, 
    CONSTRAINT REGISTERDETAIL_PK PRIMARY KEY (regDeCode)
)
/

CREATE SEQUENCE registerDetail_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER registerDetail_AI_TRG
BEFORE INSERT ON registerDetail 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT registerDetail_SEQ.NEXTVAL
    INTO: NEW.regDeCode
    FROM DUAL;
END;
/

--DROP TRIGGER registerDetail_AI_TRG;
/

--DROP SEQUENCE registerDetail_SEQ;
/

COMMENT ON TABLE registerDetail IS '급여대장 상세'
/

COMMENT ON COLUMN registerDetail.regDeCode IS '급여대장 상세 내용 코드'
/

COMMENT ON COLUMN registerDetail.paylistNum IS '급여대장 번호'
/

COMMENT ON COLUMN registerDetail.paymentCode IS '급여 코드'
/

COMMENT ON COLUMN registerDetail.totalPayment IS '총 금액'
/

CREATE UNIQUE INDEX registerDetail_Index_1 ON registerDetail (
    paylistNum ASC, 
    paymentCode ASC
)
/

ALTER TABLE registerDetail
    ADD CONSTRAINT FK_registerDetail_paylistNum_p FOREIGN KEY (paylistNum)
        REFERENCES paymentList (paylistNum) on delete cascade
/

ALTER TABLE registerDetail
    ADD CONSTRAINT FK_registerDetail_paymentCode_ FOREIGN KEY (paymentCode)
        REFERENCES payment (paymentCode)
/


-- gpa Table Create SQL
CREATE TABLE gpa
(
    infoCode    NUMBER          NOT NULL, 
    credit      NVARCHAR2(3)    NOT NULL, 
    CONSTRAINT GPA_PK PRIMARY KEY (infoCode, credit)
)
/

COMMENT ON TABLE gpa IS '성적'
/

COMMENT ON COLUMN gpa.infoCode IS '수강정보 코드'
/

COMMENT ON COLUMN gpa.credit IS '학점'
/

ALTER TABLE gpa
    ADD CONSTRAINT FK_gpa_infoCode_studentClassIn FOREIGN KEY (infoCode)
        REFERENCES studentClassInfo (infoCode)
/

ALTER TABLE gpa
    ADD CONSTRAINT FK_gpa_credit_credit_credit FOREIGN KEY (credit)
        REFERENCES credit (credit)
/


-- lectureTime Table Create SQL
CREATE TABLE lectureTime
(
    lectureTimeCode    NUMBER           NOT NULL, 
    lecCode            NVARCHAR2(10)    NOT NULL, 
    timetblCode        NUMBER           NOT NULL, 
    CONSTRAINT LECTURETIME_PK PRIMARY KEY (lectureTimeCode)
)
/

CREATE SEQUENCE lectureTime_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER lectureTime_AI_TRG
BEFORE INSERT ON lectureTime 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT lectureTime_SEQ.NEXTVAL
    INTO: NEW.lectureTimeCode
    FROM DUAL;
END;
/

--DROP TRIGGER lectureTime_AI_TRG;
/

--DROP SEQUENCE lectureTime_SEQ;
/

COMMENT ON TABLE lectureTime IS '강의 시간'
/

COMMENT ON COLUMN lectureTime.lectureTimeCode IS '강의시간코드'
/

COMMENT ON COLUMN lectureTime.lecCode IS '강의번호'
/

COMMENT ON COLUMN lectureTime.timetblCode IS '시간표 코드'
/

ALTER TABLE lectureTime
    ADD CONSTRAINT FK_lectureTime_lecCode_lecture FOREIGN KEY (lecCode)
        REFERENCES lecture (lecCode)
/

ALTER TABLE lectureTime
    ADD CONSTRAINT FK_lectureTime_timetblCode_tim FOREIGN KEY (timetblCode)
        REFERENCES timetable (timetblCode)
/


-- lectureSelectPeriod Table Create SQL
CREATE TABLE lectureSelectPeriod
(
    Year                  DATE         NOT NULL, 
    semester              NUMBER(1)    NOT NULL, 
    grade                 NUMBER(1)    NOT NULL, 
    startSelectLecture    DATE         NOT NULL, 
    endSelectLecture      DATE         NOT NULL, 
    CONSTRAINT LECTURESELECTPERIOD_PK PRIMARY KEY (Year, semester, grade)
)
/

COMMENT ON TABLE lectureSelectPeriod IS '수강 신청 기간'
/

COMMENT ON COLUMN lectureSelectPeriod.Year IS '년도'
/

COMMENT ON COLUMN lectureSelectPeriod.semester IS '학기'
/

COMMENT ON COLUMN lectureSelectPeriod.grade IS '학년'
/

COMMENT ON COLUMN lectureSelectPeriod.startSelectLecture IS '시작일'
/

COMMENT ON COLUMN lectureSelectPeriod.endSelectLecture IS '종료일'
/

ALTER TABLE lecture
    ADD (week NUMBER);
    
ALTER TABLE lecture
    ADD (intro NVARCHAR2(2000));
    
DROP TABLE "lecturePlan" CASCADE CONSTRAINTS;
    
CREATE TABLE lecturePlan(
    lecCode NVARCHAR2(10) ,
    week NUMBER ,
    contents  NVARCHAR2(2000) NOT NULL,
    text    NVARCHAR2(1000) NOT NULL,
    primary key(lecCode, week)
);

ALTER TABLE lecturePlan
    ADD FOREIGN KEY(lecCode) REFERENCES lecture(lecCode);

    
SELECT 'ALTER SEQUENCE '||SEQUENCE_NAME||' NOCACHE;'
FROM USER_SEQUENCES;
    
ALTER SEQUENCE INCENTIVEMENU_SEQ NOCACHE;
ALTER SEQUENCE LECTURETIME_SEQ NOCACHE;
ALTER SEQUENCE MESSAGES_SEQ NOCACHE;
ALTER SEQUENCE PAYMENTLIST_SEQ NOCACHE;
ALTER SEQUENCE PAYMENT_SEQ NOCACHE;
ALTER SEQUENCE REGISTERDETAIL_SEQ NOCACHE;
ALTER SEQUENCE SCHOLARSHIPINFO_SEQ NOCACHE;
ALTER SEQUENCE SCHOLARSHIP_SEQ NOCACHE;
ALTER SEQUENCE SCHOLARSTATE_SEQ NOCACHE;
ALTER SEQUENCE SEQ_MAJOR_MAJORNUM NOCACHE;
ALTER SEQUENCE STUDENTCLASSINFO_SEQ NOCACHE;
ALTER SEQUENCE TIMETBLCODE_SEQ NOCACHE;