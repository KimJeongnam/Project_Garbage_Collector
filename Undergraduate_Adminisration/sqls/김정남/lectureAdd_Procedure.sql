
select * from user_sequences;

INSERT INTO lecture
    VALUES(TO_CHAR(lecture_seq.nextval), 'MAJORNUM', 'EMPNUMBER'
    , 'LECTURENAME', 'LECTURECLASSFICATION', 'MAXIMUMCAPACITY', 'GRADE', 'GRANTEDSEMESTER'
    , 'LECTURESCORE', 'CLASSROOM', 16, '', 0, TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')), 0);


CREATE TYPE array_int AS TABLE OF NUMBER;


CREATE OR REPLACE PROCEDURE add_lecturetime_proc(
    v_leccode in lecturetime.leccode%type
    , v_timetblcode in NUMBER)
AS
BEGIN
    INSERT INTO lecturetime
    VALUES(lecturetime_seq.nextval, v_leccode, v_timetblcode);
END;
/


CREATE OR REPLACE PROCEDURE add_lecture_proc(
    v_majornum in lecture.majornum%type
    , v_empnumber in lecture.empnumber%type
    , v_lecturename in lecture.lecturename%type
    , v_lectureclassfication in lecture.lectureclassfication%type
    , v_maximumcapacity in lecture.maximumcapacity%type
    , v_grade in lecture.grade%type
    , v_grantedsemester in lecture.grantedsemester%type
    , v_lecturescore in lecture.lecturescore%type
    , v_classroom in lecture.classroom%type
    , v_year in lecture.year%type
    , ttc_array in array_int
    , v_result out NUMBER)
AS
BEGIN
    INSERT INTO lecture
        VALUES(TO_CHAR(lecture_seq.nextval), v_majornum, v_empnumber
    , v_lecturename, v_lectureclassfication, v_maximumcapacity, v_grade, v_grantedsemester
    , v_lecturescore, v_classroom, 16, '', 0, v_year, 0);
    
    v_result:=1;
    FOR i IN 1 ..ttc_array.COUNT
    LOOP
        add_lecturetime_proc(lecture_seq.currval, ttc_array(i));
        v_result:=v_result+1;
    END LOOP;
    
    IF v_result-1 = ttc_array.COUNT THEN
        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
        
END;
/


INSERT ALL
    INTO lecture
    VALUES(TO_CHAR(lecture_seq.nextval), '120', '20181125'
    , '간호학 개론', '0', '1', '1', '1'
    , '3', '간호대 104호', 16, '', 0, TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')), 0)
    INTO lecturetime
    VALUES(lecturetime_seq.nextval, lecture_seq.currval, 1)
    INTO lecturetime
    VALUES(lecturetime_seq.nextval, lecture_seq.currval, 2)
    INTO lecturetime
    VALUES(lecturetime_seq.nextval, lecture_seq.currval, 41)
    INTO lecturetime
    VALUES(lecturetime_seq.nextval, lecture_seq.currval, 12)
SELECT * FROM dual;

ROLLBACK;

CREATE OR REPLACE PROCEDURE addlecture_test
IS
    v_ttc array_int;
    v_result NUMBER;
BEGIN
    v_ttc:=NEW array_int();
    v_ttc.EXTEND(4);
    v_ttc(1):=1;
    v_ttc(2):=2;
    v_ttc(3):=41;
    v_ttc(4):=12;
    
    
    add_lecture_proc('120', '20181125'
        , '간호학 개론', '1', '50', '1', '1'
        , '3', '간호대 104호', '2019', v_ttc, v_result);
END;
/

execute addlecture_test;

rollback;

SELECT * FROM All_coll_types WHERE type_name like '%ARRAY%';



-- 강의 상태 변화 (학기, 상태, 반환값)
set serveroutput on
DECLARE
    v_result NUMBER;
BEGIN
    update_lecture_lecstatus_proc(1, 2, v_result);
    DBMS_OUTPUT.PUT_LINE('result : '||v_result);
END;
/