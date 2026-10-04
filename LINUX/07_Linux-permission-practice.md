# Linux 권한 실습 01

## 문제

현재 위치가 `~`이라고 가정한다.

### 목표

`Linux-permission-practice` 디렉터리를 만들고, 그 안에 `test.txt` 파일을 생성한다.

`test.txt`의 내용:

    hello world

그 후 파일의 권한을 확인하고, **소유자(Owner)의 쓰기(`w`) 권한만 제거**한다.

---

## 1. 디렉터리 생성 및 이동

### 디렉터리를 생성한다.

    mkdir Linux-permission-practice

### 생성한 디렉터리로 이동한다.

    cd Linux-permission-practice

---

## 2. 파일 생성 및 내용 작성

### `test.txt` 파일에 내용을 작성한다.

    echo "hello world" > test.txt

### 파일이 생성되었는지 확인한다.

    ls

결과:

    test.txt

### 파일 내용을 확인한다.

    cat test.txt

결과:

    hello world

---

## 3. 파일 권한 확인

### `ls -l`로 파일의 상세 정보를 확인한다.

    ls -l

결과:

    -rw-r--r--  1 kanghanbin  staff  12 10월 4 22:54 test.txt

권한 부분:

    rw- r-- r--
    │   │   │
    │   │   └── Others
    │   └────── Group
    └────────── Owner

### 권한의 의미

- `rw-` → Owner: 읽기(`r`) + 쓰기(`w`)
- `r--` → Group: 읽기(`r`)
- `r--` → Others: 읽기(`r`)

---

## 4. Owner의 쓰기 권한 제거

### `chmod`를 사용하여 Owner의 `w` 권한을 제거한다.

    chmod u-w test.txt

### 의미

    chmod u-w test.txt
          │ │
          │ └── write 권한 제거
          └──── user(Owner)

즉,

> `test.txt`의 Owner에게서 쓰기(`w`) 권한을 제거한다.

---

## 5. 변경된 권한 확인

### 다시 권한을 확인한다.

    ls -l

결과:

    -r--r--r--  1 kanghanbin  staff  12 10월 4 22:54 test.txt

기존 권한:

    rw- r-- r--

변경 후:

    r-- r-- r--

### 변경된 부분

    rw-
     ↓
    r--

Owner의 `w` 권한만 제거되었다.

---

## 핵심 로직

### chmod 기본 구조

    chmod [대상][연산자][권한] 파일명

이번 실습:

    chmod u-w test.txt

### 각 기호의 의미

- `u` → user, Owner
- `-` → 권한 제거
- `w` → write, 쓰기 권한

따라서:

    u-w

는

> Owner의 쓰기 권한을 제거한다.

라는 의미이다.

---

## `-`와 `=`의 차이

### `-`

    chmod u-w test.txt

기존 권한에서 `w`만 제거한다.

예:

    rw-
     ↓
    r--

### `=`

    chmod u=w test.txt

Owner의 권한을 `w`만 남도록 설정한다.

예:

    rw-
     ↓
    -w-

따라서 **기존 권한에서 특정 권한만 추가하거나 제거할 때는 `+`, `-`를 사용한다.**

---

## 최종 상태

    Linux-permission-practice/
    └── test.txt

파일 내용:

    hello world

파일 권한:

    r-- r-- r--

Owner:

    r--

Group:

    r--

Others:

    r--