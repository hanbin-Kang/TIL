# Oracle DML — INSERT, UPDATE, DELETE

## 1. 데이터 추가하기 — INSERT

회원가입, 새 글 작성, 새로운 이체 내역 등 새로운 데이터가 발생하는 기능은 관련 테이블에 새로운 데이터를 추가함으로써 구현할 수 있다.

Oracle에서 특정 테이블에 새로운 데이터를 추가할 때는 **INSERT문**을 사용한다.

### 기본 문법

```sql
INSERT INTO 테이블 이름 [(열1, 열2, ... , 열n)]
VALUES (열1에 들어갈 데이터, 열2에 들어갈 데이터, ... , 열n에 들어갈 데이터);
```

예시:

```sql
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES (90, 'DEVELOPMENT', 'SEOUL');
```

### INSERT문 사용 시 주의사항

다음과 같은 경우 오류가 발생할 수 있다.

* INSERT문에서 지정한 열의 개수와 입력할 데이터의 개수가 일치하지 않는 경우
* 열의 자료형과 입력 데이터의 자료형이 맞지 않는 경우
* 열의 길이를 초과하는 데이터를 입력하는 경우

---

## 2. 테이블을 잘못 만들었을 때 — DROP TABLE

테이블 자체를 삭제하려면 `DROP TABLE`을 사용한다.

```sql
DROP TABLE 테이블 이름;
```

예시:

```sql
DROP TABLE DEPT_TEMP;
```

> `DROP TABLE`은 테이블과 테이블에 저장된 데이터를 함께 삭제하므로 주의해야 한다.

---

## 3. INSERT를 활용한 NULL 데이터 입력

INSERT문을 사용할 때 `NULL` 데이터를 입력할 수 있다.

### 방법 1 — NULL을 직접 명시

```sql
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES (90, NULL, 'INCHEON');
```

### 방법 2 — 대상 열을 생략

```sql
INSERT INTO DEPT_TEMP (DEPTNO, LOC)
VALUES (90, 'INCHEON');
```

`DNAME` 열을 생략했기 때문에 해당 열에는 `NULL`이 입력된다.

단, 해당 열이 `NOT NULL` 제약 조건을 가지고 있다면 생략할 수 없다.

---

## 4. 날짜 데이터 입력하기

Oracle에서 날짜 데이터를 입력할 때는 `TO_DATE` 또는 `SYSDATE`를 사용할 수 있다.

### TO_DATE

문자열을 날짜 데이터로 변환한다.

```sql
INSERT INTO EMP_TEMP (EMPNO, ENAME, HIREDATE)
VALUES (2111, '이순신', TO_DATE('07/01/2001', 'DD/MM/YYYY'));
```

### SYSDATE

현재 날짜와 시간을 반환한다.

```sql
INSERT INTO EMP_TEMP (EMPNO, ENAME, HIREDATE)
VALUES (2112, '홍길동', SYSDATE);
```

### 기억할 것

```text
TO_DATE() : 문자 → 날짜
TO_CHAR() : 날짜 → 문자
SYSDATE   : 현재 날짜와 시간
```

---

# 5. 서브쿼리를 이용한 데이터 추가

서브쿼리를 이용하면 조건에 맞는 **여러 행을 한 번에 추가**할 수 있다.

예시:

```sql
INSERT INTO EMP_TEMP (
    EMPNO, ENAME, JOB, MGR,
    HIREDATE, SAL, COMM, DEPTNO
)
SELECT EMPNO, ENAME, JOB, MGR,
       HIREDATE, SAL, COMM, DEPTNO
FROM EMP
WHERE DEPTNO = 10;
```

위 SQL은 `EMP` 테이블에서 `DEPTNO = 10`인 사원들을 조회한 후 `EMP_TEMP`에 추가한다.

## INSERT + 서브쿼리 사용 시 주의사항

### 1. VALUES절을 사용하지 않는다

```sql
INSERT INTO EMP_TEMP (...)
SELECT ...
FROM EMP;
```

`SELECT`문을 이용하여 데이터를 가져오기 때문에 `VALUES`절을 사용하지 않는다.

### 2. 열 개수가 일치해야 한다

데이터가 추가되는 테이블의 열 개수와 서브쿼리의 `SELECT` 열 개수가 일치해야 한다.

```text
INSERT 대상 열 개수 = SELECT 열 개수
```

### 3. 자료형이 서로 호환되어야 한다

INSERT 대상 열의 자료형과 `SELECT`에서 가져오는 데이터의 자료형이 맞아야 한다.

---

# 6. 데이터 수정하기 — UPDATE

회원 정보 변경, 결제 계좌 변경, 작성한 글 수정 등의 기능을 수행하려면 데이터베이스에 저장된 데이터를 변경해야 한다.

Oracle에서 특정 테이블의 데이터를 수정할 때는 **UPDATE문**을 사용한다.

### 기본 문법

```sql
UPDATE 변경할 테이블
SET 변경할 열1 = 데이터,
    변경할 열2 = 데이터,
    ...
    변경할 열n = 데이터
WHERE 데이터를 변경할 대상 행을 선별하기 위한 조건;
```

예시:

```sql
UPDATE DEPT_TEMP
SET LOC = 'SEOUL'
WHERE DEPTNO = 40;
```

`DEPTNO`가 40인 행의 `LOC`을 `SEOUL`로 변경한다.

---

## UPDATE + 서브쿼리

서브쿼리를 이용하여 수정할 대상이나 수정할 값을 결정할 수도 있다.

```sql
UPDATE DEPT_TEMP2
SET LOC = 'SEOUL'
WHERE DEPTNO = (
    SELECT DEPTNO
    FROM DEPT_TEMP2
    WHERE DNAME = 'OPERATIONS'
);
```

서브쿼리에서 `DNAME`이 `OPERATIONS`인 부서의 `DEPTNO`를 찾고, 그 부서의 `LOC`을 `SEOUL`로 변경한다.

---

## 여러 열을 동시에 수정하기

```sql
UPDATE DEPT_TEMP
SET (DNAME, LOC) = (
    SELECT DNAME, LOC
    FROM DEPT
    WHERE DEPTNO = 40
)
WHERE DEPTNO = 40;
```

`DEPT`에서 40번 부서의 `DNAME`, `LOC`을 가져와서 `DEPT_TEMP`의 40번 부서에 적용한다.

즉,

```text
DEPT
  ↓
DEPTNO = 40인 행 조회
  ↓
DNAME, LOC 가져오기
  ↓
DEPT_TEMP
  ↓
DEPTNO = 40인 행 수정
```

---

## UPDATE 사용 시 주의사항

UPDATE는 기존 데이터를 직접 변경하기 때문에 주의해서 사용해야 한다.

특히 `WHERE`절을 작성하지 않으면 **테이블의 모든 행이 수정될 수 있다.**

따라서 UPDATE하기 전에 먼저 `SELECT`문으로 수정 대상이 맞는지 확인하는 것이 좋다.

```sql
SELECT *
FROM DEPT_TEMP
WHERE DEPTNO = 40;
```

확인 후 UPDATE한다.

```sql
UPDATE DEPT_TEMP
SET LOC = 'SEOUL'
WHERE DEPTNO = 40;
```

---

# 7. 수정한 내용 되돌리기 — ROLLBACK

아직 `COMMIT`하지 않은 변경 사항을 되돌리고 싶을 때 `ROLLBACK`을 사용할 수 있다.

```sql
ROLLBACK;
```

예시:

```sql
UPDATE DEPT_TEMP
SET LOC = 'SEOUL'
WHERE DEPTNO = 40;

ROLLBACK;
```

위와 같이 실행하면 해당 UPDATE 작업을 되돌릴 수 있다.

> 단, 이미 `COMMIT`한 변경 사항은 일반적인 `ROLLBACK`으로 되돌릴 수 없다.

---

# 8. 데이터 삭제하기 — DELETE

테이블에 저장된 데이터를 삭제할 때는 `DELETE`문을 사용한다.

### 기본 문법

```sql
DELETE FROM 테이블 이름
WHERE 삭제할 대상 행을 선별하기 위한 조건식;
```

예시:

```sql
DELETE FROM DEPT_TEMP
WHERE DEPTNO = 40;
```

`DEPTNO = 40`인 행을 삭제한다.

## DELETE 사용 시 주의사항

`WHERE`절을 생략하면 테이블의 **모든 행이 삭제**된다.

```sql
DELETE FROM DEPT_TEMP;
```

따라서 DELETE 역시 실행 전에 SELECT로 삭제 대상을 확인하는 것이 좋다.

```sql
SELECT *
FROM DEPT_TEMP
WHERE DEPTNO = 40;
```

확인 후:

```sql
DELETE FROM DEPT_TEMP
WHERE DEPTNO = 40;
```

---

# 9. INSERT / UPDATE / DELETE 정리

| 명령어          | 역할                 |
| ------------ | ------------------ |
| `INSERT`     | 새로운 데이터 추가         |
| `UPDATE`     | 기존 데이터 수정          |
| `DELETE`     | 기존 데이터 삭제          |
| `DROP TABLE` | 테이블 자체 삭제          |
| `ROLLBACK`   | 커밋하지 않은 변경 사항 되돌리기 |

```text
INSERT
  ↓
데이터 추가

UPDATE
  ↓
데이터 수정

DELETE
  ↓
데이터 삭제

ROLLBACK
  ↓
변경 사항 되돌리기
```

### 핵심 주의사항

`UPDATE`와 `DELETE`를 사용할 때는 **WHERE절을 반드시 확인**한다.

```sql
-- 특정 행만 수정
UPDATE EMP
SET SAL = 5000
WHERE EMPNO = 7369;

-- 특정 행만 삭제
DELETE FROM EMP
WHERE EMPNO = 7369;
```

`WHERE`가 없으면 전체 행을 대상으로 작업할 수 있으므로 실행 전에 `SELECT`로 대상 데이터를 먼저 확인하는 습관을 들이는 것이 좋다.
