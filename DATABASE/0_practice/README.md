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

---
---

### [01. 음식 종류별 즐겨찾기수가 가장 많은 식당]

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

### [02. 중고 거래 게시물을 3건 이상 등록한 사용자]

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

----
----

### [03. 완료된 중고 거래 총금액이 70만 원 이상인 사용자]

### USED_GOODS_BOARD 테이블

| 컬럼명            | 타입            | NULL 허용 | 설명     |
| -------------- | ------------- | ------- | ------ |
| `BOARD_ID`     | VARCHAR(5)    | ❌       | 게시글 ID |
| `WRITER_ID`    | VARCHAR(50)   | ❌       | 작성자 ID |
| `TITLE`        | VARCHAR(100)  | ❌       | 게시글 제목 |
| `CONTENTS`     | VARCHAR(1000) | ❌       | 게시글 내용 |
| `PRICE`        | NUMBER        | ❌       | 가격     |
| `CREATED_DATE` | DATE          | ❌       | 작성일    |
| `STATUS`       | VARCHAR(10)   | ❌       | 거래상태   |
| `VIEWS`        | NUMBER        | ❌       | 조회수    |

### USED_GOODS_USER 테이블

| 컬럼명               | 타입           | NULL 허용 | 설명     |
| ----------------- | ------------ | ------- | ------ |
| `USER_ID`         | VARCHAR(50)  | ❌       | 회원 ID  |
| `NICKNAME`        | VARCHAR(100) | ❌       | 닉네임    |
| `CITY`            | VARCHAR(100) | ❌       | 시      |
| `STREET_ADDRESS1` | VARCHAR(100) | ❌       | 도로명 주소 |
| `STREET_ADDRESS2` | VARCHAR(100) | ⭕       | 상세 주소  |
| `TLNO`            | VARCHAR(20)  | ❌       | 전화번호   |

## 문제

`USED_GOODS_BOARD`와 `USED_GOODS_USER` 테이블에서 **완료된 중고 거래의 총금액이 70만 원 이상인 사용자**의 사용자 ID, 닉네임, 총거래금액을 조회합니다.

* 거래 상태가 `DONE`인 게시글만 조회
* 사용자별 완료된 거래금액을 합산
* 총거래금액이 70만 원 이상인 사용자 조회
* 총거래금액을 기준으로 오름차순 정렬

### 풀이

[3번 문제 풀이 보기](./solve/03_users_with_700k_or_more_total_sales.sql)

----
----

### [04. 2022년 1월 카테고리별 도서 판매량]

### BOOK 테이블

| 컬럼명              | 타입         | NULL 허용 | 설명    |
| ---------------- | ---------- | ------- | ----- |
| `BOOK_ID`        | INTEGER    | ❌       | 도서 ID |
| `CATEGORY`       | VARCHAR(N) | ❌       | 카테고리  |
| `AUTHOR_ID`      | INTEGER    | ❌       | 저자 ID |
| `PRICE`          | INTEGER    | ❌       | 판매가   |
| `PUBLISHED_DATE` | DATE       | ❌       | 출판일   |

### BOOK_SALES 테이블

| 컬럼명          | 타입      | NULL 허용 | 설명    |
| ------------ | ------- | ------- | ----- |
| `BOOK_ID`    | INTEGER | ❌       | 도서 ID |
| `SALES_DATE` | DATE    | ❌       | 판매일   |
| `SALES`      | INTEGER | ❌       | 판매량   |

## 문제

`BOOK`과 `BOOK_SALES` 테이블에서 **2022년 1월의 카테고리별 도서 판매량을 합산**하여 카테고리와 총 판매량을 조회합니다.

* `BOOK`과 `BOOK_SALES`를 `BOOK_ID` 기준으로 JOIN
* 2022년 1월에 판매된 도서만 조회
* 카테고리별 판매량 합산
* 카테고리명을 기준으로 오름차순 정렬

### 풀이

[4번 문제 풀이 보기](./solve/04_category_sales_in_january_2022.sql)

---
---

### [05. 2022년 5월 1일 기준 출고여부 조회]

### FOOD_ORDER 테이블

| 컬럼명            | 타입          | NULL 허용 | 설명    |
| -------------- | ----------- | ------- | ----- |
| `ORDER_ID`     | VARCHAR(10) | ❌       | 주문 ID |
| `PRODUCT_ID`   | VARCHAR(5)  | ❌       | 제품 ID |
| `AMOUNT`       | NUMBER      | ❌       | 주문량   |
| `PRODUCE_DATE` | DATE        | ⭕       | 생산일자  |
| `IN_DATE`      | DATE        | ⭕       | 입고일자  |
| `OUT_DATE`     | DATE        | ⭕       | 출고일자  |
| `FACTORY_ID`   | VARCHAR(10) | ❌       | 공장 ID |
| `WAREHOUSE_ID` | VARCHAR(10) | ❌       | 창고 ID |

## 문제

`FOOD_ORDER` 테이블에서 **2022년 5월 1일을 기준으로 주문 ID, 제품 ID, 출고일자, 출고여부**를 조회합니다.

* 2022년 5월 1일까지 출고된 경우 `출고완료`
* 2022년 5월 1일 이후 출고 예정인 경우 `출고대기`
* 출고일자가 `NULL`인 경우 `출고미정`
* 출고일자는 `YYYY-MM-DD` 형태로 출력
* 주문 ID를 기준으로 오름차순 정렬

### 풀이

[5번 문제 풀이 보기](./solve/05_food_order_shipping_status.sql)

---
---

### [06. 조회수가 가장 높은 게시물의 첨부파일 경로 조회]

### USED_GOODS_BOARD 테이블

| 컬럼명            | 타입            | NULL 허용 | 설명     |
| -------------- | ------------- | ------- | ------ |
| `BOARD_ID`     | VARCHAR(5)    | ❌       | 게시글 ID |
| `WRITER_ID`    | VARCHAR(50)   | ❌       | 작성자 ID |
| `TITLE`        | VARCHAR(100)  | ❌       | 게시글 제목 |
| `CONTENTS`     | VARCHAR(1000) | ❌       | 게시글 내용 |
| `PRICE`        | NUMBER        | ❌       | 가격     |
| `CREATED_DATE` | DATE          | ❌       | 작성일    |
| `STATUS`       | VARCHAR(10)   | ❌       | 거래상태   |
| `VIEWS`        | NUMBER        | ❌       | 조회수    |

### USED_GOODS_FILE 테이블

| 컬럼명         | 타입           | NULL 허용 | 설명     |
| ----------- | ------------ | ------- | ------ |
| `FILE_ID`   | VARCHAR(10)  | ❌       | 파일 ID  |
| `FILE_EXT`  | VARCHAR(5)   | ❌       | 파일 확장자 |
| `FILE_NAME` | VARCHAR(256) | ❌       | 파일 이름  |
| `BOARD_ID`  | VARCHAR(10)  | ❌       | 게시글 ID |

## 문제

`USED_GOODS_BOARD`와 `USED_GOODS_FILE` 테이블에서 **조회수가 가장 높은 중고거래 게시물의 첨부파일 경로**를 조회합니다.

* 조회수가 가장 높은 게시물 1개 조회
* `BOARD_ID`를 기준으로 게시글과 첨부파일 정보를 JOIN
* 기본 파일 경로는 `/home/grep/src/`
* 게시글 ID를 디렉토리로 사용
* 파일 경로는 `FILE_ID + FILE_NAME + FILE_EXT` 형태로 구성
* `FILE_ID`를 기준으로 내림차순 정렬

### 풀이

[6번 문제 풀이 보기](./solve/06_used_goods_file_path.sql)

---
---

### [07. 입양을 간 기록은 있지만 보호소에 들어온 기록이 없는 동물]
### ANIMAL_INS 테이블

| 컬럼명                | 타입         | NULL 허용 | 설명          |
| ------------------ | ---------- | ------- | ----------- |
| `ANIMAL_ID`        | VARCHAR(N) | ❌       | 동물 ID       |
| `ANIMAL_TYPE`      | VARCHAR(N) | ❌       | 생물 종        |
| `DATETIME`         | DATETIME   | ❌       | 보호 시작일      |
| `INTAKE_CONDITION` | VARCHAR(N) | ❌       | 보호 시작 시 상태  |
| `NAME`             | VARCHAR(N) | ⭕       | 이름          |
| `SEX_UPON_INTAKE`  | VARCHAR(N) | ❌       | 성별 및 중성화 여부 |

### ANIMAL_OUTS 테이블

| 컬럼명                | 타입         | NULL 허용 | 설명          |
| ------------------ | ---------- | ------- | ----------- |
| `ANIMAL_ID`        | VARCHAR(N) | ❌       | 동물 ID       |
| `ANIMAL_TYPE`      | VARCHAR(N) | ❌       | 생물 종        |
| `DATETIME`         | DATETIME   | ❌       | 입양일         |
| `NAME`             | VARCHAR(N) | ⭕       | 이름          |
| `SEX_UPON_OUTCOME` | VARCHAR(N) | ❌       | 성별 및 중성화 여부 |

## 문제

`ANIMAL_OUTS` 테이블에서 **입양을 간 기록은 있지만 보호소에 들어온 기록이 없는 동물**의 ID와 이름을 조회합니다.

* `ANIMAL_OUTS`에는 존재하지만 `ANIMAL_INS`에는 존재하지 않는 동물 조회
* 동물의 ID를 기준으로 오름차순 정렬

### 풀이

[7번 문제 풀이 보기](./solve/07_animals_without_intake_records.sql)

---
---

### [08. 보호소 입소 후 중성화된 동물 조회]

### ANIMAL_INS 테이블

| 컬럼명                | 타입         | NULL 허용 | 설명          |
| ------------------ | ---------- | ------- | ----------- |
| `ANIMAL_ID`        | VARCHAR(N) | ❌       | 동물 ID       |
| `ANIMAL_TYPE`      | VARCHAR(N) | ❌       | 생물 종        |
| `DATETIME`         | DATETIME   | ❌       | 보호 시작일      |
| `INTAKE_CONDITION` | VARCHAR(N) | ❌       | 보호 시작 시 상태  |
| `NAME`             | VARCHAR(N) | ⭕       | 이름          |
| `SEX_UPON_INTAKE`  | VARCHAR(N) | ❌       | 성별 및 중성화 여부 |

### ANIMAL_OUTS 테이블

| 컬럼명                | 타입         | NULL 허용 | 설명          |
| ------------------ | ---------- | ------- | ----------- |
| `ANIMAL_ID`        | VARCHAR(N) | ❌       | 동물 ID       |
| `ANIMAL_TYPE`      | VARCHAR(N) | ❌       | 생물 종        |
| `DATETIME`         | DATETIME   | ❌       | 입양일         |
| `NAME`             | VARCHAR(N) | ⭕       | 이름          |
| `SEX_UPON_OUTCOME` | VARCHAR(N) | ❌       | 성별 및 중성화 여부 |

## 문제

`ANIMAL_INS`와 `ANIMAL_OUTS` 테이블에서 **보호소에 들어올 당시에는 중성화되지 않았지만, 보호소를 나갈 당시에는 중성화된 동물**의 ID, 생물 종, 이름을 조회합니다.

* `ANIMAL_INS`와 `ANIMAL_OUTS`를 `ANIMAL_ID` 기준으로 JOIN
* 입소 당시 `Intact`인 동물 조회
* 입양 당시 `Spayed` 또는 `Neutered`인 동물 조회
* 동물 ID를 기준으로 오름차순 정렬

### 풀이

[8번 문제 풀이 보기](./solve/08_animals_neutered_after_intake.sql)

---
---

### [09. 식품분류별 가격이 가장 비싼 식품 조회]

### FOOD_PRODUCT 테이블

| 컬럼명            | 타입         | NULL 허용 | 설명    |
| -------------- | ---------- | ------- | ----- |
| `PRODUCT_ID`   | VARCHAR(N) | ❌       | 식품 ID |
| `PRODUCT_NAME` | VARCHAR(N) | ❌       | 식품 이름 |
| `PRODUCT_CD`   | VARCHAR(N) | ❌       | 식품 코드 |
| `CATEGORY`     | VARCHAR(N) | ❌       | 식품 분류 |
| `PRICE`        | NUMBER     | ❌       | 식품 가격 |

## 문제

`FOOD_PRODUCT` 테이블에서 **식품분류별로 가격이 가장 비싼 식품**의 분류, 가격, 이름을 조회합니다.

* 식품분류가 `과자`, `국`, `김치`, `식용유`인 경우만 조회
* 각 식품분류별 최고 가격 조회
* 식품 가격을 기준으로 내림차순 정렬

### 풀이

[9번 문제 풀이 보기](./solve/09_category_max_price_food.sql)
