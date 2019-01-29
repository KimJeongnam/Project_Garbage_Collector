rollback;
INSERT INTO users(
    USERNUMBER,
    USERPASSWORD)
    VALUES('201010385', '1234');
INSERT INTO users(
    USERNUMBER,
    USERPASSWORD)
    VALUES('201938057', '1234');
    
INSERT INTO authority(
    AUTHNAME,
    USERNUMBER)
    VALUES('ROLE_USERS', '201010385');
INSERT INTO authority(
    AUTHNAME,
    USERNUMBER)
    VALUES('ROLE_USERS', '201938057');

INSERT INTO faculty(faculty) VALUES('사범대');
INSERT INTO faculty(faculty) VALUES('체육대');
INSERT INTO faculty(faculty) VALUES('예술대');
INSERT INTO faculty(faculty) VALUES('경영대');
INSERT INTO faculty(faculty) VALUES('자연대');
INSERT INTO faculty(faculty) VALUES('공과대');


DROP SEQUENCE seq_major_majorNum;

CREATE SEQUENCE seq_major_majorNum
    START WITH 100
    INCREMENT BY 1
    MAXVALUE 999;
    
ALTER SEQUENCE seq_major_major nocache;



INSERT INTO major(
MAJORNUM,
FACULTY,
MAJORNAME,
MAXNUM
)VALUES(
seq_major_majorNum.NEXTVAL,
'사범대',
'수학교육과',
200);
INSERT INTO major(
MAJORNUM,
FACULTY,
MAJORNAME,
MAXNUM
)VALUES(
seq_major_majorNum.NEXTVAL,
'체육대',
'체육교육과',
200);
INSERT INTO major(
MAJORNUM,
FACULTY,
MAJORNAME,
MAXNUM
)VALUES(
seq_major_majorNum.NEXTVAL,
'예술대',
'연극학과',
200);
INSERT INTO major(
MAJORNUM,
FACULTY,
MAJORNAME,
MAXNUM
)VALUES(
seq_major_majorNum.NEXTVAL,
'경영대',
'경영학과',
200);
INSERT INTO major(
MAJORNUM,
FACULTY,
MAJORNAME,
MAXNUM
)VALUES(
seq_major_majorNum.NEXTVAL,
'자연대',
'물리학과',
200);
INSERT INTO major(
MAJORNUM,
FACULTY,
MAJORNAME,
MAXNUM
)VALUES(
seq_major_majorNum.NEXTVAL,
'공과대',
'기계공학과',
200);


INSERT INTO student(
USERNUMBER,
MAJORNUM,
STDNAME,
STDIMAGE,
STDGRADE,
STDSSN,
STDCELLNUMBER,
STDEMAIL,
STDZIPCODE,
STDADDR1,
STDADDR2,
ADDATE,
GRADATE,
DELSTATUS)VALUES(
'201010385',
102,
'김설현',
'/project/resources/images/img.jpg',
1,
'950103-2023220',
'010-2457-7542',
'sulhyun@naver.com',
'14024',
'경기도 안양시 만안구 병목안로 179',
'금용아파트 1111호',
TO_DATE('2019/03/01', 'YYYY/MM/dd'),
TO_DATE('2023/02/27', 'YYYY/MM/dd'),
0
);

INSERT INTO student(
USERNUMBER,
MAJORNUM,
STDNAME,
STDIMAGE,
STDGRADE,
STDSSN,
STDCELLNUMBER,
STDEMAIL,
STDZIPCODE,
STDADDR1,
STDADDR2,
ADDATE,
GRADATE,
DELSTATUS)VALUES(
'201938057',
100,
'모모',
'/project/resources/images/img2.jpg',
2,
'940609-2010250',
'010-7812-9978',
'momo@naver.com',
'14024',
'경기도 안양시 만안구 병목안로 179',
'금용아파트 1111호',
TO_DATE('2018/03/01', 'YYYY/MM/dd'),
TO_DATE('2024/02/27', 'YYYY/MM/dd'),
0
);

INSERT INTO studentState(
USERNUMBER,
GRADE,
SEMESTER,
GRADUATION_STATE)VALUES(
'201938057',
2,
1,
0);
INSERT INTO studentState(
USERNUMBER,
GRADE,
SEMESTER,
GRADUATION_STATE)VALUES(
'201010385',
1,
1,
0);

INSERT INTO users(
    USERNUMBER,
    USERPASSWORD)
    VALUES('200838057', '1234');
    
INSERT INTO authority(
    AUTHNAME,
    USERNUMBER)
    VALUES('ROLE_ADMIN', '200838057');

INSERT INTO employeesCode(
EMPCODE,
EMPLOYEE)VALUES(
'0',
'정치호');
--EMPCODE 0이면 교직원 / 1이면 교수

INSERT INTO employees(
USERNUMBER,
EMPCODE,
EMPNAME,
EMPENGNAME,
EMPIMAGE,
EMPSSN,
EMPCELLNUMBER,
EMPEMAIL,
EMPZIPCODE,
EMPADDRESS1,
EMPADDRESS2,
EMPHIREDATE,
ANNUALLEVEL,
INTRODUCTION,
DELSTATUS)VALUES(
'200838057',
'0',
'정치호',
'Jeong, Chi Ho',
'/project/resources/images/img2.jpg',
'890614-111111',
'010-2458-7354',
'chiho300@naver.com',
'14024',
'경기도 안양시 만안구 병목안로 179',
'금용아파트 1111호',
TO_DATE('2015/08/01', 'YYYY/MM/dd'),
3,
'자기소개부분',
'0');



DROP SEQUENCE seq_lecture_lecCode;

CREATE SEQUENCE seq_lecture_lecCode
    START WITH 1000
    INCREMENT BY 100
    MAXVALUE 999999;
    
ALTER SEQUENCE seq_lecture_lecCode nocache;

INSERT INTO lecture(
LECCODE,
MAJORNUM,
USERNUMBER,
LECTURENAME,
LECTURECLASSFICATION,
MAXIMUMCAPACITY,
GRADE,
GRANTEDSEMESTER,
LECTURESCORE,
CLASSROOM)VALUES(
seq_lecture_lecCode.nextval,
100,
'200838057',
'수학 교육학',
'1',
40,
1,
1,
3,
'사범대학 2층 1202호');

INSERT INTO lecture(
LECCODE,
MAJORNUM,
USERNUMBER,
LECTURENAME,
LECTURECLASSFICATION,
MAXIMUMCAPACITY,
GRADE,
GRANTEDSEMESTER,
LECTURESCORE,
CLASSROOM)VALUES(
seq_lecture_lecCode.nextval,
101,
'200838057',
'체육학의 정의',
'1',
40,
1,
1,
3,
'사범대학 5층 1507호');
INSERT INTO lecture(
LECCODE,
MAJORNUM,
USERNUMBER,
LECTURENAME,
LECTURECLASSFICATION,
MAXIMUMCAPACITY,
GRADE,
GRANTEDSEMESTER,
LECTURESCORE,
CLASSROOM)VALUES(
seq_lecture_lecCode.nextval,
102,
'200838057',
'연극뮤지컬의 기초',
'1',
40,
1,
1,
3,
'예술대학 5층 2507호');
INSERT INTO lecture(
LECCODE,
MAJORNUM,
USERNUMBER,
LECTURENAME,
LECTURECLASSFICATION,
MAXIMUMCAPACITY,
GRADE,
GRANTEDSEMESTER,
LECTURESCORE,
CLASSROOM)VALUES(
seq_lecture_lecCode.nextval,
103,
'200838057',
'하이먼민스키 모델로 본 비트코인',
'1',
40,
1,
1,
3,
'경영대학 3층 3302호');
INSERT INTO lecture(
LECCODE,
MAJORNUM,
USERNUMBER,
LECTURENAME,
LECTURECLASSFICATION,
MAXIMUMCAPACITY,
GRADE,
GRANTEDSEMESTER,
LECTURESCORE,
CLASSROOM)VALUES(
seq_lecture_lecCode.nextval,
104,
'200838057',
'파인만의 물리학 강의',
'1',
40,
1,
1,
3,
'자연대학 8층 4808호');
INSERT INTO lecture(
LECCODE,
MAJORNUM,
USERNUMBER,
LECTURENAME,
LECTURECLASSFICATION,
MAXIMUMCAPACITY,
GRADE,
GRANTEDSEMESTER,
LECTURESCORE,
CLASSROOM)VALUES(
seq_lecture_lecCode.nextval,
105,
'200838057',
'4대 역학의 정의',
'1',
40,
1,
1,
3,
'공과대학 6층 5601호');


INSERT INTO users(
    USERNUMBER,
    USERPASSWORD)
    VALUES('1234', '1234');
INSERT INTO authority(
    AUTHNAME,
    USERNUMBER)
    VALUES('ROLE_PROFESSOR', '1234');
INSERT INTO employees(
USERNUMBER,
EMPCODE,
EMPNAME,
EMPENGNAME,
EMPIMAGE,
EMPSSN,
EMPCELLNUMBER,
EMPEMAIL,
EMPZIPCODE,
EMPADDRESS1,
EMPADDRESS2,
EMPHIREDATE,
ANNUALLEVEL,
INTRODUCTION,
DELSTATUS)VALUES(
'1234',
'0',
'정치호',
'Jeong, Chi Ho',
'/project/resources/images/img2.jpg',
'890614-111111',
'010-2458-7354',
'chiho300@naver.com',
'14024',
'경기도 안양시 만안구 병목안로 179',
'금용아파트 1111호',
TO_DATE('2015/08/01', 'YYYY/MM/dd'),
3,
'자기소개부분',
'0');


SELECT*
FROM 
employees e 
JOIN accountinfo a
ON e.usernumber = a.usernumber
WHERE e.usernumber='1234';

SELECT majornum FROM student;


commit;