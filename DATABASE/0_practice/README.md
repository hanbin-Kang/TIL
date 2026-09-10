# SQL Practice

## 01. 음식 종류별 즐겨찾기수가 가장 많은 식당

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
