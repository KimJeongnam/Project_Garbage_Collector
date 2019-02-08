/*
 *  오라클 system 계정으로 실행가능함
 */
-- 현재 연결되어있으나 구문실행하지 않는 세션들 종료시키는 쿼리문 생성하는 쿼리
select 'alter system kill session '' '||sid || ','||serial# || ''';'
from v$session 
WHERE status = 'INACTIVE'
order by username, status DESC;

