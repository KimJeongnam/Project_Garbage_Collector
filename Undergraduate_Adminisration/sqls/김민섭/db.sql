CREATE OR REPLACE VIEW lectureview AS
SELECT rownum rNum, accountHolder, lecCode, majorName, lectureName, lectureClassfication, maximumcapacity, grade
	   , grantedSemester, lectureScore, classRoom, classTime
from
	(SELECT e.accountHolder, l.lecCode,m.majorName,l.lectureName, l.lectureClassfication, 
	(l.maximumcapacity-(select count(*) from studentClassInfo where lecCode=l.lecCode)) as maximumcapacity,l.grade,
	l.grantedSemester, l.lectureScore, l.classRoom, 
	LISTAGG(to_char(t.lectureDay)||t.lectureTimeCode, ',')within group(order by t.lectureTimeCode) classTime
FROM employee e , lecture l, lectureTime lt, timetable t, major m
WHERE e.empNumber = l.empNumber and l.lecCode = lt.lecCode and lt.timetblCode = t.timetblCode and m.majorNum=l.majorNum
GROUP BY e.accountHolder, l.lecCode,m.majorName,l.lectureName, l.lectureClassfication, maximumcapacity,l.grade,
		 l.grantedSemester, l.lectureScore, l.classRoom);

CREATE OR REPLACE VIEW timetableview AS
SELECT sc.infoCode, sc.lecCode, sc.userNumber, sc.status, l.lectureName, t.timetblCode,t.lectureDay, 
		t.beginningLectureTime, t.endLectureTime, dense_rank()over(order by l.lecCode) as rank
 FROM studentClassInfo sc, lecture l, lectureTime lt, timeTable t
WHERE sc.lecCode = l.lecCode and l.lecCode = lt.lecCode 
  and lt.timetblCode = t.timetblCode and sc.status = 1;

CREATE OR REPLACE VIEW mylectureview AS
SELECT e.accountHolder, l.lecCode,l.majorNum,l.lectureName, l.lectureClassfication, l.maximumCapacity,l.grade,
l.grantedSemester, l.lectureScore, l.classRoom, sc.userNumber
FROM studentClassInfo sc, lecture l, lectureTime lt, timeTable t, employee e
WHERE sc.lecCode = l.lecCode and l.lecCode = lt.lecCode and e.empNumber = l.empNumber
and lt.timetblCode = t.timetblCode and sc.status = 1
GROUP BY e.accountHolder, l.lecCode,l.majorNum,l.lectureName, l.lectureClassfication, l.maximumCapacity,l.grade,
l.grantedSemester, l.lectureScore, l.classRoom, sc.userNumber;