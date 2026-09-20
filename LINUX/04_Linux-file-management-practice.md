# Linux File Management Practice

## 문제

현재 위치가 `~`일 때 다음 작업을 수행한다.

1. `Linux-final` 디렉터리를 만든다.
2. `work`, `backup` 디렉터리를 만든다.
3. `work`에 `java.txt`를 만들고 `Java Practice`를 작성한다.
4. `work`에 `python.txt`를 만들고 `Python Practice`를 작성한다.
5. 두 파일을 `backup`에 복사한다.
6. `work/java.txt`의 내용을 `Java Final Practice`로 변경한다.
7. `work/python.txt`를 `python-final.txt`로 이름 변경한다.
8. 변경된 `python-final.txt`를 `backup`에 복사한다.
9. `work`와 `backup`의 파일과 내용을 확인한다.
10. 작업 과정에서 `..`을 사용한다.

---

## 풀이

### 1. 디렉터리 생성

먼저 전체 작업 공간인 `Linux-final`을 만들고, 그 안에 원본 파일을 작업할 `work`와 복사본을 보관할 `backup`을 만든다.

```bash
mkdir Linux-final
mkdir Linux-final/work
mkdir Linux-final/backup
```

---

### 2. 작업 디렉터리에서 파일 생성 및 내용 작성

`work`로 이동한 뒤 `echo`와 `>`를 사용하여 두 파일을 생성하고 각각 내용을 작성한다.

```bash
cd Linux-final
cd work

echo "Java Practice" > java.txt
echo "Python Practice" > python.txt
```

---

### 3. 파일 백업

`work`에서 만든 두 파일을 `backup`으로 복사한다.

```bash
cd ..

cp work/java.txt backup
cp work/python.txt backup
```

`cd ..`을 사용하여 `Linux-final`로 이동한 뒤 상대경로를 이용해 `work`의 파일을 `backup`으로 복사한다.

---

### 4. 원본 Java 파일 수정

다시 `work`로 이동하여 `java.txt`의 내용을 변경한다.

```bash
cd work

echo "Java Final Practice" > java.txt
```

`>`를 사용했기 때문에 기존 내용인 `Java Practice`가 `Java Final Practice`로 덮어쓰기된다.

---

### 5. Python 파일 이름 변경

`python.txt`의 이름을 `python-final.txt`로 변경한다.

```bash
mv python.txt python-final.txt
```

`mv`는 파일을 이동할 때뿐만 아니라 같은 디렉터리 안에서 파일 이름을 변경할 때도 사용할 수 있다.

---

### 6. 변경된 Python 파일 백업

이름을 변경한 `python-final.txt`를 다시 `backup`에 복사한다.

```bash
cd ..

cp work/python-final.txt backup
```

---

### 7. 파일 및 내용 확인

마지막으로 `work`와 `backup`에 원하는 파일이 있는지 확인하고 각각의 내용을 확인한다.

```bash
ls

cd work
ls
cat java.txt
cat python-final.txt

cd ..
cd backup
ls
cat java.txt
cat python-final.txt
```

---

## 실행 결과

### `work`

```text
java.txt
python-final.txt
```

```text
java.txt
→ Java Final Practice

python-final.txt
→ Python Practice
```

### `backup`

```text
java.txt
python-final.txt
```

```text
java.txt
→ Java Practice

python-final.txt
→ Python Practice
```

## 최종 구조

```text
Linux-final/
├── work/
│   ├── java.txt
│   └── python-final.txt
└── backup/
    ├── java.txt
    └── python-final.txt
```

## 핵심 로직

* `mkdir` : 디렉터리 생성
* `cd` : 현재 위치 이동
* `cd ..` : 부모 디렉터리로 이동
* `echo "내용" > 파일` : 파일 생성 및 내용 작성
* `cp` : 파일 복사
* `mv` : 파일 이름 변경
* `ls` : 파일 및 디렉터리 목록 확인
* `cat` : 파일 내용 확인

**핵심 흐름:**

`파일 생성 → 백업 → 원본 수정 → 파일 이름 변경 → 변경된 파일 백업 → 결과 확인`

처음 파일을 `backup`에 **복사(`cp`)한 후** 원본 파일을 수정했기 때문에 `work/java.txt`와 `backup/java.txt`의 내용이 서로 다르게 유지된다.
