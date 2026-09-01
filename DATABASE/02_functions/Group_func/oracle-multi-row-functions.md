# Oracle SQL - 다중행 함수와 GROUP BY

## 1. 다중행 함수 (그룹 함수)

**다중행 함수**는 여러 행을 바탕으로 하나의 결과 값을 도출하는 함수이다.

대표적인 다중행 함수:

* `SUM()` : 합계
* `COUNT()` : 개수
* `MAX()` : 최댓값
* `MIN()` : 최솟값
* `AVG()` : 평균

### 사용 시 주의점

다중행 함수를 사용하면서 `GROUP BY`를 사용하지 않는 경우, `SELECT`절에는 **그룹 함수로 처리되지 않는 일반 열을 함께 사용할 수 없다.**

```sql
SELECT ENAME, SUM(SAL)
FROM EMP;
```

위와 같이 작성하면 오류가 발생한다.

`SUM(SAL)`은 여러 행을 하나의 결과로 만들지만, `ENAME`은 여러 행의 값을 그대로 출력하려 하기 때문이다.

---

## 2. SUM()

급여와 같은 숫자 데이터의 **합계**를 구한다.

```sql
SUM([DISTINCT | ALL] 데이터)
```

* `DISTINCT` : 중복을 제거하고 계산
* `ALL` : 모든 데이터를 대상으로 계산
* 생략하면 기본적으로 `ALL`이 적용된다.

```sql
SELECT SUM(SAL)
FROM EMP;
```

---

## 3. COUNT()

데이터의 **개수**를 구한다.

```sql
COUNT([DISTINCT | ALL] 데이터)
```

```sql
SELECT COUNT(*)
FROM EMP;
```

```sql
SELECT COUNT(SAL)
FROM EMP;
```

`COUNT(*)`은 행의 개수를 계산하며, `COUNT(열)`은 해당 열의 `NULL`을 제외하고 개수를 계산한다.

---

## 4. MAX() / MIN()

데이터의 **최댓값과 최솟값**을 구한다.

```sql
MAX([DISTINCT | ALL] 데이터)

MIN([DISTINCT | ALL] 데이터)
```

```sql
SELECT MAX(SAL), MIN(SAL)
FROM EMP;
```

---

## 5. AVG()

숫자 데이터의 **평균값**을 구한다.

```sql
AVG([DISTINCT | ALL] 데이터)
```

```sql
SELECT AVG(SAL)
FROM EMP;
```

---

# 6. GROUP BY절

`GROUP BY`절은 데이터를 특정 열을 기준으로 **그룹화하여 그룹별 집계 결과를 출력**할 때 사용한다.

예를 들어 부서별 평균 급여를 구할 수 있다.

```sql
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO;
```

### GROUP BY 기본 형식

```sql
SELECT [조회할 열]
FROM [조회할 테이블]
WHERE [행을 선별하는 조건식]
GROUP BY [그룹화할 열]
ORDER BY [정렬할 열];
```

`GROUP BY`에는 여러 개의 열을 지정할 수 있다.

```sql
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB;
```

위 SQL은 `DEPTNO`와 `JOB`의 조합이 같은 행끼리 그룹화한다.

---

## 7. GROUP BY 사용 시 유의점

`GROUP BY`를 사용할 때 `SELECT`절에 작성하는 **일반 열은 반드시 `GROUP BY`에 포함되어 있어야 한다.**

```sql
SELECT DEPTNO, ENAME, AVG(SAL)
FROM EMP
GROUP BY DEPTNO;
```

위 SQL은 오류가 발생한다.

* `DEPTNO` → `GROUP BY`에 포함되어 있음 → 가능
* `AVG(SAL)` → 그룹 함수 → 가능
* `ENAME` → `GROUP BY`에 없고 그룹 함수도 아님 → 오류

즉,

> **SELECT절의 일반 열 → GROUP BY에 포함**
>
> **SELECT절의 그룹 함수 → GROUP BY에 포함할 필요 없음**

반대로 `GROUP BY`에 지정한 열이 반드시 `SELECT`에 있어야 하는 것은 아니다.

```sql
SELECT AVG(SAL)
FROM EMP
GROUP BY DEPTNO;
```

위 SQL도 정상적으로 실행된다.

---

# 8. HAVING절

`HAVING`절은 **GROUP BY로 그룹화한 결과에 조건을 지정**할 때 사용한다.

```sql
SELECT [조회할 열]
FROM [조회할 테이블]
WHERE [행을 선별하는 조건식]
GROUP BY [그룹화할 열]
HAVING [그룹을 제한하는 조건식]
ORDER BY [정렬할 열];
```

예를 들어:

```sql
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) >= 2000;
```

→ 부서별로 그룹화한 후 **평균 급여가 2000 이상인 부서 그룹만 출력**한다.

### HAVING과 WHERE의 차이

둘 다 조건을 지정하지만 **조건을 적용하는 대상이 다르다.**

* `WHERE` → 개별 **행**에 조건을 적용
* `HAVING` → 그룹화된 **그룹**에 조건을 적용

예:

```sql
SELECT DEPTNO, AVG(SAL)
FROM EMP
WHERE SAL <= 3000
GROUP BY DEPTNO
HAVING AVG(SAL) >= 2000;
```

처리 흐름:

```text
FROM
 ↓
WHERE       ← 개별 행을 먼저 필터링
 ↓
GROUP BY    ← 남은 행을 그룹화
 ↓
HAVING      ← 그룹에 조건 적용
 ↓
SELECT      ← 최종 결과를 조회
 ↓
ORDER BY    ← 결과를 정렬
```

쉽게 정리하면:

> **WHERE는 행에 조건을 걸고, HAVING은 그룹에 조건을 건다.**

---

# 9. GROUP BY 관련 추가 기능

GROUP BY를 확장하여 다양한 형태의 집계 결과를 만들 수 있다.

### ROLLUP

`GROUP BY`에서 사용하는 그룹화 기능

### CUBE

`GROUP BY`에서 사용하는 그룹화 기능

### GROUPING SETS

여러 그룹화 기준을 지정하여 집계하는 기능

### GROUPING_ID()

그룹화된 결과가 어떤 그룹인지 구분할 때 사용하는 함수

### LISTAGG()

여러 행의 문자열 데이터를 하나의 문자열로 합치는 함수

### PIVOT

행 데이터를 열 형태로 변환하여 집계하는 구문

### UNPIVOT

열 데이터를 행 형태로 변환하는 구문

> ※ `ROLLUP`, `CUBE`, `GROUPING SETS`, `PIVOT`, `UNPIVOT`은 일반적인 의미의 함수라기보다 **GROUP BY 또는 SELECT에서 사용하는 SQL 기능/구문**이다.
