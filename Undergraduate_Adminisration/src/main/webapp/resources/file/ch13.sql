/*
    PL/SQL(Oracle's Procedural Language Extension to SQL)은 오라클에서 지원하는 절차적 프로그래밍 언어이다.
    - 데이터 타입
    1) 스칼라 : 숫자, 문자, 날짜, BOOLEAN
    2) 레퍼런스 : - 테이블명.컬럼명%TYPE : 데이터베이스 기존 컬럼에 맞추어 선언
                - %ROWTYPE : 로우(행) 전체에 대한 데이터타입 참조시, 테이블의 컬럼명과 데이터 타입, 크기를 그대로 참조.
                             데이터 컬럼갯수나 데이터 타입을 전혀 몰라도 SELECT문장으로 로우 조회시 사용, 
    - 대입문 :   변수 := 값;           
*/
set serveroutput on;

DECLARE
    v_eno   emp.empno%type;
    v_ename emp.ename%type;
BEGIN
    dbms_output.put_line('사원번호    사원이름');
    dbms_output.put_line('------------------');
    
    SELECT empno, ename INTO v_eno, v_ename
      FROM emp
    WHERE empno = 'c001';  
    
    dbms_output.put_line(v_eno || '    ' || v_ename);
END;
/


-- 연봉계산 .. hr 계정에서 실행
set serveroutput on;
DECLARE
    v_employee employees%rowtype;
    temp    number(4) := 1;
    annsal  number(7,2);
BEGIN
    SELECT * INTO v_employee
      FROM employees
    WHERE last_name='Chen';
    
    IF(v_employee.commission_pct IS NULL) THEN
      v_employee.commission_pct := 0;
    END IF;  

    annsal := v_employee.salary * 12 + v_employee.commission_pct;
    
    dbms_output.put_line('사원번호   사원이름   연봉');
    dbms_output.put_line('----------------------');
    dbms_output.put_line(v_employee.employee_id || '   ' || v_employee.last_name || ' ' || annsal);
END;
/

/*
     p367
     15장. 프로시저와 함수와 트리거
*/
-- p368 OUT 매개변수 사용하기.. HR 계정에서 실행

CREATE OR REPLACE PROCEDURE sp_salary_ename2(
    v_ename IN employees.last_name%type,
    v_salary OUT employees.salary%type)
IS
BEGIN
    SELECT salary INTO v_salary
      FROM employees
     WHERE last_name = v_ename;
END;
/
VARIABLE v_salary VARCHAR2(14); 
EXECUTE sp_salary_ename2('Chen', :v_salary);
PRINT v_salary;

/*
    2. 함수
*/

/*
    3. 트리거
- 정의 : INSERT, UPDATE, DELETE(이벤트)문이 TABLE에 대해 실행될 때 묵시적으로 수행되는 PROCEDURE이다.
        사전적인 의미 : 연쇄반응, 일련의 사건 등을 유발하는 자극
        오라클에서의 트리거는 어떤 이벤트가 발생했을 때 내부적으로 자동 실행되도록 하는 STORED PROCEDURE이다.
        함수나 프로시저는 사용자가 원할때 EXECUTE 문으로 직접 호출하지만, 트리거는 호출명령어가 없다.
        이벤트는 DML문(INSERT, UPDATE, DELETE)에 의해서 테이블에 어떤 변화가 발생하는 것을 말한다.
        
- 종류 : BEFORE 트리거 : 어떤 테이블 I,U,D문이 실행될 때, 해당 문장이 실행되기 전에
                       BEGIN~END사이의 트리거문장을 실행한다.
        AFTER 트리거 : 어떤 테이블 I,U,D문이 실행될 때, 해당 문장이 실행된 후에
                       BEGIN~END사이의 트리거문장을 실행한다.            
                       
- 유형 : 행 트리거 : 컬럼의 각각의 행에 데이터변화가 생길때마다 실행되며,
                그 데이터행의 실제값을 제어하는데 사용되는 연산자는 ':OLD', ':NEW'가 있으며,
                이 연산자와 컬럼명을 함께 기술한다.
                FOR EACH ROW를 기술하면 행 트리거가 된다.
        문장 크리거 : 트리거 사건에 의해 단 한번 실행되며, 컬럼의 각데이터 행을 제어할 수 없다.
                    실행전에 트리거 권한을 주어야 한디.
                     FOR EACH ROW를 생략하면 문장 트리거가 된다.
*/
CREATE TABLE dept_original
AS
SELECT * FROM dept
 WHERE 0=1; --구조만 복사
 
CREATE TABLE dept_backup
AS
SELECT * FROM dept
 WHERE 0=1; --구조만 복사 

SELECT * FROM dept_backup;
SELECT * FROM dept_original;
--1. 트리거 생성.. 1번만
CREATE OR REPLACE TRIGGER trigger_sample1
    AFTER INSERT
    ON dept_original
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Insert Trigger 발생');
    INSERT INTO dept_backup
    VALUES(:new.deptno, :new.deptname, :new.loc);    
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERR CODE : ' || TO_CHAR(SQLCODE));
            DBMS_OUTPUT.PUT_LINE('ERR MESSAGE : ' || SQLERRM);
END;
/
--2.이벤트.. 반복
INSERT INTO dept_original
 VALUES(20, 'ACCOUNT', '뉴욕');
COMMIT;

--3.확인
SELECT * FROM dept_original;
SELECT * FROM dept_backup;

--1. 트리거 생성.. 1번만
CREATE OR REPLACE TRIGGER trigger_sample2
    AFTER DELETE
    ON dept_original
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Delete Trigger 발생');
    DELETE FROM dept_backup
    WHERE deptno = :old.deptno;    
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERR CODE : ' || TO_CHAR(SQLCODE));
            DBMS_OUTPUT.PUT_LINE('ERR MESSAGE : ' || SQLERRM);
END;
/
--2.이벤트.. 반복
DELETE FROM dept_original
 WHERE deptno = 20;
COMMIT;

--3.확인
SELECT * FROM dept_original;
SELECT * FROM dept_backup;

-- 트리거, 프로시저 데이터 사전
SELECT * FROM USER_SOURCE;