# Linux 복습 문제 풀이

## 문제

현재 위치는 홈 디렉터리 `~`이다.

다음 과정을 수행한다.

1. `Linux-test` 디렉터리를 만든다.
2. 그 안에 `work`, `backup` 디렉터리를 만든다.
3. `work` 안에 `test.txt`를 만들고 `Linux Test`를 작성한다.
4. `test.txt`를 `final.txt`로 이름 변경한다.
5. `final.txt`를 `backup`으로 복사한다.
6. `work`의 `final.txt`를 삭제한다.
7. `work`에 다시 `final.txt`를 만들고 `Linux New Test`를 작성한다.
8. `work/final.txt`와 `backup/final.txt`의 내용이 서로 다른지 확인한다.

최종 구조:

```text
Linux-test/
├── work/
│   └── final.txt
└── backup/
    └── final.txt
```

---

## 풀이

### 1. Linux-test 디렉터리 생성

```bash
mkdir Linux-test
cd Linux-test
```

### 2. work와 backup 디렉터리 생성

```bash
mkdir work
mkdir backup
```

```bash
ls
```

```text
backup  work
```

### 3. test.txt 생성 및 내용 작성

처음에는 현재 위치에 `test.txt`를 만들었다.

```bash
echo "Linux Test" > test.txt
```

이후 잘못된 위치에 생성한 파일을 삭제했다.

```bash
rm test.txt
```

`work` 디렉터리에 다시 생성:

```bash
echo "Linux Test" > work/test.txt
```

확인:

```bash
cd work
ls
```

```text
test.txt
```

내용 확인:

```bash
cat test.txt
```

```text
Linux Test
```

### 4. test.txt → final.txt 이름 변경

```bash
mv test.txt final.txt
```

확인:

```bash
ls
```

```text
final.txt
```

### 5. final.txt를 backup으로 복사

`Linux-test` 디렉터리로 이동한 후 복사했다.

```bash
cd ..
cp work/final.txt backup
```

### 6. work의 final.txt 삭제

```bash
rm work/final.txt
```

### 7. 새로운 final.txt 생성

`work`로 이동한 후 새로운 내용을 작성했다.

```bash
cd work
echo "Linux New Test" > final.txt
```

내용 확인:

```bash
cat final.txt
```

```text
Linux New Test
```

### 8. 최종 결과

```text
Linux-test/
├── backup/
│   └── final.txt
└── work/
    └── final.txt
```

파일 내용:

```text
work/final.txt
→ Linux New Test

backup/final.txt
→ Linux Test
```

## 핵심 로직

* `mv test.txt final.txt` → 파일 이름 변경
* `cp work/final.txt backup` → 파일 복사
* `rm work/final.txt` → 원본 파일 삭제
* `echo "Linux New Test" > final.txt` → 삭제한 파일을 새로운 내용으로 다시 생성
* `cp`로 복사한 파일은 원본과 독립적으로 존재하므로, 이후 `work/final.txt`의 내용을 변경해도 `backup/final.txt`에는 기존 내용이 유지된다.
