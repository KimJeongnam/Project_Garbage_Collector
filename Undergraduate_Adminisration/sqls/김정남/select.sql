SELECT * 
    FROM
    (SELECT ROWNUM rnum, messagecode, usernumber, senduser, message, readstatus
    , sendyear, sendmonth, sendday, sendhour, sendmin, sendsec
    , day, hour, min, sec, notifystatus, senduserimage FROM getmessage_view
    WHERE userNumber = '201010385'
    AND sendyear like '공지' OR sendmonth like '공지' OR sendday like '공지' OR senduser like '%공지%' OR message like '%공지%'
    )
    WHERE rnum >= 1 AND rnum <= 10;
    

-- 해당시퀀스의 nextval 할경우 나올 다음수 조회
   SELECT last_number FROM USER_SEQUENCES
    		WHERE sequence_name = 'SEQ_MAJOR_MAJORNUM';
    		
    		
  
SELECT *
    FROM(
        SELECT ROWNUM rnum
            , l.lecCode , l.majorNum, m.majorName, l.lectureName, u.userNumber, u.userImage
            , u.userName, l.lectureClassfication, l.grade, l.grantedSemester, l.maximumCapacity, l.lecStatus, l.lectureScore
            FROM lecture l JOIN major m
            ON l.majorNum = m.majorNum
            JOIN employee emp
            ON l.empNumber = emp.empNumber
            JOIN users u
            ON emp.empNumber = u.userNumber
            WHERE m.faculty = '사범대'
    )
    WHERE rnum >= 1 AND rnum <= 10
    ORDER BY userName, majorNum, lectureClassfication DESC;
  