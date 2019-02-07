SELECT * 
    FROM
    (SELECT ROWNUM rnum, messagecode, usernumber, senduser, message, readstatus
    , sendyear, sendmonth, sendday, sendhour, sendmin, sendsec
    , day, hour, min, sec, notifystatus, senduserimage FROM getmessage_view
    WHERE userNumber = '201010385'
    AND sendyear like '공지' OR sendmonth like '공지' OR sendday like '공지' OR senduser like '%공지%' OR message like '%공지%'
    )
    WHERE rnum >= 1 AND rnum <= 10;