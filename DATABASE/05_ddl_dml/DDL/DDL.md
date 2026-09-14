# 데이터 정의어(DDL)

## 1. DDL이란?

**DDL(Data Definition Language)**은 데이터베이스에서 데이터를 보관하고 관리하기 위해 필요한 **데이터베이스 객체의 생성, 변경, 삭제**를 담당하는 SQL 명령어이다.

대표적인 DDL 명령어는 다음과 같다.

1. `CREATE` : 객체 생성
2. `ALTER` : 객체 변경
3. `DROP` : 객체 삭제

추가로 테이블의 데이터를 전체 삭제하는 `TRUNCATE`도 DDL 명령어에 해당한다.

---

## 2. DDL 사용 시 주의사항

DML은 일반적으로 `COMMIT`을 실행해야 변경 사항을 영구적으로 반영할 수 있지만, **Oracle에서 DDL을 실행하면 자동으로 COMMIT이 발생한다.**

따라서 DDL을 실행하면 다음과 같은 특징이 있다.

* DDL 실행 전의 DML 작업이 자동으로 `COMMIT`된다.
* DDL 작업 자체도 즉시 데이터베이스에 반영된다.
* DDL 실행 후에는 이전 DML 작업을 `ROLLBACK`으로 되돌릴 수 없다.

> **DDL 실행 → 암묵적 COMMIT 발생**

따라서 DDL을 사용할 때는 기존 데이터의 변경 여부를 확인한 후 신중하게 실행해야 한다.

---

# 3. CREATE

`CREATE`는 **데이터베이스 객체를 생성**할 때 사용한다.

### 테이블 생성 기본 형식

```sql
CREATE TABLE 소유계정.테이블이름 (
    열1이름 열1자료형,
    열2이름 열2자료형,
    ...
    열N이름 열N자료형
);
```

소유 계정 이름은 현재 접속한 계정의 테이블을 생성하는 경우 생략할 수 있다.

```sql
CREATE TABLE EMP_TEST (
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    SAL NUMBER(7,2)
);
```

### 테이블 생성 방법

테이블은 크게 다음과 같은 방법으로 생성할 수 있다.

1. 자료형을 직접 정의하여 새 테이블 생성
2. 기존 테이블의 **열 구조와 데이터**를 복사하여 새 테이블 생성
3. 기존 테이블의 **열 구조와 일부 데이터**를 복사하여 새 테이블 생성
4. 기존 테이블의 **열 구조만** 복사하여 새 테이블 생성

예를 들어 기존 테이블의 구조와 데이터를 복사할 수 있다.

```sql
CREATE TABLE EMP_COPY
AS
SELECT *
FROM EMP;
```

기존 테이블의 구조만 복사하려면 조건을 항상 거짓이 되도록 작성한다.

```sql
CREATE TABLE EMP_COPY
AS
SELECT *
FROM EMP
WHERE 1 <> 1;
```

---

# 4. ALTER

`ALTER`는 **기존 테이블의 구조를 변경**할 때 사용한다.

## 4-1. 열 추가 — ADD

`ADD`를 사용하면 기존 테이블에 새로운 열을 추가할 수 있다.

```sql
ALTER TABLE 테이블이름
ADD 열이름 자료형;
```

예시:

```sql
ALTER TABLE EMP
ADD EMAIL VARCHAR2(50);
```

---

## 4-2. 열 이름 변경 — RENAME COLUMN

`RENAME COLUMN`을 사용하면 기존 열의 이름을 변경할 수 있다.

```sql
ALTER TABLE 테이블이름
RENAME COLUMN 기존열이름 TO 변경할열이름;
```

예시:

```sql
ALTER TABLE EMP
RENAME COLUMN EMAIL TO EMAIL_ADDR;
```

---

## 4-3. 열의 자료형 변경 — MODIFY

`MODIFY`를 사용하면 기존 열의 자료형이나 크기 등을 변경할 수 있다.

```sql
ALTER TABLE 테이블이름
MODIFY 열이름 변경할자료형;
```

예시:

```sql
ALTER TABLE EMP
MODIFY ENAME VARCHAR2(20);
```

> 기존 데이터가 변경하려는 자료형과 맞지 않으면 `MODIFY`가 실패할 수 있다.

---

## 4-4. 열 삭제 — DROP COLUMN

`DROP COLUMN`을 사용하면 테이블에서 특정 열을 삭제할 수 있다.

```sql
ALTER TABLE 테이블이름
DROP COLUMN 열이름;
```

예시:

```sql
ALTER TABLE EMP
DROP COLUMN EMAIL_ADDR;
```

열을 삭제하면 **해당 열에 저장되어 있던 데이터도 함께 삭제**되므로 신중하게 사용해야 한다.

---

# 5. 테이블 이름 변경 — RENAME

`RENAME`은 기존 테이블의 이름을 변경할 때 사용한다.

```sql
RENAME 기존테이블이름 TO 변경할테이블이름;
```

예시:

```sql
RENAME EMP_COPY TO EMP_BACKUP;
```

`RENAME`은 테이블의 구조나 데이터를 변경하는 것이 아니라 **테이블의 이름만 변경**한다.

---

# 6. TRUNCATE

`TRUNCATE`는 특정 테이블의 **모든 데이터를 삭제**할 때 사용한다.

```sql
TRUNCATE TABLE 테이블이름;
```

예시:

```sql
TRUNCATE TABLE EMP_TEST;
```

특징:

* 테이블의 **모든 행 삭제**
* 테이블의 구조는 유지
* `DELETE`와 달리 일반적인 `ROLLBACK`으로 되돌릴 수 없음
* DDL이므로 실행 시 암묵적 `COMMIT`이 발생

즉,

```text
TRUNCATE
   ↓
테이블 구조 유지
   ↓
테이블 내부의 모든 데이터 삭제
```

---

# 7. DROP

`DROP`은 데이터베이스 객체 자체를 **삭제**할 때 사용한다.

### 테이블 삭제

```sql
DROP TABLE 테이블이름;
```

예시:

```sql
DROP TABLE EMP_TEST;
```

`DROP TABLE`을 실행하면 **테이블의 구조와 데이터가 모두 삭제**된다.

```text
DROP TABLE
   ↓
테이블 데이터 삭제
   +
테이블 구조 삭제
   ↓
테이블 자체가 없어짐
```

---

# 8. CREATE / ALTER / TRUNCATE / DROP 비교

| 명령어        | 대상  | 주요 기능            |
| ---------- | --- | ---------------- |
| `CREATE`   | 객체  | 객체 생성            |
| `ALTER`    | 객체  | 객체 구조 변경         |
| `RENAME`   | 객체  | 객체 이름 변경         |
| `TRUNCATE` | 테이블 | 모든 데이터 삭제, 구조 유지 |
| `DROP`     | 객체  | 객체 자체 삭제         |

### 핵심 구분

```text
CREATE
→ 새로 만든다

ALTER
→ 구조를 바꾼다

RENAME
→ 이름을 바꾼다

TRUNCATE
→ 데이터만 전부 비운다

DROP
→ 객체 자체를 없앤다
```

---

## 9. 핵심 정리

**DDL = 데이터베이스 객체의 구조를 정의하고 관리하는 명령어**

```text
CREATE → 생성
ALTER  → 변경
DROP   → 삭제
```

테이블을 기준으로 보면:

```text
CREATE TABLE
    ↓
테이블 생성

ALTER TABLE
    ↓
열 추가 / 열 이름 변경 / 자료형 변경 / 열 삭제

RENAME
    ↓
테이블 이름 변경

TRUNCATE TABLE
    ↓
데이터 전체 삭제
(테이블 구조 유지)

DROP TABLE
    ↓
테이블 자체 삭제
(구조 + 데이터 삭제)
```

**가장 중요한 점:**
Oracle에서 DDL은 실행 시 **암묵적 COMMIT**이 발생하므로 `ROLLBACK`을 기대하고 실행하면 안 된다.
