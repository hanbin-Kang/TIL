# Linux 권한 실습 02

## 문제

현재 위치가 `~`이라고 가정한다.

### 목표

`Linux-permission-practice` 디렉터리 안에 `report.txt` 파일을 생성한다.

`report.txt`의 내용:

    Linux Permission Test

파일을 생성한 후 권한을 확인하고, `chmod`의 **숫자 방식**을 사용하여 다음 권한으로 변경한다.

    r-- --- ---

즉,

- Owner → 읽기(`r`)만 가능
- Group → 권한 없음
- Others → 권한 없음

최종 권한:

    -r--------

---

## 1. 디렉터리 생성

### `Linux-permission-practice` 디렉터리를 생성한다.

    mkdir Linux-permission-practice

---

## 2. 파일 생성 및 내용 작성

### `report.txt`에 내용을 작성한다.

    echo "Linux Permission Test" > Linux-permission-practice/report.txt

### 생성된 파일을 확인한다.

    tree

결과:

    .
    └── Linux-permission-practice
        └── report.txt

---

## 3. 파일 권한 확인

### `Linux-permission-practice` 디렉터리의 상세 정보를 확인한다.

    ls -l

결과:

    drwxr-xr-x 2 hanbin hanbin 4096 Oct 6 09:39 Linux-permission-practice

### 디렉터리 안으로 이동한다.

    cd Linux-permission-practice/

### `report.txt`의 상세 정보를 확인한다.

    ls -l

결과:

    -rw-r--r-- 1 hanbin hanbin 22 Oct 6 09:39 report.txt

기본 권한:

    rw- r-- r--
    │   │   │
    │   │   └── Others
    │   └────── Group
    └────────── Owner

---

## 4. 숫자 방식으로 권한 변경

### `report.txt`의 권한을 `400`으로 변경한다.

    chmod 400 report.txt

### `400`의 의미

    400
    │││
    ││└── Others = 0
    │└─── Group  = 0
    └──── Owner  = 4

권한 값:

    r = 4
    w = 2
    x = 1

따라서:

    4 = r--
    0 = ---
    0 = ---

결과적으로:

    400 = r-- --- ---

---

## 5. 변경된 권한 확인

### `ls -l`로 권한을 확인한다.

    ls -l

결과:

    -r-------- 1 hanbin hanbin 22 Oct 6 09:39 report.txt

권한 부분:

    r-- --- ---
    │   │   │
    │   │   └── Others
    │   └────── Group
    └────────── Owner

### 최종 권한

- Owner → `r--`
- Group → `---`
- Others → `---`

즉, **소유자만 파일 내용을 읽을 수 있는 권한**이다.

---

## 핵심 로직

### chmod 숫자 방식

`chmod`는 권한을 숫자로 지정할 수도 있다.

    chmod 숫자 파일명

이번 실습:

    chmod 400 report.txt

숫자 3자리는 다음 순서로 사용한다.

    Owner | Group | Others

예:

    4  0  0
    │  │  │
    │  │  └── Others
    │  └───── Group
    └──────── Owner

---

## 권한 숫자의 원리

각 권한에는 숫자가 지정되어 있다.

    r = 4
    w = 2
    x = 1

권한이 여러 개라면 숫자를 더한다.

    rwx
    4 + 2 + 1
    = 7

    rw-
    4 + 2
    = 6

    r-x
    4 + 1
    = 5

    r--
    4
    = 4

    -wx
    2 + 1
    = 3

    -w-
    2
    = 2

    --x
    1
    = 1

    ---
    0
    = 0

---

## 자주 사용하는 숫자 권한

    700 = rwx --- ---
    600 = rw- --- ---
    500 = r-x --- ---
    400 = r-- --- ---
    644 = rw- r-- r--
    755 = rwx r-x r-x

---

## 최종 상태

    Linux-permission-practice/
    └── report.txt

파일 내용:

    Linux Permission Test

파일 권한:

    -r--------

권한 구조:

    Owner   Group   Others
      4       0       0
     r--     ---     ---

즉,

> `400`은 Owner에게 읽기 권한만 주고, Group과 Others에게는 아무 권한도 주지 않는다.