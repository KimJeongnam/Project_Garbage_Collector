
-- 메세지를 가져오는 뷰
CREATE OR REPLACE VIEW getmessage_view
AS  SELECT MESSAGECODE
	    , m.usernumber
	    , m.SENDUSER
	    , MESSAGE
	    , READSTATUS
	    , TO_CHAR(SENDTIME, 'YYYY') as sendYear
        , TO_CHAR(SENDTIME, 'MM') as sendMonth
        , TO_CHAR(SENDTIME, 'DD') as sendDay
        , TO_CHAR(SENDTIME, 'HH24') as sendHour
        , TO_CHAR(SENDTIME, 'MI') as sendMin
        , TO_CHAR(SENDTIME, 'SS') as sendSec
	    , EXTRACT(DAY FROM SYSTIMESTAMP-SENDTIME) day
	    , EXTRACT(HOUR FROM SYSTIMESTAMP-SENDTIME) hour
	    , EXTRACT(MINUTE FROM SYSTIMESTAMP-SENDTIME) min
	    , EXTRACT(SECOND FROM SYSTIMESTAMP-SENDTIME) sec
	    , NOTIFYSTATUS
	    , u.userimage as senduserimage
	    FROM messages m JOIN users u
	    ON m.senduser = u.usernumber	 
	    ORDER BY sendtime desc;