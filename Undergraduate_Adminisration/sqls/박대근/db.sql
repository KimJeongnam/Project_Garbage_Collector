장학
CREATE OR REPLACE VIEW Evaluation AS 
   SELECT info.schinfopk,u.userName,std.grade,sch.semester,sch.scholarName,sch.Year,TO_CHAR(sch.AMOUNT,'$999,999,999,999,999') as AMOUNT,sta.scholarstatus,sch.delStatus,sta.statCode
   FROM users u,student std,scholarState sta,scholarship sch,scholarshipInfo info
   where u.userNumber = std.stdNumber 
   and std.stdNumber = info.stdNumber
   and info.statCode = sta.statCode
   and sch.scholarPk = info.scholarPk
  ;
  
  CREATE OR REPLACE VIEW information AS
   SELECT u.userNumber,u.userImage,u.userName,u.userSsn,u.gender,u.userCellNum,u.userAddr1,u.userAddr2,f.faculty,sd.majorNum,sd.grade,ss.graduation_state,ss.semester
   FROM users u,faculty f,student sd,studentState ss,major m
   where f.faculty = m.faculty
   and m.majorNum = sd.majorNum
   and ss.stdNumber = sd.stdNumber
   and u.userNumber = sd.stdNumber
  ;
  
 CREATE OR REPLACE VIEW middle_class AS
SELECT u.username, l.lecCode,l.majorNum,l.lectureName, l.lectureClassfication, l.maximumCapacity,l.grade,
l.grantedSemester, l.lectureScore, l.classRoom, sc.userNumber,LISTAGG(to_char(t.lectureDay)||t.classTime, ',')within group(order by
		t.classTime) as classTime,u.userCellNum

FROM studentClassInfo sc, lecture l, lectureTime lt, timeTable t, employee e,users u

WHERE sc.lecCode = l.lecCode and l.lecCode = lt.lecCode and e.empNumber = l.empNumber
and lt.timetblCode = t.timetblCode and u.userNumber = e.empNumber and sc.status = 1

GROUP BY e.accountHolder, l.lecCode,l.majorNum,l.lectureName, l.lectureClassfication, l.maximumCapacity,l.grade,
l.grantedSemester, l.lectureScore, l.classRoom, sc.userNumber,u.userCellNum,u.username;
  