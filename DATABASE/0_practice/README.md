# SQL Practice

SQL 학습 과정에서 접한 문제를 직접 풀이하고,
문제 해결 과정과 SQL 작성 경험을 기록하는 공간입니다.

단순히 정답만 기록하는 것이 아니라,
문제를 해결하면서 사용한 SQL 문법과 사고 과정을 함께 정리합니다.

---

## 📌 학습 목적

- SQL 문법을 실제 문제에 적용하는 연습
- 문제를 SQL로 해결하기 위한 사고 과정 익히기
- 다양한 조건의 조회 및 데이터 가공 경험 쌓기
- 반복해서 틀리는 문법과 개념 정리
- 문제 풀이 과정을 GitHub에 지속적으로 기록

---

## 📂 폴더 구조

```text
0_practice/
├── solve/                       
|     └── 01_ ...
|     └── 02_ ...
|     └── 03_ ...
└── README.md
```

### 01. 음식 종류별 즐겨찾기수가 가장 많은 식당

### REST_INFO 테이블

| 컬럼명 | 타입 | NULL 허용 | 설명 |
|---|---|---|---|
| `REST_ID` | VARCHAR(5) | ❌ | 식당 ID |
| `REST_NAME` | VARCHAR(50) | ❌ | 식당 이름 |
| `FOOD_TYPE` | VARCHAR(20) | ⭕ | 음식 종류 |
| `VIEWS` | NUMBER | ⭕ | 조회수 |
| `FAVORITES` | NUMBER | ⭕ | 즐겨찾기 수 |
| `PARKING_LOT` | VARCHAR(1) | ⭕ | 주차장 유무 |
| `ADDRESS` | VARCHAR(100) | ⭕ | 주소 |
| `TEL` | VARCHAR(100) | ⭕ | 전화번호 |

## 문제

`REST_INFO` 테이블에서 **음식 종류별로 즐겨찾기 수가 가장 많은 식당**의 음식 종류, ID, 식당 이름, 즐겨찾기 수를 조회합니다.

- 음식 종류별 최대 즐겨찾기 수 조회
- 결과를 음식 종류 기준 내림차순 정렬

### 풀이

[1번 문제 풀이 보기](./solve/01_restaurant_info_max_favorites.sql)

----
----

### 02. 중고 거래 게시물을 3건 이상 등록한 사용자

### USED_GOODS_BOARD 테이블

| 컬럼명 | 타입 | NULL 허용 | 설명 |
|---|---|---|---|
| `BOARD_ID` | VARCHAR(5) | ❌ | 게시글 ID |
| `WRITER_ID` | VARCHAR(50) | ❌ | 작성자 ID |
| `TITLE` | VARCHAR(100) | ❌ | 게시글 제목 |
| `CONTENTS` | VARCHAR(1000) | ❌ | 게시글 내용 |
| `PRICE` | NUMBER | ❌ | 가격 |
| `CREATED_DATE` | DATE | ❌ | 작성일 |
| `STATUS` | VARCHAR(10) | ❌ | 거래상태 |
| `VIEWS` | NUMBER | ❌ | 조회수 |

### USED_GOODS_USER 테이블

| 컬럼명 | 타입 | NULL 허용 | 설명 |
|---|---|---|---|
| `USER_ID` | VARCHAR(50) | ❌ | 회원 ID |
| `NICKNAME` | VARCHAR(100) | ❌ | 닉네임 |
| `CITY` | VARCHAR(100) | ❌ | 시 |
| `STREET_ADDRESS1` | VARCHAR(100) | ❌ | 도로명 주소 |
| `STREET_ADDRESS2` | VARCHAR(100) | ⭕ | 상세 주소 |
| `TLNO` | VARCHAR(20) | ❌ | 전화번호 |

## 문제

`USED_GOODS_BOARD`와 `USED_GOODS_USER` 테이블에서 **중고 거래 게시물을 3건 이상 등록한 사용자**의 사용자 ID, 닉네임, 전체주소, 전화번호를 조회합니다.

- 게시글을 3건 이상 등록한 사용자 조회
- 전체 주소는 시, 도로명 주소, 상세 주소를 포함
- 전화번호는 `xxx-xxxx-xxxx` 형태로 출력
- 회원 ID를 기준으로 내림차순 정렬

### 풀이

[2번 문제 풀이 보기](./solve/02_users_with_3_or_more_posts.sql)