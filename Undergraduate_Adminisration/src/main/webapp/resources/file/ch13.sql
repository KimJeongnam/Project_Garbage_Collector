/*
    PL/SQL(Oracle's Procedural Language Extension to SQL)�� ����Ŭ���� �����ϴ� ������ ���α׷��� ����̴�.
    - ������ Ÿ��
    1) ��Į�� : ����, ����, ��¥, BOOLEAN
    2) ���۷��� : - ���̺��.�÷���%TYPE : �����ͺ��̽� ���� �÷��� ���߾� ����
                - %ROWTYPE : �ο�(��) ��ü�� ���� ������Ÿ�� ������, ���̺��� �÷���� ������ Ÿ��, ũ�⸦ �״�� ����.
                             ������ �÷������� ������ Ÿ���� ���� ���� SELECT�������� �ο� ��ȸ�� ���, 
    - ���Թ� :   ���� := ��;           
*/
set serveroutput on;

DECLARE
    v_eno   emp.empno%type;
    v_ename emp.ename%type;
BEGIN
    dbms_output.put_line('�����ȣ    ����̸�');
    dbms_output.put_line('------------------');
    
    SELECT empno, ename INTO v_eno, v_ename
      FROM emp
    WHERE empno = 'c001';  
    
    dbms_output.put_line(v_eno || '    ' || v_ename);
END;
/


-- ������� .. hr �������� ����
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
    
    dbms_output.put_line('�����ȣ   ����̸�   ����');
    dbms_output.put_line('----------------------');
    dbms_output.put_line(v_employee.employee_id || '   ' || v_employee.last_name || ' ' || annsal);
END;
/

/*
     p367
     15��. ���ν����� �Լ��� Ʈ����
*/
-- p368 OUT �Ű����� ����ϱ�.. HR �������� ����

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
    2. �Լ�
*/

/*
    3. Ʈ����
- ���� : INSERT, UPDATE, DELETE(�̺�Ʈ)���� TABLE�� ���� ����� �� ���������� ����Ǵ� PROCEDURE�̴�.
        �������� �ǹ� : �������, �Ϸ��� ��� ���� �����ϴ� �ڱ�
        ����Ŭ������ Ʈ���Ŵ� � �̺�Ʈ�� �߻����� �� ���������� �ڵ� ����ǵ��� �ϴ� STORED PROCEDURE�̴�.
        �Լ��� ���ν����� ����ڰ� ���Ҷ� EXECUTE ������ ���� ȣ��������, Ʈ���Ŵ� ȣ���ɾ ����.
        �̺�Ʈ�� DML��(INSERT, UPDATE, DELETE)�� ���ؼ� ���̺� � ��ȭ�� �߻��ϴ� ���� ���Ѵ�.
        
- ���� : BEFORE Ʈ���� : � ���̺� I,U,D���� ����� ��, �ش� ������ ����Ǳ� ����
                       BEGIN~END������ Ʈ���Ź����� �����Ѵ�.
        AFTER Ʈ���� : � ���̺� I,U,D���� ����� ��, �ش� ������ ����� �Ŀ�
                       BEGIN~END������ Ʈ���Ź����� �����Ѵ�.            
                       
- ���� : �� Ʈ���� : �÷��� ������ �࿡ �����ͺ�ȭ�� ���涧���� ����Ǹ�,
                �� ���������� �������� �����ϴµ� ���Ǵ� �����ڴ� ':OLD', ':NEW'�� ������,
                �� �����ڿ� �÷����� �Բ� ����Ѵ�.
                FOR EACH ROW�� ����ϸ� �� Ʈ���Ű� �ȴ�.
        ���� ũ���� : Ʈ���� ��ǿ� ���� �� �ѹ� ����Ǹ�, �÷��� �������� ���� ������ �� ����.
                    �������� Ʈ���� ������ �־�� �ѵ�.
                     FOR EACH ROW�� �����ϸ� ���� Ʈ���Ű� �ȴ�.
*/
CREATE TABLE dept_original
AS
SELECT * FROM dept
 WHERE 0=1; --������ ����
 
CREATE TABLE dept_backup
AS
SELECT * FROM dept
 WHERE 0=1; --������ ���� 

SELECT * FROM dept_backup;
SELECT * FROM dept_original;
--1. Ʈ���� ����.. 1����
CREATE OR REPLACE TRIGGER trigger_sample1
    AFTER INSERT
    ON dept_original
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Insert Trigger �߻�');
    INSERT INTO dept_backup
    VALUES(:new.deptno, :new.deptname, :new.loc);    
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERR CODE : ' || TO_CHAR(SQLCODE));
            DBMS_OUTPUT.PUT_LINE('ERR MESSAGE : ' || SQLERRM);
END;
/
--2.�̺�Ʈ.. �ݺ�
INSERT INTO dept_original
 VALUES(20, 'ACCOUNT', '����');
COMMIT;

--3.Ȯ��
SELECT * FROM dept_original;
SELECT * FROM dept_backup;

--1. Ʈ���� ����.. 1����
CREATE OR REPLACE TRIGGER trigger_sample2
    AFTER DELETE
    ON dept_original
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Delete Trigger �߻�');
    DELETE FROM dept_backup
    WHERE deptno = :old.deptno;    
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERR CODE : ' || TO_CHAR(SQLCODE));
            DBMS_OUTPUT.PUT_LINE('ERR MESSAGE : ' || SQLERRM);
END;
/
--2.�̺�Ʈ.. �ݺ�
DELETE FROM dept_original
 WHERE deptno = 20;
COMMIT;

--3.Ȯ��
SELECT * FROM dept_original;
SELECT * FROM dept_backup;

-- Ʈ����, ���ν��� ������ ����
SELECT * FROM USER_SOURCE;