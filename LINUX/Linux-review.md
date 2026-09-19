# Linux 복습 문제 풀이

## 문제

현재 위치가 **홈 디렉터리 `~`**라고 가정한다.

다음 구조를 만들어라.

```text
~/
└── Linux-review/
    ├── work/
    │   └── memo.txt
    └── backup/
        └── memo.txt
```

### 조건

1. `Linux-review` 디렉터리를 만든다.
2. 그 안에 `work`, `backup` 디렉터리를 만든다.
3. `work` 안에 `memo.txt`를 만든다.
4. `memo.txt`에 다음 내용을 넣는다.

```text
Linux Practice
```

5. `cat`으로 내용을 확인한다.
6. `memo.txt`를 `backup`으로 복사한다.
7. `work`와 `backup`에 `memo.txt`가 각각 존재하는지 `ls`로 확인한다.
8. 마지막으로 `backup/memo.txt`의 내용을 `cat`으로 확인한다.

---

## 풀이

### 1. Linux-review 디렉터리 생성

```bash
mkdir Linux-review
cd Linux-review
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

### 3. work에서 memo.txt 생성 및 내용 작성

```bash
cd work
echo "Linux Practice" > memo.txt
```

```bash
ls
```

```text
memo.txt
```

### 4. 파일 내용 확인

```bash
cat memo.txt
```

```text
Linux Practice
```

### 5. Linux-review로 이동 후 파일 복사

```bash
cd ..
cp work/memo.txt backup
```

### 6. backup에 파일이 복사됐는지 확인

```bash
cd backup
ls
```

```text
memo.txt
```

### 7. 복사된 파일 내용 확인

```bash
cd ..
cat backup/memo.txt
```

```text
Linux Practice
```

## 최종 결과

```text
Linux-review/
├── backup/
│   └── memo.txt
└── work/
    └── memo.txt
```

`cp`를 사용했기 때문에 `work/memo.txt`는 그대로 남아 있고, `backup/memo.txt`가 복사본으로 생성되었다.
