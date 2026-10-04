# Linux 복습 문제

## 1. 디렉터리 생성

### 문제

다음 디렉터리 구조를 생성한다.

```text
Linux-final/
└── work/
```

### 사용한 명령어

```bash
mkdir -p Linux-final/work
```

### 핵심 로직

`mkdir`은 디렉터리를 생성하는 명령어이다.

`-p` 옵션을 사용하면 상위 디렉터리가 존재하지 않아도 필요한 디렉터리를 한 번에 생성할 수 있다.

```text
mkdir -p Linux-final/work
```

→ `Linux-final`을 만들고 그 안에 `work`까지 생성한다.

---

## 2. 파일 생성

### 문제

`work` 디렉터리 안에 `java.txt` 파일을 생성한다.

### 사용한 명령어

```bash
touch java.txt
```

### 핵심 로직

`touch`는 파일의 생성 및 수정 시간 등을 갱신하며, 파일이 존재하지 않는 경우 빈 파일을 생성한다.

---

## 3. 출력 리다이렉션

### 문제

`java.txt`에 다음 내용을 저장한다.

```text
Java
Object
Inheritance
```

### 사용한 명령어

```bash
cat > java.txt
```

입력:

```text
Java
Object
Inheritance
```

### 확인

```bash
cat java.txt
```

### 핵심 로직

`>`는 표준 출력을 파일로 리다이렉션한다.

```text
cat > java.txt
```

→ 입력한 내용을 `java.txt`에 저장한다.

**주의:** `>`는 기존 파일 내용이 있으면 덮어쓴다.

---

## 4. 추가 리다이렉션

### 문제

기존 `java.txt`의 내용은 유지하면서 마지막에 `Constructor`를 추가한다.

### 사용한 명령어

```bash
echo "Constructor" >> java.txt
```

### 확인

```bash
cat java.txt
```

결과:

```text
Java
Object
Inheritance
Constructor
```

### 핵심 로직

`>>`는 기존 파일의 내용을 유지하면서 파일 끝에 내용을 추가한다.

```text
>   → 기존 내용 덮어쓰기
>>  → 기존 내용 유지 + 뒤에 추가
```

---

## 5. 디렉터리 생성 및 파일 복사

### 문제

다음 구조를 만든다.

```text
Linux-final/
├── backup/
└── work/
    └── java.txt
```

그리고 `work/java.txt`를 `backup`으로 복사한다.

### 사용한 명령어

```bash
cd ..
mkdir backup
cp work/java.txt backup
```

### 결과

```text
Linux-final/
├── backup/
│   └── java.txt
└── work/
    └── java.txt
```

### 핵심 로직

`cp`는 파일이나 디렉터리를 복사한다.

```bash
cp 원본 목적지
```

```bash
cp work/java.txt backup
```

→ `work/java.txt`를 `backup` 디렉터리로 복사한다.

---

## 6. 파일 이름 변경

### 문제

`backup/java.txt`의 이름을 `java-backup.txt`로 변경한다.

### 사용한 명령어

```bash
cd backup
mv java.txt java-backup.txt
```

### 확인

```bash
ls
```

결과:

```text
java-backup.txt
```

### 핵심 로직

`mv`는 파일이나 디렉터리를 이동하거나 이름을 변경한다.

같은 디렉터리에서

```bash
mv 기존이름 새이름
```

을 사용하면 **이름 변경**이 된다.

---

## 7. 상대경로

### 문제

현재 위치가:

```text
Linux-final/backup
```

일 때 다음 파일의 상대경로를 구한다.

```text
Linux-final/work/java.txt
```

### 정답

```text
../work/java.txt
```

### 핵심 로직

현재 위치:

```text
Linux-final/backup
```

에서

```text
.. 
```

은 부모 디렉터리인 `Linux-final`을 의미한다.

따라서:

```text
..                → Linux-final
../work           → Linux-final/work
../work/java.txt  → Linux-final/work/java.txt
```

---

## 8. find를 이용한 파일 검색

### 문제

`Linux-final` 아래에 있는 모든 `.txt` 파일을 찾는다.

현재 위치:

```text
Linux-final/work
```

### 정답

```bash
find .. -name "*.txt"
```

### 핵심 로직

`find`는 지정한 위치부터 파일과 디렉터리를 검색한다.

```bash
find 검색할위치 -name "검색조건"
```

현재 위치가 `Linux-final/work`이므로:

```text
.. → Linux-final
```

따라서:

```bash
find .. -name "*.txt"
```

는 `Linux-final` 아래의 모든 `.txt` 파일을 검색한다.

### `find *.txt`와 다른 이유

```bash
find *.txt
```

에서 `*.txt`는 `find`가 처리하기 전에 **셸이 먼저 확장**한다.

반면:

```bash
find .. -name "*.txt"
```

에서는 `find`에게 `.txt`라는 이름 패턴을 전달하므로 하위 디렉터리까지 검색할 수 있다.

---

# 핵심 명령어 정리

| 명령어        | 역할                |
| ---------- | ----------------- |
| `mkdir`    | 디렉터리 생성           |
| `mkdir -p` | 필요한 상위 디렉터리까지 생성  |
| `touch`    | 파일 생성             |
| `cat`      | 파일 내용 출력          |
| `>`        | 기존 내용 덮어쓰기        |
| `>>`       | 기존 내용 뒤에 추가       |
| `cp`       | 복사                |
| `mv`       | 이동 / 이름 변경        |
| `find`     | 파일 및 디렉터리 검색      |
| `..`       | 부모 디렉터리           |
| `.`        | 현재 디렉터리           |
| `*`        | 여러 문자에 대응하는 와일드카드 |

# 실습에서 사용한 최종 구조

```text
Linux-final/
├── backup/
│   └── java-backup.txt
└── work/
    └── java.txt
```
