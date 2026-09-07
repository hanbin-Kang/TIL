# Oracle Subquery

## 1. 서브쿼리란?

**서브쿼리(Subquery)**란 SQL문을 실행하는 데 필요한 데이터를 추가로 조회하기 위해 **SQL문 내부에서 사용하는 SELECT문** 이다.

즉, **메인쿼리 안에 들어가는 SELECT문** 을 서브쿼리라고 한다.

```sql
SELECT [조회할 열]
FROM [조회할 테이블]
WHERE [조건식] (
    SELECT [조회할 열]
    FROM [조회할 테이블]
    WHERE [조건식]
);
```

---

## 2. 서브쿼리의 특징

### 1) 괄호로 묶어서 사용

서브쿼리는 일반적으로 **연산자와 같은 비교 또는 조회 대상의 오른쪽** 에 위치하며 괄호로 묶어서 사용한다.

```sql
SELECT *
FROM EMP
WHERE SAL > (
    SELECT AVG(SAL)
    FROM EMP
);
```

---

### 2) 대부분의 서브쿼리에서는 ORDER BY 사용 불가

특수한 몇몇 경우를 제외하면 대부분의 서브쿼리에서는 `ORDER BY`절을 사용할 수 없다.

---

### 3) SELECT절의 열 개수와 자료형이 비교 대상과 호환되어야 함

서브쿼리의 `SELECT`절에 명시한 열은 **메인쿼리의 비교 대상과 자료형 및 개수가 호환** 되어야 한다.

예를 들어 메인쿼리에서 하나의 값과 비교한다면 서브쿼리 역시 하나의 열을 반환해야 한다.

```sql
WHERE SAL > (
    SELECT AVG(SAL)
    FROM EMP
)
```

* 메인쿼리의 비교 대상 → `SAL` 하나
* 서브쿼리의 결과 → `AVG(SAL)` 하나
* 자료형 → 숫자형

---

### 4) 서브쿼리의 결과 행 수와 연산자가 호환되어야 함

서브쿼리가 반환하는 **행의 개수에 따라 사용할 수 있는 연산자가 달라진다.**

* 결과가 1개 → 단일행 서브쿼리
* 결과가 여러 개 → 다중행 서브쿼리

---

# 3. 단일행 서브쿼리

**실행 결과가 단 하나의 행으로 나오는 서브쿼리** 를 단일행 서브쿼리라고 한다.

서브쿼리의 결과가 하나이므로 메인쿼리에서 **단일행 연산자** 를 사용하여 비교한다.

### 단일행 연산자

```text
>
<
=
>=
<=
<>
!=
^=
```

### 예시

평균 급여보다 많은 급여를 받는 사원을 조회한다.

```sql
SELECT *
FROM EMP
WHERE SAL > (
    SELECT AVG(SAL)
    FROM EMP
);
```

서브쿼리의 실행 결과:

```text
2073.21
```

처럼 **하나의 값**만 반환되기 때문에 `>` 연산자를 사용할 수 있다.

### 주의

서브쿼리가 반드시 **하나의 행만 반환한다는 것이 보장되어야 한다.**

같은 데이터가 여러 개 존재할 수 있는 열을 조건으로 사용할 경우 서브쿼리가 여러 행을 반환할 수 있다.

이 경우 단일행 연산자를 사용하면 오류가 발생할 수 있으므로 **다중행 서브쿼리** 를 사용해야 한다.

---

# 4. 다중행 서브쿼리

**실행 결과가 여러 개의 행으로 나오는 서브쿼리** 를 다중행 서브쿼리라고 한다.

다중행 서브쿼리는 단일행 연산자 대신 **다중행 연산자** 를 사용한다.

### 다중행 연산자

| 연산자      | 의미                          |
| -------- | --------------------------- |
| `IN`     | 서브쿼리 결과 중 하나라도 일치하면 참       |
| `ANY`    | 서브쿼리 결과 중 하나 이상이 조건을 만족하면 참 |
| `SOME`   | `ANY`와 동일                   |
| `ALL`    | 서브쿼리 결과 모두가 조건을 만족하면 참      |
| `EXISTS` | 서브쿼리 결과가 하나 이상 존재하면 참       |

---

## IN

메인쿼리의 데이터가 **서브쿼리의 결과 중 하나라도 일치하면** 참이다.

```sql
SELECT *
FROM EMP
WHERE DEPTNO IN (
    SELECT DEPTNO
    FROM DEPT
    WHERE LOC = 'NEW YORK'
);
```

---

## ANY / SOME

서브쿼리의 결과 중 **하나 이상이 조건을 만족하면** 참이다.

```sql
SELECT *
FROM EMP
WHERE SAL > ANY (
    SELECT SAL
    FROM EMP
    WHERE DEPTNO = 30
);
```

`ANY`와 `SOME`은 같은 의미로 사용할 수 있다.

---

## ALL

서브쿼리의 결과를 **모두 만족하면** 참이다.

```sql
SELECT *
FROM EMP
WHERE SAL > ALL (
    SELECT SAL
    FROM EMP
    WHERE DEPTNO = 30
);
```

즉, 위 조건은 `DEPTNO = 30`인 사원들의 급여를 **모두 초과하는 급여** 를 찾는다.

---

## EXISTS

서브쿼리의 결과가 **하나라도 존재하면** 참이다.

```sql
SELECT *
FROM DEPT D
WHERE EXISTS (
    SELECT 1
    FROM EMP E
    WHERE E.DEPTNO = D.DEPTNO
);
```

즉, 해당 부서 번호를 가진 사원이 존재하는 부서만 조회한다.

---

# 5. 다중열 서브쿼리

**비교할 열을 여러 개 지정하는 서브쿼리** 를 다중열 서브쿼리라고 한다.

```sql
SELECT *
FROM EMP
WHERE (DEPTNO, JOB) IN (
    SELECT DEPTNO, JOB
    FROM EMP
    WHERE EMPNO = 7788
);
```

서브쿼리에서 `DEPTNO`, `JOB` 두 개의 값을 반환하므로 메인쿼리에서도 `(DEPTNO, JOB)`처럼 **여러 열을 묶어서 비교** 한다.

즉,

```text
메인쿼리             서브쿼리
(DEPTNO, JOB)   =   (DEPTNO, JOB)
```

처럼 **열의 개수와 자료형이 서로 호환되어야 한다.**

---

# 6. FROM절에 사용하는 서브쿼리

`FROM`절에 사용하는 서브쿼리를 **인라인 뷰(Inline View)** 라고 한다.

특정 테이블의 전체 데이터를 사용하는 것이 아니라, `SELECT`문을 통해 필요한 데이터를 먼저 추출한 후 **하나의 테이블처럼 사용** 한다.

```sql
SELECT *
FROM (
    SELECT DEPTNO, AVG(SAL) AS AVG_SAL
    FROM EMP
    GROUP BY DEPTNO
) V;
```

여기서

```sql
(
    SELECT DEPTNO, AVG(SAL) AS AVG_SAL
    FROM EMP
    GROUP BY DEPTNO
)
```

가 인라인 뷰이다.

인라인 뷰에는 별칭을 지정하여 사용할 수 있다.

```sql
FROM (서브쿼리) V
```

---

# 7. WITH절

`WITH`절을 사용하면 서브쿼리를 **미리 이름을 붙여 정의한 후 메인쿼리에서 사용할 수 있다.**

```sql
WITH DEPT_SAL AS (
    SELECT DEPTNO, AVG(SAL) AS AVG_SAL
    FROM EMP
    GROUP BY DEPTNO
)
SELECT *
FROM DEPT_SAL;
```

복잡한 서브쿼리를 여러 번 사용하는 경우 코드를 읽기 쉽게 만들 수 있다.

---

# 8. SELECT절에 사용하는 서브쿼리

`SELECT`절에 사용하는 서브쿼리를 **스칼라 서브쿼리(Scalar Subquery)** 라고 한다.

스칼라 서브쿼리는 `SELECT`절에서 **하나의 열 영역처럼 결과를 반환** 한다.

조인과 비슷한 역할을 할 수 있다.

```sql
SELECT E.EMPNO,
       E.ENAME,
       E.DEPTNO,
       (
           SELECT D.DNAME
           FROM DEPT D
           WHERE D.DEPTNO = E.DEPTNO
       ) AS DNAME
FROM EMP E;
```

위 쿼리는 `EMP`의 각 사원에 해당하는 부서 이름을 스칼라 서브쿼리로 조회한다.

### 주의

스칼라 서브쿼리는 **반드시 하나의 결과만 반환해야 한다.**

즉, 하나의 행에서 하나의 값을 반환해야 한다.

```text
스칼라 서브쿼리

사원 1 → 부서 이름 1개
사원 2 → 부서 이름 1개
사원 3 → 부서 이름 1개
```

만약 하나의 행에 대해 여러 개의 값이 반환되면 오류가 발생한다.

---

# 9. 서브쿼리 종류 정리

| 종류       | 사용 위치     | 특징                |
| -------- | --------- | ----------------- |
| 단일행 서브쿼리 | `WHERE` 등 | 결과가 1행            |
| 다중행 서브쿼리 | `WHERE` 등 | 결과가 여러 행          |
| 다중열 서브쿼리 | `WHERE` 등 | 여러 열을 비교          |
| 인라인 뷰    | `FROM`    | 서브쿼리 결과를 테이블처럼 사용 |
| 스칼라 서브쿼리 | `SELECT`  | 하나의 값처럼 사용        |
| `WITH`절  | 쿼리 앞부분    | 서브쿼리에 이름을 붙여 재사용  |

---

## 핵심 정리

```text
서브쿼리
└── SQL문 내부에 사용하는 SELECT문

결과 행 수에 따라
├── 단일행 서브쿼리
│   └── =, >, <, >=, <=, != 등
│
└── 다중행 서브쿼리
    ├── IN
    ├── ANY / SOME
    ├── ALL
    └── EXISTS

사용 위치에 따라
├── FROM → 인라인 뷰
├── SELECT → 스칼라 서브쿼리
└── WITH → 이름을 붙인 서브쿼리
```

**핵심은 `서브쿼리가 몇 개의 행과 열을 반환하느냐`를 먼저 확인하고, 그 결과에 맞는 연산자를 사용하는 것이다.**