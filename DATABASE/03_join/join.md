# Oracle SQL JOIN

## 1. JOIN이란?

여러 테이블을 **하나의 테이블처럼 사용**하기 위해 데이터를 연결하는 방법이다.

### 집합 연산자와 JOIN의 차이

* **집합 연산자**: 두 개 이상의 `SELECT` 결과를 **세로로 연결**
* **JOIN**: 두 개 이상의 테이블 데이터를 **가로로 연결**

```text
집합 연산자
SELECT 결과
    ↓
    ↓
    ↓
SELECT 결과
    ↓
세로로 연결

JOIN
테이블 A ───── 테이블 B
       ↓
   가로로 연결
```

---

# 2. JOIN의 종류

## 2-1. 등가 조인 (Equi Join)

두 테이블에서 **같은 값을 기준으로 연결**하는 조인이다.

예를 들어 `EMP` 테이블의 `DEPTNO`와 `DEPT` 테이블의 `DEPTNO`를 연결할 수 있다.

```sql
SELECT E.EMPNO, E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
```

### 특징

* 두 테이블의 특정 컬럼 값이 같은 경우 연결
* 가장 기본적인 JOIN
* 내부 조인(Inner Join), 단순 조인이라고도 함

### 테이블 3개를 조인하는 경우

A와 B를 먼저 연결한 후 C를 연결한다.

```text
A ─── B
     │
     └── C
```

`WHERE`절을 사용하여 조인할 때는 **각 테이블을 정확하게 연결하는 조건식이 필요하다.**

일반적으로 테이블이 `N`개라면 최소 `N - 1`개의 조인 조건이 필요하다.

예:

```sql
WHERE A.ID = B.ID
AND B.ID = C.ID;
```

---

# 2-2. 비등가 조인 (Non-Equi Join)

두 테이블의 값이 **정확하게 같지 않아도** 범위나 대소관계 등을 이용하여 연결하는 조인이다.

대표적으로 `BETWEEN`, `<`, `>`, `<=`, `>=` 등을 사용할 수 있다.

예를 들어 `EMP`의 급여와 `SALGRADE`의 급여 범위를 비교할 수 있다.

```sql
SELECT *
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;
```

```text
SALGRADE
LOSAL ───────── HISAL
        ↑
        │
      EMP.SAL
```

---

# 2-3. 자체 조인 (Self Join)

**하나의 테이블을 두 개 이상의 테이블처럼 사용하여 조인**하는 방식이다.

같은 테이블에 서로 다른 별칭을 지정하여 각각 다른 역할을 부여한다.

예를 들어 `EMP` 테이블에서 한쪽은 사원, 다른 한쪽은 매니저 역할을 하도록 할 수 있다.

```sql
SELECT E1.EMPNO,
       E1.ENAME,
       E1.MGR,
       E2.EMPNO AS "MGR_EMPNO",
       E2.ENAME AS "MGR_ENAME"
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;
```

### 역할

```text
E1 = 사원 역할
E2 = 매니저 역할

E1.MGR
→ 해당 사원의 매니저 사원번호

E2.EMPNO
→ 매니저의 사원번호
```

예를 들어:

```text
E1
EMPNO   ENAME   MGR
7369    SMITH   7902
```

`E1.MGR`이 `7902`이므로 `EMP`에서 `EMPNO = 7902`인 사원을 찾는다.

```text
E2
EMPNO   ENAME
7902    FORD
```

따라서:

```text
SMITH → FORD
```

처럼 사원과 직속상관을 연결할 수 있다.

---

# 2-4. 외부 조인 (Outer Join)

일반적인 내부 조인은 양쪽 테이블에 **매칭되는 데이터만 출력**한다.

외부 조인은 한쪽 테이블에 매칭되는 데이터가 없어도 **기준이 되는 테이블의 데이터를 출력**한다.

매칭되는 데이터가 없는 경우 반대쪽 컬럼에는 `NULL`이 들어간다.

---

## Oracle 외부 조인 `(+)`

### 왼쪽 외부 조인

```sql
WHERE TABLE1.COL1 = TABLE2.COL1(+)
```

→ `TABLE1`의 데이터를 모두 살린다.

예:

```sql
WHERE E1.MGR = E2.EMPNO(+)
```

의미:

> E1의 `MGR`과 E2의 `EMPNO`가 같으면 연결하고,
> E2가 없어도 E1은 출력한다.

### 오른쪽 외부 조인

```sql
WHERE TABLE1.COL1(+) = TABLE2.COL1
```

→ `TABLE2`의 데이터를 모두 살린다.

---

# 2-5. NATURAL JOIN

두 테이블에서 **이름이 같은 컬럼을 자동으로 찾아 등가 조인**하는 방식이다.

```sql
SELECT E.EMPNO,
       E.ENAME,
       E.JOB,
       E.MGR,
       E.HIREDATE,
       E.SAL,
       E.COMM,
       DEPTNO,
       D.DNAME,
       D.LOC
FROM EMP E
NATURAL JOIN DEPT D
ORDER BY DEPTNO, E.EMPNO;
```

`EMP`와 `DEPT`에 모두 `DEPTNO`가 존재하므로 `DEPTNO`를 기준으로 자동 조인한다.

### 특징

* 이름이 같은 컬럼을 자동으로 조인 조건으로 사용
* 조인 기준 컬럼은 `SELECT`절에서 테이블 별칭을 붙이지 않고 작성

```sql
SELECT DEPTNO
```

---

# 2-6. JOIN ~ USING

사용자가 **조인에 사용할 동일한 이름의 컬럼을 직접 지정**하는 방식이다.

```sql
FROM TABLE1
JOIN TABLE2
USING (조인 기준 컬럼)
```

예:

```sql
SELECT E.EMPNO,
       E.ENAME,
       E.SAL,
       DEPTNO,
       D.DNAME,
       D.LOC
FROM EMP E
JOIN DEPT D
USING (DEPTNO);
```

### NATURAL JOIN과 USING의 차이

```text
NATURAL JOIN
→ DB가 이름이 같은 컬럼을 자동으로 찾아서 조인

JOIN ~ USING
→ 사용자가 조인에 사용할 컬럼을 직접 지정
```

`USING`을 사용하려면 조인에 사용하는 컬럼의 **이름이 같아야 한다.**

---

# 2-7. JOIN ~ ON

조인 조건을 **직접 작성하는 가장 일반적인 JOIN 방식**이다.

```sql
FROM TABLE1
JOIN TABLE2
ON (조인 조건식)
```

예:

```sql
SELECT E.EMPNO,
       E.ENAME,
       E.SAL,
       E.DEPTNO,
       D.DNAME,
       D.LOC
FROM EMP E
JOIN DEPT D
ON (E.DEPTNO = D.DEPTNO);
```

### 특징

`ON`은 조인 조건을 직접 작성하기 때문에 컬럼 이름이 서로 달라도 조인할 수 있다.

```text
TABLE1
USER_ID

TABLE2
EMPLOYEE_ID
```

두 컬럼의 이름은 다르지만 서로 연결되는 값이라면 `ON`을 이용하여 조건을 직접 지정할 수 있다.

```sql
ON TABLE1.USER_ID = TABLE2.EMPLOYEE_ID
```

---

# 3. OUTER JOIN

## LEFT OUTER JOIN

**왼쪽 테이블을 전부 출력**한다.

```sql
FROM TABLE1
LEFT OUTER JOIN TABLE2
ON (조인 조건식)
```

Oracle의 기존 문법:

```sql
WHERE TABLE1.COL1 = TABLE2.COL1(+)
```

### 예제

두 테이블의 `ID`가 같은 경우 연결한다고 가정한다.

### A 테이블

| ID | NAME |
| -: | ---- |
|  1 | 철수   |
|  2 | 영희   |
|  3 | 민수   |

### B 테이블

| ID | JOB  |
| -: | ---- |
|  2 | 개발자  |
|  3 | 디자이너 |
|  4 | 기획자  |

```text
A                  B

1 철수

2 영희  ─────────  2 개발자

3 민수  ─────────  3 디자이너

                  4 기획자
```

```sql
SELECT *
FROM A
LEFT OUTER JOIN B
ON A.ID = B.ID;
```

결과:

| A.ID | NAME | B.ID | JOB  |
| ---: | ---- | ---: | ---- |
|    1 | 철수   | NULL | NULL |
|    2 | 영희   |    2 | 개발자  |
|    3 | 민수   |    3 | 디자이너 |

```text
LEFT
→ 왼쪽 A는 전부 출력
→ 오른쪽 B에 데이터가 없으면 NULL
```

철수는 B에 없지만 **A가 왼쪽 테이블이기 때문에 출력된다.**

---

# 4. RIGHT OUTER JOIN

**오른쪽 테이블을 전부 출력**한다.

```sql
FROM TABLE1
RIGHT OUTER JOIN TABLE2
ON (조인 조건식)
```

Oracle의 기존 문법:

```sql
WHERE TABLE1.COL1(+) = TABLE2.COL1
```

```sql
SELECT *
FROM A
RIGHT OUTER JOIN B
ON A.ID = B.ID;
```

결과:

| A.ID | NAME | B.ID | JOB  |
| ---: | ---- | ---: | ---- |
|    2 | 영희   |    2 | 개발자  |
|    3 | 민수   |    3 | 디자이너 |
| NULL | NULL |    4 | 기획자  |

```text
RIGHT
→ 오른쪽 B는 전부 출력
→ 왼쪽 A에 데이터가 없으면 NULL
```

기획자는 A에 없지만 **B가 오른쪽 테이블이기 때문에 출력된다.**

---

# 5. FULL OUTER JOIN

**양쪽 테이블의 데이터를 전부 출력**한다.

```sql
FROM TABLE1
FULL OUTER JOIN TABLE2
ON (조인 조건식)
```

```sql
SELECT *
FROM A
FULL OUTER JOIN B
ON A.ID = B.ID;
```

결과:

| A.ID | NAME | B.ID | JOB  |
| ---: | ---- | ---: | ---- |
|    1 | 철수   | NULL | NULL |
|    2 | 영희   |    2 | 개발자  |
|    3 | 민수   |    3 | 디자이너 |
| NULL | NULL |    4 | 기획자  |

```text
FULL
→ 왼쪽 A 전부 출력
→ 오른쪽 B 전부 출력
→ 한쪽에만 데이터가 있으면 반대쪽은 NULL
```

Oracle의 기존 `(+)` 문법에는 **FULL OUTER JOIN에 해당하는 직접적인 문법이 없다.**

---

# 6. LEFT / RIGHT / FULL 핵심

```text
LEFT
→ 왼쪽 테이블 전부

RIGHT
→ 오른쪽 테이블 전부

FULL
→ 양쪽 테이블 전부
```

쉽게 기억하면:

```text
LEFT JOIN

왼쪽을 살린다.


RIGHT JOIN

오른쪽을 살린다.


FULL JOIN

양쪽을 모두 살린다.
```

---

# 7. JOIN 문법 비교

| JOIN             | 특징                     |
| ---------------- | ---------------------- |
| INNER JOIN       | 양쪽에서 매칭되는 데이터만 출력      |
| NON-EQUI JOIN    | 범위, 대소관계 등을 이용하여 연결    |
| SELF JOIN        | 하나의 테이블을 여러 역할로 나누어 조인 |
| NATURAL JOIN     | 이름이 같은 컬럼을 자동으로 조인     |
| JOIN ~ USING     | 같은 이름의 조인 컬럼을 직접 지정    |
| JOIN ~ ON        | 조인 조건을 직접 지정           |
| LEFT OUTER JOIN  | 왼쪽 테이블을 모두 출력          |
| RIGHT OUTER JOIN | 오른쪽 테이블을 모두 출력         |
| FULL OUTER JOIN  | 양쪽 테이블을 모두 출력          |

## 핵심 정리

```text
INNER JOIN
→ 매칭되는 것만

LEFT JOIN
→ 왼쪽 전부 + 오른쪽 매칭

RIGHT JOIN
→ 오른쪽 전부 + 왼쪽 매칭

FULL JOIN
→ 양쪽 전부
```

그리고 실무적으로 가장 기본이 되는 형태는:

```sql
FROM TABLE1
JOIN TABLE2
ON TABLE1.COL = TABLE2.COL
```

즉, **`JOIN ... ON`을 중심으로 익히고 `LEFT JOIN`까지 확실하게 이해하는 것이 중요하다.**
