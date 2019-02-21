
SELECT * FROM messages WHERE usernumber = '201010385'
			AND readstatus = 0
    		ORDER BY notifystatus DESC, sendtime DESC;
            
INSERT INTO users(
    USERNUMBER
    , USERPASSWORD
    , USERNAME
    , USERENGNAME
    , USERIMAGE
    , GENDER
    , USERCELLNUM
    , USEREMAIL
    , USERSSN
    , USERZIPCODE
    , USERADDR1
    , USERADDR2
    , DELSTATUS
    , AUTHORITY)
    VALUES(
    'admin', '1234', '테스터(어드민)', 'TESTER(ADMIN)'
    , '/images/img.jpg', '남', '000-0000-0000', 'tester@gmail.com', '000000-0000000'
    , '00000', ' ', ' ', 0, 'ROLE_ADMIN');
    
commit;
INSERT INTO users(
    USERNUMBER
    , USERPASSWORD
    , USERNAME
    , USERENGNAME
    , USERIMAGE
    , GENDER
    , USERCELLNUM
    , USEREMAIL
    , USERSSN
    , USERZIPCODE
    , USERADDR1
    , USERADDR2
    , DELSTATUS
    , AUTHORITY)
    VALUES(
    '201010385', '1234', '김정남', 'Kim Jeongnam'
    , '/images/img.jpg', '남', '010-9515-7416', 'kim8888@gmail.com', '910712-*******'
    , '00000', ' ', ' ', 0, 'ROLE_STUDENT');
commit;

INSERT INTO employee(
    EMPNUMBER
    , MAJORNUM
    , EMPHIREDDATE
    , ANNUALLEVEL
    , INTRODUCTION
    , BANKNAME
    , ACCOUNTNUMBER
    , ACCOUNTHOLDER)
    VALUES(
    'admin', 100
    , TO_DATE('2015-01-01', 'YYYY-MM-DD')
    , 4
    , '자기소개하기'
    , '우리은행'
    , '0000-00000-0000'
    , '테스터 어드민');
commit;

INSERT INTO student(
    STDNUMBER
    , MAJORNUM
    , GRADE
    , ADDATE
    , GRADATE)
    VALUES(
    '201010385', 100, 3
    , TO_DATE('2010-03-02', 'YYYY-MM-DD')
    , TO_DATE('2017-02-22', 'YYYY-MM-DD'));
commit;

SELECT *
FROM USER_SEQUENCES;


INSERT INTO messages
    VALUES(
    messages_seq.nextval,
    '201010385'
    , 'admin'
    , '테스트 메세지1'
    , 0
    , SYSDATE
    , 0);
    
INSERT INTO messages
    VALUES(
    messages_seq.nextval,
    '201010385'
    , 'admin'
    , '테스트 메세지4'
    , 0
    , SYSDATE
    , 0);

INSERT INTO messages
    VALUES(
    messages_seq.nextval,
    '201010385'
    , 'admin'
    , '테스트 메세지3'
    , 0
    , SYSDATE
    , 0);

commit;

UPDATE LECTURESELECTPERIOD SET
    STARTSELECTLECTURE = TO_DATE('2019-02-21 17:53', 'YYYY-MM-DD HH24:MI')
    , ENDSELECTLECTURE = TO_DATE('2019-02-23 22:00', 'YYYY-MM-DD HH24:MI')
    , OPENINGDAY = TO_DATE('2019-03-02 00:00', 'YYYY-MM-DD HH24:MI')
    , GARDEOPENINGDAY = TO_DATE('2019-06-22 00:00', 'YYYY-MM-DD HH24:MI')
    , ENDINGDAY = TO_DATE('2019-06-30 09:00', 'YYYY-MM-DD HH24:MI')
    WHERE year ='2019' AND semester=1;

commit;
