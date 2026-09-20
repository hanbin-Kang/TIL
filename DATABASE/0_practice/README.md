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

---
---

### [10. 2022년 5월 생산 식품의 총매출 조회]

### FOOD_PRODUCT 테이블

| 컬럼명            | 타입          | NULL 허용 | 설명    |
| -------------- | ----------- | ------- | ----- |
| `PRODUCT_ID`   | VARCHAR(10) | ❌       | 식품 ID |
| `PRODUCT_NAME` | VARCHAR(50) | ❌       | 식품 이름 |
| `PRODUCT_CD`   | VARCHAR(10) | ⭕       | 식품 코드 |
| `CATEGORY`     | VARCHAR(10) | ⭕       | 식품 분류 |
| `PRICE`        | NUMBER      | ⭕       | 식품 가격 |

### FOOD_ORDER 테이블

| 컬럼명            | 타입          | NULL 허용 | 설명    |
| -------------- | ----------- | ------- | ----- |
| `ORDER_ID`     | VARCHAR(10) | ❌       | 주문 ID |
| `PRODUCT_ID`   | VARCHAR(5)  | ❌       | 식품 ID |
| `AMOUNT`       | NUMBER      | ❌       | 주문량   |
| `PRODUCE_DATE` | DATE        | ⭕       | 생산일자  |
| `IN_DATE`      | DATE        | ⭕       | 입고일자  |
| `OUT_DATE`     | DATE        | ⭕       | 출고일자  |
| `FACTORY_ID`   | VARCHAR(10) | ❌       | 공장 ID |
| `WAREHOUSE_ID` | VARCHAR(10) | ❌       | 창고 ID |

## 문제

`FOOD_PRODUCT`와 `FOOD_ORDER` 테이블에서 **생산일자가 2022년 5월인 식품**의 식품 ID, 식품 이름, 총매출을 조회합니다.

* `PRODUCT_ID`를 기준으로 두 테이블을 JOIN
* 생산일자가 2022년 5월인 주문만 조회
* 총매출은 `주문량 × 식품 가격`의 합계
* 총매출을 기준으로 내림차순 정렬
* 총매출이 같다면 식품 ID를 기준으로 오름차순 정렬

### 풀이

[10번 문제 풀이 보기](./solve/10_food_product_total_sales_may_2022.sql)

---
---

### [11. 2022년 4월 13일 취소되지 않은 흉부외과 진료 예약 조회]

### PATIENT 테이블

| 컬럼명       | 타입         | NULL 허용 | 설명   |
| --------- | ---------- | ------- | ---- |
| `PT_NO`   | VARCHAR(N) | ❌       | 환자번호 |
| `PT_NAME` | VARCHAR(N) | ❌       | 환자이름 |
| `GEND_CD` | VARCHAR(N) | ❌       | 성별코드 |
| `AGE`     | INTEGER    | ❌       | 나이   |
| `TLNO`    | VARCHAR(N) | ⭕       | 전화번호 |

### DOCTOR 테이블

| 컬럼명        | 타입         | NULL 허용 | 설명    |
| ---------- | ---------- | ------- | ----- |
| `DR_NAME`  | VARCHAR(N) | ❌       | 의사이름  |
| `DR_ID`    | VARCHAR(N) | ❌       | 의사ID  |
| `LCNS_NO`  | VARCHAR(N) | ❌       | 면허번호  |
| `HIRE_YMD` | DATE       | ❌       | 고용일자  |
| `MCDP_CD`  | VARCHAR(N) | ⭕       | 진료과코드 |
| `TLNO`     | VARCHAR(N) | ⭕       | 전화번호  |

### APPOINTMENT 테이블

| 컬럼명             | 타입         | NULL 허용 | 설명      |
| --------------- | ---------- | ------- | ------- |
| `APNT_YMD`      | TIMESTAMP  | ❌       | 진료 예약일시 |
| `APNT_NO`       | INTEGER    | ❌       | 진료예약번호  |
| `PT_NO`         | VARCHAR(N) | ❌       | 환자번호    |
| `MCDP_CD`       | VARCHAR(N) | ❌       | 진료과코드   |
| `MDDR_ID`       | VARCHAR(N) | ❌       | 의사ID    |
| `APNT_CNCL_YN`  | VARCHAR(N) | ⭕       | 예약취소여부  |
| `APNT_CNCL_YMD` | DATE       | ⭕       | 예약취소날짜  |

## 문제

`PATIENT`, `DOCTOR`, `APPOINTMENT` 테이블에서 **2022년 4월 13일 취소되지 않은 흉부외과(CS) 진료 예약 내역**을 조회합니다.

* `PATIENT`와 `APPOINTMENT`를 `PT_NO` 기준으로 JOIN
* `DOCTOR`와 `APPOINTMENT`를 `DR_ID`와 `MDDR_ID` 기준으로 JOIN
* 예약 취소 여부가 `N`인 데이터만 조회
* 진료과 코드가 `CS`인 데이터만 조회
* 진료 예약일시가 2022년 4월 13일인 데이터만 조회
* 진료예약일시를 기준으로 오름차순 정렬

### 풀이

[11번 문제 풀이 보기](./solve/11_thoracic_surgery_appointment_2022_04_13.sql)

---
---

### [12. 2022년 1월 저자별 카테고리별 매출액 조회]

### BOOK 테이블

| 컬럼명              | 타입         | NULL 허용 | 설명    |
| ---------------- | ---------- | ------- | ----- |
| `BOOK_ID`        | INTEGER    | ❌       | 도서 ID |
| `CATEGORY`       | VARCHAR(N) | ❌       | 카테고리  |
| `AUTHOR_ID`      | INTEGER    | ❌       | 저자 ID |
| `PRICE`          | INTEGER    | ❌       | 판매가   |
| `PUBLISHED_DATE` | DATE       | ❌       | 출판일   |

### AUTHOR 테이블

| 컬럼명           | 타입         | NULL 허용 | 설명    |
| ------------- | ---------- | ------- | ----- |
| `AUTHOR_ID`   | INTEGER    | ❌       | 저자 ID |
| `AUTHOR_NAME` | VARCHAR(N) | ❌       | 저자명   |

### BOOK_SALES 테이블

| 컬럼명          | 타입      | NULL 허용 | 설명    |
| ------------ | ------- | ------- | ----- |
| `BOOK_ID`    | INTEGER | ❌       | 도서 ID |
| `SALES_DATE` | DATE    | ❌       | 판매일   |
| `SALES`      | INTEGER | ❌       | 판매량   |

## 문제

`BOOK`, `AUTHOR`, `BOOK_SALES` 테이블에서 **2022년 1월 도서 판매 데이터를 기준으로 저자별, 카테고리별 매출액**을 조회합니다.

* `AUTHOR`와 `BOOK`을 `AUTHOR_ID` 기준으로 JOIN
* `BOOK`과 `BOOK_SALES`를 `BOOK_ID` 기준으로 JOIN
* 2022년 1월 판매 데이터만 조회
* 매출액은 `판매량 × 판매가`의 합계
* 저자 ID, 저자명, 카테고리, 매출액을 조회
* 저자 ID를 기준으로 오름차순 정렬
* 저자 ID가 같다면 카테고리를 기준으로 내림차순 정렬

### 풀이

[12번 문제 풀이 보기](./solve/12_author_category_sales_january_2022.sql)

---
---

### [13. 공간을 2개 이상 등록한 유저 조회]

### PLACES 테이블

| 컬럼명       | 타입      | NULL 허용 | 설명              |
| --------- | ------- | ------- | --------------- |
| `ID`      | INT     | ❌       | 공간의 아이디         |
| `NAME`    | VARCHAR | ❌       | 공간의 이름          |
| `HOST_ID` | INT     | ❌       | 공간을 소유한 유저의 아이디 |

## 문제

`PLACES` 테이블에서 **공간을 둘 이상 등록한 헤비 유저**가 등록한 공간의 ID, 이름, HOST_ID를 조회합니다.

* 공간을 2개 이상 등록한 유저 조회
* 해당 유저가 등록한 모든 공간의 정보 조회
* 공간 ID를 기준으로 오름차순 정렬

### 핵심 로직

* `HOST_ID`를 기준으로 `GROUP BY`하여 유저별 등록 공간 수를 집계
* `HAVING COUNT(*) >= 2`를 사용하여 공간을 2개 이상 등록한 헤비 유저만 조회
* 서브쿼리에서 조건에 맞는 `HOST_ID`를 구한 후, 메인쿼리의 `IN`으로 해당 유저가 등록한 모든 공간을 조회

### 풀이

[13번 문제 풀이 보기](./solve/13_users_with_2_or_more_places.sql)

---
---

### [14. 10월에 대여를 시작한 세단 차량 조회]

### CAR_RENTAL_COMPANY_CAR 테이블

| 컬럼명         | 타입           | NULL 허용 | 설명         |
| ----------- | ------------ | ------- | ---------- |
| `CAR_ID`    | INTEGER      | ❌       | 자동차 ID     |
| `CAR_TYPE`  | VARCHAR(255) | ❌       | 자동차 종류     |
| `DAILY_FEE` | INTEGER      | ❌       | 일일 대여 요금   |
| `OPTIONS`   | VARCHAR(255) | ❌       | 자동차 옵션 리스트 |

### CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블

| 컬럼명          | 타입      | NULL 허용 | 설명       |
| ------------ | ------- | ------- | -------- |
| `HISTORY_ID` | INTEGER | ❌       | 대여 기록 ID |
| `CAR_ID`     | INTEGER | ❌       | 자동차 ID   |
| `START_DATE` | DATE    | ❌       | 대여 시작일   |
| `END_DATE`   | DATE    | ❌       | 대여 종료일   |

## 문제

`CAR_RENTAL_COMPANY_CAR`와 `CAR_RENTAL_COMPANY_RENTAL_HISTORY` 테이블에서 **자동차 종류가 세단이면서 2022년 10월에 대여를 시작한 기록이 있는 자동차**의 ID를 조회합니다.

* 자동차 종류가 `세단`인 자동차 조회
* 2022년 10월에 대여를 시작한 기록 조회
* 자동차 ID의 중복 제거
* 자동차 ID를 기준으로 내림차순 정렬

### 핵심 로직

* 두 테이블을 `CAR_ID`를 기준으로 `JOIN`
* `CAR_TYPE = '세단'`으로 세단 차량만 필터링
* `TO_CHAR(START_DATE, 'YYYY-MM') = '2022-10'`으로 2022년 10월에 대여를 시작한 기록만 필터링
* 같은 자동차가 10월에 여러 번 대여됐을 수 있으므로 `DISTINCT`로 `CAR_ID` 중복 제거
* `CAR_ID` 기준 내림차순으로 정렬

### 풀이

[14번 문제 풀이 보기](./solve/14_sedan_cars_rented_in_october.sql)

---
---

### [15. 아직 입양하지 못한 동물 중 가장 오래 보호소에 있었던 동물 3마리 조회]

### ANIMAL_INS 테이블

| 컬럼명                | 타입         | NULL 허용 | 설명          |
| ------------------ | ---------- | ------- | ----------- |
| `ANIMAL_ID`        | VARCHAR(N) | ❌       | 동물의 아이디     |
| `ANIMAL_TYPE`      | VARCHAR(N) | ❌       | 생물 종        |
| `DATETIME`         | DATETIME   | ❌       | 보호 시작일      |
| `INTAKE_CONDITION` | VARCHAR(N) | ❌       | 보호 시작 시 상태  |
| `NAME`             | VARCHAR(N) | ⭕       | 이름          |
| `SEX_UPON_INTAKE`  | VARCHAR(N) | ❌       | 성별 및 중성화 여부 |

### ANIMAL_OUTS 테이블

| 컬럼명                | 타입         | NULL 허용 | 설명          |
| ------------------ | ---------- | ------- | ----------- |
| `ANIMAL_ID`        | VARCHAR(N) | ❌       | 동물의 아이디     |
| `ANIMAL_TYPE`      | VARCHAR(N) | ❌       | 생물 종        |
| `DATETIME`         | DATETIME   | ❌       | 입양일         |
| `NAME`             | VARCHAR(N) | ⭕       | 이름          |
| `SEX_UPON_OUTCOME` | VARCHAR(N) | ❌       | 성별 및 중성화 여부 |

## 문제

`ANIMAL_INS`와 `ANIMAL_OUTS` 테이블에서 **아직 입양하지 못한 동물 중 가장 오래 보호소에 있었던 동물 3마리**의 이름과 보호 시작일을 조회합니다.

* `ANIMAL_OUTS`에 존재하지 않는 동물만 조회
* 보호 시작일이 오래된 순으로 정렬
* 가장 오래된 3마리만 조회

### 핵심 로직

* `ANIMAL_OUTS`의 `ANIMAL_ID`를 서브쿼리로 조회
* `NOT IN`을 사용하여 `ANIMAL_OUTS`에 없는 동물만 필터링
* `ORDER BY DATETIME ASC`로 보호 시작일이 오래된 순으로 정렬
* `FETCH FIRST 3 ROWS ONLY`를 사용하여 정렬된 결과에서 앞의 3개 행만 조회

### FETCH FIRST

```sql
FETCH FIRST 숫자 ROWS ONLY
```

조회 결과에서 **앞에서부터 지정한 개수만큼의 행을 가져오는 문법**입니다.

```sql
ORDER BY DATETIME ASC
FETCH FIRST 3 ROWS ONLY
```

* `ORDER BY DATETIME ASC` → 보호 시작일이 오래된 순으로 정렬
* `FETCH FIRST 3 ROWS ONLY` → 정렬된 결과에서 앞의 3개 행만 조회

따라서 위 코드는 **보호 시작일이 가장 오래된 동물 3마리**를 조회합니다.

### 풀이

[15번 문제 풀이 보기](./solve/15_oldest_animals_not_adopted.sql)

---
---

### [16. 보호기간이 가장 긴 입양 동물 2마리 조회]

### ANIMAL_INS 테이블

| 컬럼명                | 타입         | NULL 허용 | 설명          |
| ------------------ | ---------- | ------- | ----------- |
| `ANIMAL_ID`        | VARCHAR(N) | ❌       | 동물의 아이디     |
| `ANIMAL_TYPE`      | VARCHAR(N) | ❌       | 생물 종        |
| `DATETIME`         | DATETIME   | ❌       | 보호 시작일      |
| `INTAKE_CONDITION` | VARCHAR(N) | ❌       | 보호 시작 시 상태  |
| `NAME`             | VARCHAR(N) | ⭕       | 이름          |
| `SEX_UPON_INTAKE`  | VARCHAR(N) | ❌       | 성별 및 중성화 여부 |

### ANIMAL_OUTS 테이블

| 컬럼명                | 타입         | NULL 허용 | 설명          |
| ------------------ | ---------- | ------- | ----------- |
| `ANIMAL_ID`        | VARCHAR(N) | ❌       | 동물의 아이디     |
| `ANIMAL_TYPE`      | VARCHAR(N) | ❌       | 생물 종        |
| `DATETIME`         | DATETIME   | ❌       | 입양일         |
| `NAME`             | VARCHAR(N) | ⭕       | 이름          |
| `SEX_UPON_OUTCOME` | VARCHAR(N) | ❌       | 성별 및 중성화 여부 |

## 문제

`ANIMAL_INS`와 `ANIMAL_OUTS` 테이블에서 **입양을 간 동물 중 보호 기간이 가장 길었던 동물 2마리**의 아이디와 이름을 조회합니다.

* `ANIMAL_INS`와 `ANIMAL_OUTS`를 `ANIMAL_ID` 기준으로 조인
* 보호 기간이 긴 순으로 정렬
* 보호 기간이 가장 긴 2마리만 조회

### 핵심 로직

* `ANIMAL_INS`와 `ANIMAL_OUTS`를 `ANIMAL_ID` 기준으로 `JOIN`하여 입양을 간 동물만 조회
* `O.DATETIME - I.DATETIME`으로 입양일까지의 보호 기간을 계산
* 서브쿼리에서 보호 기간을 내림차순으로 정렬한 후 `FETCH FIRST 2 ROWS ONLY`로 가장 오래 보호된 2마리의 ID를 조회
* 메인쿼리에서 `IN`을 사용하여 해당 동물의 ID와 이름을 조회
* 최종 결과도 보호 기간이 긴 순으로 정렬

### 풀이

[16번 문제 풀이 보기](./solve/16_longest_shelter_period_adopted_animals.sql)

---
---

### [17. 우유와 요거트를 동시에 구매한 장바구니 조회]

### CART_PRODUCTS 테이블

| 컬럼명       | 타입      | NULL 허용 | 설명        |
| --------- | ------- | ------- | --------- |
| `ID`      | INT     | ❌       | 테이블의 아이디  |
| `CART_ID` | INT     | ❌       | 장바구니의 아이디 |
| `NAME`    | VARCHAR | ❌       | 상품 종류     |
| `PRICE`   | INT     | ❌       | 가격        |

## 문제

`CART_PRODUCTS` 테이블에서 **우유(Milk)와 요거트(Yogurt)를 동시에 구입한 장바구니**의 ID를 조회합니다.

* `Milk`를 담은 장바구니 조회
* `Yogurt`를 담은 장바구니 중 `Milk`도 담은 장바구니만 조회
* 장바구니 ID 중복 제거
* 장바구니 ID를 기준으로 오름차순 정렬

### 핵심 로직

* 서브쿼리에서 `NAME = 'Milk'`인 `CART_ID`를 조회
* 메인쿼리에서 `NAME = 'Yogurt'`인 상품을 조회
* `IN`을 사용하여 `Milk`가 포함된 장바구니인지 확인
* `DISTINCT`를 사용하여 동일 장바구니 ID의 중복 제거
* `CART_ID` 기준 오름차순 정렬

### 풀이

[17번 문제 풀이 보기](./solve/17_carts_with_milk_and_yogurt.sql)

---
---

### [18. 아이스크림 맛별 총 주문량 상위 3개 조회]

### FIRST_HALF 테이블

| 컬럼명           | 타입         | NULL 허용 | 설명              |
| ------------- | ---------- | ------- | --------------- |
| `SHIPMENT_ID` | INT(N)     | ❌       | 출하 번호           |
| `FLAVOR`      | VARCHAR(N) | ❌       | 아이스크림 맛         |
| `TOTAL_ORDER` | INT(N)     | ❌       | 상반기 아이스크림 총 주문량 |

### JULY 테이블

| 컬럼명           | 타입         | NULL 허용 | 설명             |
| ------------- | ---------- | ------- | -------------- |
| `SHIPMENT_ID` | INT(N)     | ❌       | 출하 번호          |
| `FLAVOR`      | VARCHAR(N) | ❌       | 아이스크림 맛        |
| `TOTAL_ORDER` | INT(N)     | ❌       | 7월 아이스크림 총 주문량 |

## 문제

`FIRST_HALF`와 `JULY` 테이블에서 **7월 아이스크림 총 주문량과 상반기 아이스크림 총 주문량을 더한 값이 큰 순서대로 상위 3개의 맛**을 조회합니다.

* `FLAVOR`를 기준으로 두 테이블을 조인
* 맛별 7월 주문량과 상반기 주문량의 합계 계산
* 총 주문량이 많은 순서대로 정렬
* 상위 3개의 맛만 조회

### 핵심 로직

* `FLAVOR`를 기준으로 `FIRST_HALF`와 `JULY`를 `JOIN`
* `JULY`는 같은 맛이 여러 출하 번호로 존재할 수 있으므로 `GROUP BY J.FLAVOR`로 맛별 그룹화
* `SUM(J.TOTAL_ORDER + F.TOTAL_ORDER)`로 7월 주문량과 상반기 주문량의 합계를 계산
* `ORDER BY`에서 총 주문량이 큰 순으로 `DESC` 정렬
* `FETCH FIRST 3 ROW ONLY`를 사용하여 상위 3개의 맛만 조회

### 풀이

[18번 문제 풀이 보기](./solve/18_top_3_ice_cream_flavors.sql)

---
---

### [19. 리뷰를 가장 많이 작성한 회원의 리뷰 조회]

### MEMBER_PROFILE 테이블

| 컬럼명             | 타입           | NULL 허용 | 설명     |
| --------------- | ------------ | ------- | ------ |
| `MEMBER_ID`     | VARCHAR(100) | ❌       | 회원 ID  |
| `MEMBER_NAME`   | VARCHAR(50)  | ❌       | 회원 이름  |
| `TLNO`          | VARCHAR(50)  | ⭕       | 회원 연락처 |
| `GENDER`        | VARCHAR(1)   | ⭕       | 성별     |
| `DATE_OF_BIRTH` | DATE         | ⭕       | 생년월일   |

### REST_REVIEW 테이블

| 컬럼명            | 타입            | NULL 허용 | 설명     |
| -------------- | ------------- | ------- | ------ |
| `REVIEW_ID`    | VARCHAR(10)   | ❌       | 리뷰 ID  |
| `REST_ID`      | VARCHAR(10)   | ⭕       | 식당 ID  |
| `MEMBER_ID`    | VARCHAR(100)  | ⭕       | 회원 ID  |
| `REVIEW_SCORE` | NUMBER        | ⭕       | 리뷰 점수  |
| `REVIEW_TEXT`  | VARCHAR(1000) | ⭕       | 리뷰 내용  |
| `REVIEW_DATE`  | DATE          | ⭕       | 리뷰 작성일 |

## 문제

`MEMBER_PROFILE`과 `REST_REVIEW` 테이블에서 **리뷰를 가장 많이 작성한 회원의 리뷰**를 조회합니다.

* 리뷰를 가장 많이 작성한 회원 조회
* 회원 이름, 리뷰 텍스트, 리뷰 작성일 출력
* 리뷰 작성일 기준 오름차순 정렬
* 리뷰 작성일이 같다면 리뷰 텍스트 기준 오름차순 정렬
* 리뷰 작성일은 `YYYY-MM-DD` 형식으로 출력

### 핵심 로직

* `REST_REVIEW`에서 `MEMBER_ID`별 `COUNT(REVIEW_TEXT)`를 구하여 회원별 리뷰 개수를 집계
* `ORDER BY COUNT(REVIEW_TEXT) DESC`와 `FETCH FIRST 1 ROW ONLY`를 사용하여 가장 많은 리뷰 개수를 조회
* `HAVING COUNT(REVIEW_TEXT) = (...)`를 사용하여 최대 리뷰 개수와 동일한 회원의 `MEMBER_ID`를 조회
* `MEMBER_PROFILE`과 `REST_REVIEW`를 `MEMBER_ID` 기준으로 `JOIN`
* `IN`을 사용하여 리뷰를 가장 많이 작성한 회원의 리뷰만 필터링
* `TO_CHAR(R.REVIEW_DATE, 'YYYY-MM-DD')`를 사용하여 리뷰 작성일의 출력 형식을 지정
* `REVIEW_DATE` 오름차순, 리뷰 작성일이 같으면 `REVIEW_TEXT` 오름차순으로 정렬

### 풀이

[19번 문제 풀이 보기](./solve/19_member_with_most_reviews.sql)

---
---

### [20. 특정 옵션을 포함하는 자동차 종류별 대수 조회]
`
### CAR_RENTAL_COMPANY_CAR 테이블

| 컬럼명         | 타입           | NULL 허용 | 설명         |
| ----------- | ------------ | ------- | ---------- |
| `CAR_ID`    | INTEGER      | ❌       | 자동차 ID     |
| `CAR_TYPE`  | VARCHAR(255) | ❌       | 자동차 종류     |
| `DAILY_FEE` | INTEGER      | ❌       | 일일 대여 요금   |
| `OPTIONS`   | VARCHAR(255) | ❌       | 자동차 옵션 리스트 |

## 문제

`CAR_RENTAL_COMPANY_CAR` 테이블에서 **'통풍시트', '열선시트', '가죽시트' 중 하나 이상의 옵션이 포함된 자동차**를 자동차 종류별로 몇 대인지 조회합니다.

* '통풍시트', '열선시트', '가죽시트' 중 하나 이상의 옵션이 포함된 자동차 조회
* 자동차 종류별 자동차 수를 집계
* 자동차 수의 컬럼명은 `CARS`로 지정
* 자동차 종류를 기준으로 오름차순 정렬

### 핵심 로직

* `OPTIONS LIKE '%통풍시트%'`, `LIKE '%열선시트%'`, `LIKE '%가죽시트%'`를 `OR`로 연결하여 세 옵션 중 **하나라도 포함된 자동차**를 조회
* `GROUP BY CAR_TYPE`으로 자동차 종류별로 그룹화
* `COUNT(CAR_ID)`로 각 자동차 종류에 해당하는 자동차 수를 집계
* `ORDER BY CAR_TYPE ASC`로 자동차 종류를 오름차순 정렬

### 풀이

[20번 문제 풀이 보기](./solve/20_car_option_type_count.sql)

---
---

### [21. 시간대별 입양 건수 조회]

### ANIMAL_OUTS 테이블

| 컬럼명                | 타입         | NULL 허용 | 설명          |
| ------------------ | ---------- | ------- | ----------- |
| `ANIMAL_ID`        | VARCHAR(N) | ❌       | 동물의 아이디     |
| `ANIMAL_TYPE`      | VARCHAR(N) | ❌       | 생물 종        |
| `DATETIME`         | DATETIME   | ❌       | 입양일         |
| `NAME`             | VARCHAR(N) | ⭕       | 동물 이름       |
| `SEX_UPON_OUTCOME` | VARCHAR(N) | ❌       | 성별 및 중성화 여부 |

## 문제

`ANIMAL_OUTS` 테이블에서 **09:00부터 19:59까지 각 시간대별 입양 건수**를 조회합니다.

* 09시부터 19시까지의 입양 건수를 시간대별로 집계
* 시간대는 숫자로 출력
* 시간대 순으로 오름차순 정렬

### 핵심 로직

* `TO_CHAR(DATETIME, 'FMHH24')`로 `DATETIME`에서 24시간제의 시간만 추출
* `TO_NUMBER()`를 사용하여 추출한 시간을 숫자로 변환
* `WHERE HOUR BETWEEN 9 AND 19`로 09시~19시 범위만 남김
* `GROUP BY HOUR`로 같은 시간대끼리 그룹화
* `COUNT(*)`로 각 시간대의 입양 건수를 집계
* `ORDER BY HOUR ASC`로 시간대 순서대로 정렬

### 풀이

[21번 문제 풀이 보기](./solve/21_hourly_animal_outs_count.sql)

---
---

### [22. 연도별 월별 성별 온라인 구매 회원 수 조회]

### USER_INFO 테이블

| 컬럼명       | 타입         | NULL 허용 | 설명    |
| --------- | ---------- | ------- | ----- |
| `USER_ID` | INTEGER    | ❌       | 회원 ID |
| `GENDER`  | TINYINT(1) | ⭕       | 성별    |
| `AGE`     | INTEGER    | ⭕       | 나이    |
| `JOINED`  | DATE       | ❌       | 가입일   |

### ONLINE_SALE 테이블

| 컬럼명              | 타입      | NULL 허용 | 설명        |
| ---------------- | ------- | ------- | --------- |
| `ONLINE_SALE_ID` | INTEGER | ❌       | 온라인 판매 ID |
| `USER_ID`        | INTEGER | ❌       | 회원 ID     |
| `PRODUCT_ID`     | INTEGER | ❌       | 상품 ID     |
| `SALES_AMOUNT`   | INTEGER | ❌       | 판매량       |
| `SALES_DATE`     | DATE    | ❌       | 판매일       |

## 문제

`USER_INFO`와 `ONLINE_SALE` 테이블에서 **년, 월, 성별별로 상품을 구매한 회원 수**를 조회합니다.

* `USER_ID`를 기준으로 두 테이블을 조인
* 성별 정보가 없는 회원은 제외
* 판매일에서 년, 월을 추출하여 그룹화
* 년, 월, 성별별 중복되지 않는 구매 회원 수를 집계
* 년, 월, 성별을 기준으로 오름차순 정렬

### 핵심 로직

* `USER_INFO`와 `ONLINE_SALE`을 `USER_ID`로 `JOIN`하여 구매 회원의 성별 정보를 연결
* `WHERE U.GENDER IS NOT NULL`로 성별 정보가 없는 회원을 제외
* `TO_CHAR(O.SALES_DATE, 'YYYY')`로 판매 연도를 추출
* `TO_CHAR(O.SALES_DATE, 'FMMM')`으로 판매 월을 추출
* `GROUP BY YEAR, MONTH, GENDER`로 연도·월·성별별 그룹을 생성
* `COUNT(DISTINCT O.USER_ID)`로 같은 기간에 여러 상품을 구매한 회원도 **한 명으로 계산**
* `ORDER BY YEAR ASC, MONTH ASC, GENDER ASC`로 연도 → 월 → 성별 순으로 오름차순 정렬

### 풀이

[22번 문제 풀이 보기](./solve/22_online_sale_users_by_gender_month.sql)

---
---

### [23. 8월부터 10월까지 5회 이상 대여한 차량의 월별 대여 횟수 조회]

### CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블

| 컬럼명          | 타입      | NULL 허용 | 설명       |
| ------------ | ------- | ------- | -------- |
| `HISTORY_ID` | INTEGER | ❌       | 대여 기록 ID |
| `CAR_ID`     | INTEGER | ❌       | 자동차 ID   |
| `START_DATE` | DATE    | ❌       | 대여 시작일   |
| `END_DATE`   | DATE    | ❌       | 대여 종료일   |

## 문제

`CAR_RENTAL_COMPANY_RENTAL_HISTORY` 테이블에서 **2022년 8월부터 10월까지 대여 시작일을 기준으로 총 대여 횟수가 5회 이상인 자동차**를 찾고, 해당 기간 동안의 월별 자동차 ID별 총 대여 횟수를 조회합니다.

* 2022년 8월~10월에 대여를 시작한 기록만 대상
* 해당 기간 동안 총 5회 이상 대여한 자동차만 조회
* 월별 자동차 ID별 대여 횟수를 `RECORDS`로 집계
* 월 오름차순, 자동차 ID 내림차순으로 정렬

### 핵심 로직

* **안쪽 서브쿼리**에서 2022년 8월~10월 동안 대여한 자동차를 `CAR_ID`별로 그룹화하여, 기간 내 총 5회 이상 대여한 자동차 ID를 찾음
* **바깥 쿼리**에서는 안쪽 서브쿼리에서 찾은 자동차 ID를 대상으로 해당 기간의 대여 기록을 다시 조회
* 바깥 쿼리에서 월과 자동차 ID별로 그룹화하여 **각 월에 실제로 몇 번 대여되었는지**를 계산
* 즉, **안쪽 쿼리는 '기간 전체에서 5회 이상 대여한 자동차를 찾는 역할'**, **바깥 쿼리는 '그 자동차들의 월별 대여 횟수를 계산하는 역할'**로 나누어 생각하면 됨

### ❌ 처음 SQL에서 한 실수

안쪽 쿼리에서는 기간 내 5회 이상 대여한 자동차 ID를 제대로 구했음.

하지만 바깥 쿼리에서 **안쪽 쿼리에서 구한 자동차 ID만 확인하면 된다고 생각한 것이 문제였음.**

문제에서 요구하는 것은 단순히 해당 자동차의 ID를 출력하는 것이 아니라, **그 자동차들이 8월, 9월, 10월에 각각 몇 번 대여되었는지**를 구하는 것임.

따라서 바깥 쿼리에서는 서브쿼리에서 찾은 자동차 ID를 기준으로 다시 월별 대여 기록을 그룹화하고 대여 횟수를 집계해야 함.

> **안쪽 쿼리 → 기간 내 5회 이상 대여한 자동차 ID 찾기**
> **바깥 쿼리 → 해당 자동차들의 월별 대여 횟수 계산**

이렇게 서브쿼리와 바깥 쿼리의 역할을 구분해야 함.

### 풀이

[23번 문제 풀이 보기](./solve/23_rental_history_aug_to_oct_5_or_more.sql)

---
---

### [24. 부서별 평균 연봉 조회]

### HR_DEPARTMENT 테이블

| 컬럼명            | 타입      | NULL 허용 | 설명     |
| -------------- | ------- | ------- | ------ |
| `DEPT_ID`      | VARCHAR | ❌       | 부서 ID  |
| `DEPT_NAME_KR` | VARCHAR | ❌       | 국문 부서명 |
| `DEPT_NAME_EN` | VARCHAR | ❌       | 영문 부서명 |
| `LOCATION`     | VARCHAR | ❌       | 부서 위치  |

### HR_EMPLOYEES 테이블

| 컬럼명         | 타입      | NULL 허용 | 설명    |
| ----------- | ------- | ------- | ----- |
| `EMP_NO`    | VARCHAR | ❌       | 사번    |
| `EMP_NAME`  | VARCHAR | ❌       | 성명    |
| `DEPT_ID`   | VARCHAR | ❌       | 부서 ID |
| `POSITION`  | VARCHAR | ❌       | 직책    |
| `EMAIL`     | VARCHAR | ❌       | 이메일   |
| `COMP_TEL`  | VARCHAR | ❌       | 전화번호  |
| `HIRE_DATE` | DATE    | ❌       | 입사일   |
| `SAL`       | NUMBER  | ❌       | 연봉    |

## 문제

`HR_DEPARTMENT`와 `HR_EMPLOYEES` 테이블을 이용해 **부서별 평균 연봉**을 조회합니다.

* 부서 ID, 영문 부서명, 평균 연봉을 조회
* 평균 연봉의 컬럼명은 `AVG_SAL`로 지정
* 평균 연봉은 소수점 첫째 자리에서 반올림
* 부서별 평균 연봉을 기준으로 내림차순 정렬

### 핵심 로직

* `DEPT_ID`를 기준으로 `HR_DEPARTMENT`와 `HR_EMPLOYEES`를 조인하여 부서 정보와 사원 연봉 정보를 연결
* `GROUP BY D.DEPT_ID, D.DEPT_NAME_EN`으로 부서별 그룹을 생성
* `AVG(E.SAL)`을 사용하여 각 부서의 평균 연봉을 계산
* `ROUND()`로 평균 연봉의 소수점 이하를 반올림
* `ORDER BY AVG_SAL DESC`로 평균 연봉이 높은 부서부터 정렬

### 풀이

[24번 문제 풀이 보기](./solve/24_department_average_salary.sql)

---
---

### [25. 월별 잡은 물고기 수 조회]

### FISH_INFO 테이블

| 컬럼명         | 타입      | NULL 허용 | 설명         |
| ----------- | ------- | ------- | ---------- |
| `ID`        | INTEGER | ❌       | 물고기 ID     |
| `FISH_TYPE` | INTEGER | ❌       | 물고기 종류     |
| `LENGTH`    | FLOAT   | ⭕       | 물고기 길이(cm) |
| `TIME`      | DATE    | ❌       | 물고기를 잡은 날짜 |

## 문제

`FISH_INFO` 테이블에서 **월별로 잡은 물고기의 수와 월**을 조회합니다.

* 잡은 물고기 수를 `FISH_COUNT`로 출력
* 월을 `MONTH`로 출력
* 월은 숫자 형태로 출력
* 물고기가 없는 월은 출력하지 않음
* 월을 기준으로 오름차순 정렬

### 핵심 로직

* `EXTRACT(MONTH FROM TIME)`을 사용하여 잡은 날짜에서 월을 추출
* `GROUP BY`로 같은 월의 물고기들을 그룹화
* `COUNT(ID)`로 각 월에 잡은 물고기의 수를 계산
* `ORDER BY MONTH ASC`로 월을 1월부터 오름차순 정렬
* `FISH_INFO`에 실제 데이터가 존재하는 월만 그룹으로 생성되므로 물고기가 없는 월은 결과에 포함되지 않음
* `HAVING FISH_COUNT <> 0`은 `COUNT(ID)`가 항상 1 이상인 그룹만 생성되므로 생략 가능

### 풀이

[25번 문제 풀이 보기](./solve/25_monthly_fish_count.sql)

---
---

### [26. 수원지역 연도별 평균 미세먼지 오염도 조회]

### AIR_POLLUTION 테이블

| 컬럼명         | 타입      | NULL 허용 | 설명        |
| ----------- | ------- | ------- | --------- |
| `LOCATION1` | VARCHAR | ❌       | 지역구분1     |
| `LOCATION2` | VARCHAR | ❌       | 지역구분2     |
| `YM`        | DATE    | ❌       | 측정일       |
| `PM_VAL1`   | NUMBER  | ❌       | 미세먼지 오염도  |
| `PM_VAL2`   | NUMBER  | ❌       | 초미세먼지 오염도 |

## 문제

`AIR_POLLUTION` 테이블에서 **수원 지역의 연도별 평균 미세먼지 오염도와 평균 초미세먼지 오염도**를 조회합니다.

* 수원 지역의 데이터만 조회
* 연도별로 평균 미세먼지 오염도를 계산
* 연도별로 평균 초미세먼지 오염도를 계산
* 평균 미세먼지 오염도는 `PM10`으로 출력
* 평균 초미세먼지 오염도는 `PM2.5`로 출력
* 소수 셋째 자리에서 반올림
* 연도 기준 오름차순 정렬

### 핵심 로직

* `WHERE LOCATION2 = '수원'`으로 수원 지역의 데이터만 필터링
* `EXTRACT(YEAR FROM YM)`으로 측정일에서 연도를 추출
* `GROUP BY YEAR`로 같은 연도끼리 그룹화
* `AVG(PM_VAL1)`으로 연도별 평균 미세먼지 오염도를 계산
* `AVG(PM_VAL2)`로 연도별 평균 초미세먼지 오염도를 계산
* `ROUND(..., 2)`를 사용하여 평균값을 소수 둘째 자리까지 반올림
* `ORDER BY YEAR ASC`로 연도순으로 오름차순 정렬

### 풀이

[26번 문제 풀이 보기](./solve/26_suwon_yearly_air_pollution.sql)

---
---

### [27. 물고기 종류별 이름과 잡은 수 조회]

### FISH_INFO 테이블

| 컬럼명         | 타입      | NULL 허용 | 설명         |
| ----------- | ------- | ------- | ---------- |
| `ID`        | INTEGER | ❌       | 물고기 ID     |
| `FISH_TYPE` | INTEGER | ❌       | 물고기 종류     |
| `LENGTH`    | FLOAT   | ⭕       | 물고기 길이(cm) |
| `TIME`      | DATE    | ❌       | 물고기를 잡은 날짜 |

### FISH_NAME_INFO 테이블

| 컬럼명         | 타입      | NULL 허용 | 설명     |
| ----------- | ------- | ------- | ------ |
| `FISH_TYPE` | INTEGER | ❌       | 물고기 종류 |
| `FISH_NAME` | VARCHAR | ❌       | 물고기 이름 |

## 문제

`FISH_INFO`와 `FISH_NAME_INFO` 테이블을 이용해 **물고기 종류별 이름과 잡은 수**를 조회합니다.

* 물고기 이름을 `FISH_NAME`으로 출력
* 잡은 수를 `FISH_COUNT`로 출력
* 잡은 수를 기준으로 내림차순 정렬

### 핵심 로직

* `FISH_TYPE`을 기준으로 두 테이블을 조인하여 물고기의 종류와 이름을 연결
* `COUNT(I.ID)`를 사용하여 물고기 종류별로 잡은 수를 계산
* `GROUP BY N.FISH_NAME`으로 물고기 이름별 그룹을 생성
* `ORDER BY FISH_COUNT DESC`로 잡은 수가 많은 물고기부터 정렬

### 풀이

[27번 문제 풀이 보기](./solve/27_fish_count_by_name.sql)

---
---

### [28. 2022년 평가 점수가 가장 높은 사원 조회]

### HR_EMPLOYEES 테이블

| 컬럼명         | 타입      | NULL 허용 | 설명    |
| ----------- | ------- | ------- | ----- |
| `EMP_NO`    | VARCHAR | ❌       | 사번    |
| `EMP_NAME`  | VARCHAR | ❌       | 성명    |
| `DEPT_ID`   | VARCHAR | ❌       | 부서 ID |
| `POSITION`  | VARCHAR | ❌       | 직책    |
| `EMAIL`     | VARCHAR | ❌       | 이메일   |
| `COMP_TEL`  | VARCHAR | ❌       | 전화번호  |
| `HIRE_DATE` | DATE    | ❌       | 입사일   |
| `SAL`       | NUMBER  | ❌       | 연봉    |

### HR_GRADE 테이블

| 컬럼명         | 타입      | NULL 허용 | 설명    |
| ----------- | ------- | ------- | ----- |
| `EMP_NO`    | VARCHAR | ❌       | 사번    |
| `YEAR`      | NUMBER  | ❌       | 평가 연도 |
| `HALF_YEAR` | NUMBER  | ❌       | 반기    |
| `SCORE`     | NUMBER  | ❌       | 평가 점수 |

## 문제

`HR_EMPLOYEES`와 `HR_GRADE` 테이블을 이용해 **2022년도 한 해 동안 평가 점수가 가장 높은 사원**의 정보를 조회합니다.

* 2022년 상반기와 하반기 평가 점수를 합산
* 가장 높은 평가 점수를 받은 사원의 점수를 `SCORE`로 출력
* 사번, 성명, 직책, 이메일을 함께 출력

### 핵심 로직

* `EMP_NO`를 기준으로 `HR_EMPLOYEES`와 `HR_GRADE`를 조인하여 사원 정보와 평가 정보를 연결
* `SUM(G.SCORE)`를 사용하여 사원별 상반기와 하반기 평가 점수를 합산
* `GROUP BY EMP_NO`로 사원별 평가 점수를 그룹화
* `ORDER BY SUM(SCORE) DESC`로 합산 점수가 높은 사원부터 정렬
* `LIMIT 1`을 사용하여 가장 높은 평가 점수를 받은 사원 1명을 조회

### 풀이

[28번 문제 풀이 보기](./solve/28_2022_highest_evaluation_score_employee.sql)

---
---

### [29. 평균 길이 33cm 이상인 물고기 종류 조회]

### FISH_INFO 테이블

| 컬럼명         | 타입      | NULL 허용 | 설명         |
| ----------- | ------- | ------- | ---------- |
| `ID`        | INTEGER | ❌       | 물고기 ID     |
| `FISH_TYPE` | INTEGER | ❌       | 물고기 종류     |
| `LENGTH`    | FLOAT   | ⭕       | 물고기 길이(cm) |
| `TIME`      | DATE    | ❌       | 물고기를 잡은 날짜 |

## 문제

`FISH_INFO` 테이블에서 **평균 길이가 33cm 이상인 물고기들을 종류별로 분류하여 잡은 수, 최대 길이, 물고기의 종류**를 조회합니다.

* 평균 길이가 33cm 이상인 물고기 종류만 조회
* 잡은 수를 `FISH_COUNT`로 출력
* 최대 길이를 `MAX_LENGTH`로 출력
* 물고기 종류를 `FISH_TYPE`으로 출력
* 10cm 이하의 물고기는 10cm로 취급하여 평균 길이 계산
* 물고기 종류를 기준으로 오름차순 정렬

### 핵심 로직

* 서브쿼리에서 `FISH_TYPE`별로 그룹화하여 물고기 종류별 평균 길이를 계산
* `CASE`를 사용하여 `LENGTH`가 10cm 이하인 경우 10으로 변환
* `HAVING AVG(...) >= 33`으로 평균 길이가 33cm 이상인 물고기 종류만 추출
* 바깥 쿼리에서 해당 `FISH_TYPE`에 속하는 물고기만 조회
* `COUNT(*)`로 종류별 잡은 수를 계산
* `MAX(LENGTH)`로 종류별 최대 길이를 계산
* `GROUP BY FISH_TYPE`으로 물고기 종류별 집계
* `ORDER BY FISH_TYPE ASC`로 물고기 종류를 오름차순 정렬

### CASE 표현식 활용

`CASE`는 조건에 따라 값을 다르게 반환하는 표현식이다.

```sql
CASE
    WHEN 조건 THEN 결과
    ELSE 결과
END
```

### 1. SELECT에서 사용

조건에 따라 조회할 값을 변경할 수 있다.

```sql
SELECT CASE
           WHEN LENGTH > 10 THEN LENGTH
           ELSE 10
       END AS LENGTH
FROM FISH_INFO;
```

### 2. WHERE에서 사용

조건에 따라 특정 값을 만들어 필터링할 수 있다.

```sql
WHERE CASE
          WHEN LENGTH > 10 THEN LENGTH
          ELSE 10
      END >= 33
```

### 3. GROUP BY에서 사용

조건에 따라 데이터를 분류한 뒤 그룹화할 수 있다.

```sql
GROUP BY CASE
             WHEN LENGTH >= 30 THEN 'LONG'
             ELSE 'SHORT'
         END
```

### 4. HAVING에서 사용

그룹별 집계 결과를 계산할 때 `CASE`를 사용할 수 있다.

```sql
HAVING AVG(
    CASE
        WHEN LENGTH > 10 THEN LENGTH
        ELSE 10
    END
) >= 33
```

이번 문제에서는 `HAVING`에서 `AVG()`와 함께 사용하여 **10cm 이하의 물고기를 10cm로 취급한 평균 길이**를 계산했다.

### 5. ORDER BY에서 사용

조건에 따라 정렬 기준을 다르게 만들 수 있다.

```sql
ORDER BY CASE
             WHEN LENGTH >= 30 THEN 1
             ELSE 2
         END;
```

### 핵심 정리

`CASE`는 특정 절에서만 사용하는 문법이 아니라 **조건에 따라 값을 만들어내는 표현식**이다.

따라서 `SELECT`, `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY` 등에서 사용할 수 있다.

이번 문제에서는 `HAVING`의 `AVG()` 안에서 `CASE`를 사용하여 **10cm 이하의 물고기를 10cm로 치환한 뒤 평균 길이를 계산**했다.

### 풀이

[29번 문제 풀이 보기](./solve/29_fish_type_average_length_over_33.sql)

---
---

### [30. 평가 등급과 성과금 조회]

### HR_DEPARTMENT 테이블

| 컬럼명            | 타입      | NULL 허용 | 설명     |
| -------------- | ------- | ------- | ------ |
| `DEPT_ID`      | VARCHAR | ❌       | 부서 ID  |
| `DEPT_NAME_KR` | VARCHAR | ❌       | 국문 부서명 |
| `DEPT_NAME_EN` | VARCHAR | ❌       | 영문 부서명 |
| `LOCATION`     | VARCHAR | ❌       | 부서 위치  |

### HR_EMPLOYEES 테이블

| 컬럼명         | 타입      | NULL 허용 | 설명    |
| ----------- | ------- | ------- | ----- |
| `EMP_NO`    | VARCHAR | ❌       | 사번    |
| `EMP_NAME`  | VARCHAR | ❌       | 성명    |
| `DEPT_ID`   | VARCHAR | ❌       | 부서 ID |
| `POSITION`  | VARCHAR | ❌       | 직책    |
| `EMAIL`     | VARCHAR | ❌       | 이메일   |
| `COMP_TEL`  | VARCHAR | ❌       | 전화번호  |
| `HIRE_DATE` | DATE    | ❌       | 입사일   |
| `SAL`       | NUMBER  | ❌       | 연봉    |

### HR_GRADE 테이블

| 컬럼명         | 타입      | NULL 허용 | 설명    |
| ----------- | ------- | ------- | ----- |
| `EMP_NO`    | VARCHAR | ❌       | 사번    |
| `YEAR`      | NUMBER  | ❌       | 연도    |
| `HALF_YEAR` | NUMBER  | ❌       | 반기    |
| `SCORE`     | NUMBER  | ❌       | 평가 점수 |

## 문제

`HR_DEPARTMENT`, `HR_EMPLOYEES`, `HR_GRADE` 테이블을 이용하여 사원별 성과금 정보를 조회합니다.

평가 점수의 평균에 따라 등급을 결정하고, 해당 등급에 따라 연봉 기준 성과금을 계산합니다.

* 평가 점수의 평균이 96점 이상이면 `S`
* 평가 점수의 평균이 90점 이상이면 `A`
* 평가 점수의 평균이 80점 이상이면 `B`
* 그 외에는 `C`
* 평가 등급은 `GRADE`로 출력
* 성과금은 `BONUS`로 출력
* 사번 기준 오름차순 정렬

### 핵심 로직

* `HR_EMPLOYEES`와 `HR_GRADE`를 `EMP_NO` 기준으로 조인
* `AVG(G.SCORE)`를 이용하여 사원별 1분기와 2분기 평가 점수의 평균을 계산
* `CASE`를 사용하여 평균 점수에 따라 `S`, `A`, `B`, `C` 등급을 결정
* 등급별 연봉의 20%, 15%, 10%, 0%를 성과금으로 계산
* `GROUP BY`를 통해 사원별로 평가 점수를 집계
* `ORDER BY EMP_NO ASC`를 통해 사번 기준으로 오름차순 정렬

### WITH절을 이용한 등급 재사용

등급을 결정하는 `CASE`와 성과금을 계산하는 `CASE`에서 동일한 평균 점수 조건을 반복해서 사용하는 대신, `WITH`절을 이용하여 먼저 등급을 계산한 뒤 그 등급을 성과금 계산에 재사용할 수 있다.

```sql
WITH GRADING AS (
    SELECT E.EMP_NO,
           E.EMP_NAME,
           E.SAL,
           CASE
               WHEN AVG(G.SCORE) >= 96 THEN 'S'
               WHEN AVG(G.SCORE) >= 90 THEN 'A'
               WHEN AVG(G.SCORE) >= 80 THEN 'B'
               ELSE 'C'
           END AS GRADE
    FROM HR_EMPLOYEES E
    JOIN HR_GRADE G
      ON E.EMP_NO = G.EMP_NO
    GROUP BY E.EMP_NO, E.EMP_NAME, E.SAL
)
```

`WITH GRADING AS (...)`은 서브쿼리 결과에 `GRADING`이라는 이름을 붙여 뒤의 `SELECT`에서 사용할 수 있도록 한다.

이후 `GRADING`에서 만들어진 `GRADE`를 이용하여 성과금을 계산한다.

```sql
CASE
    WHEN GRADE = 'S' THEN SAL * 0.2
    WHEN GRADE = 'A' THEN SAL * 0.15
    WHEN GRADE = 'B' THEN SAL * 0.1
    ELSE 0
END AS BONUS
```

### CASE 표현식 활용

`CASE`는 조건에 따라 다른 값을 반환하는 표현식이다.

```sql
CASE
    WHEN 조건 THEN 결과
    ELSE 결과
END
```

이번 문제에서는 `AVG(G.SCORE)`를 기준으로 평가 등급을 결정하고, `GRADE`를 기준으로 성과금을 계산하는 데 사용했다.

### 풀이

[30번 문제 풀이 보기](./solve/30_employee_grade_bonus.sql)

---
---

### [31. 업그레이드 불가능한 아이템 조회]

### ITEM_INFO 테이블

| 컬럼명         | 타입         | NULL 허용 | 설명      |
| ----------- | ---------- | ------- | ------- |
| `ITEM_ID`   | INTEGER    | ❌       | 아이템 ID  |
| `ITEM_NAME` | VARCHAR(N) | ❌       | 아이템 이름  |
| `RARITY`    | INTEGER    | ❌       | 아이템 희귀도 |
| `PRICE`     | INTEGER    | ❌       | 아이템 가격  |

### ITEM_TREE 테이블

| 컬럼명              | 타입      | NULL 허용 | 설명        |
| ---------------- | ------- | ------- | --------- |
| `ITEM_ID`        | INTEGER | ❌       | 아이템 ID    |
| `PARENT_ITEM_ID` | INTEGER | ⭕       | 부모 아이템 ID |

## 문제

아이템들은 `PARENT_ITEM_ID`를 기준으로 업그레이드 관계를 가지고 있습니다.

더 이상 업그레이드할 수 없는 아이템의 `ITEM_ID`, `ITEM_NAME`, `RARITY`를 조회하고, 아이템 ID를 기준으로 내림차순 정렬합니다.

* 더 이상 업그레이드할 수 없는 아이템은 다른 아이템의 `PARENT_ITEM_ID`로 등장하지 않는 아이템
* `ITEM_ID`를 기준으로 아이템 정보를 조회
* `ITEM_ID` 기준 내림차순 정렬

### 핵심 로직

* `ITEM_INFO`와 `ITEM_TREE`를 `ITEM_ID` 기준으로 조인하여 아이템의 이름과 희귀도 정보를 가져옴
* 서브쿼리에서 `PARENT_ITEM_ID`가 `NULL`이 아닌 값만 조회
* 다른 아이템의 `PARENT_ITEM_ID`로 등장하는 `ITEM_ID`를 제외
* 결과적으로 **자식 아이템이 존재하지 않는 아이템**, 즉 더 이상 업그레이드할 수 없는 아이템만 남김
* `ORDER BY I.ITEM_ID DESC`를 사용하여 아이템 ID 기준 내림차순 정렬

### 서브쿼리 핵심

```sql
WHERE T.ITEM_ID NOT IN (
    SELECT PARENT_ITEM_ID
    FROM ITEM_TREE
    WHERE PARENT_ITEM_ID IS NOT NULL
)
```

서브쿼리는 **다른 아이템의 부모로 사용되고 있는 아이템 ID**를 찾는다.

예를 들어:

```text
ITEM_A → ITEM_B → ITEM_C
```

라면 `ITEM_B`와 `ITEM_A`는 다른 아이템의 `PARENT_ITEM_ID`로 등장한다.

반면 `ITEM_C`는 어떤 아이템의 부모도 아니므로 `PARENT_ITEM_ID` 목록에 등장하지 않는다.

따라서 `NOT IN`을 사용하여 부모 아이템으로 등장하지 않는 아이템만 남기면 **더 이상 업그레이드할 수 없는 아이템**을 찾을 수 있다.

`PARENT_ITEM_ID IS NOT NULL` 조건은 `NULL`을 `NOT IN` 대상에서 제외하기 위해 사용한다.

### 풀이

[31번 문제 풀이 보기](./solve/31_non_upgradeable_items.sql)
