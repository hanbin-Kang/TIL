# Linux Practice

## 문제

현재 위치가 `~`일 때 다음 작업을 수행한다.

1. `Linux-practice` 디렉터리를 생성한다.
2. `work`, `backup` 디렉터리를 생성한다.
3. `work` 안에 `practice.txt`를 생성하고 `Linux Practice 2026`을 입력한다.
4. `practice.txt`를 `final.txt`로 이름을 변경한다.
5. `final.txt`를 `backup` 디렉터리에 복사한다.
6. `work/final.txt`의 내용을 `Linux Final Practice`로 변경한다.
7. 두 파일의 내용을 확인한다.
8. 작업 과정에서 `..`을 사용한다.

---

## 풀이

### 1. 디렉터리 생성 및 작업 공간 구성

먼저 전체 작업을 위한 `Linux-practice` 디렉터리를 만들고, 그 안에 작업 공간인 `work`와 백업 공간인 `backup`을 만든다.

```bash
mkdir Linux-practice
cd Linux-practice

mkdir work
mkdir backup
ls
```

`work`에서는 원본 파일을 작업하고, `backup`에서는 복사한 파일을 보관한다.

---

### 2. 파일 생성 및 내용 작성

`work` 디렉터리로 이동한 뒤 `echo`와 `>`를 사용하여 파일을 생성하고 내용을 작성한다.

```bash
cd work
echo "Linux Practice 2026" > practice.txt
```

`>`는 지정한 파일에 내용을 작성하며, 파일이 없으면 새로 생성한다.

---

### 3. 파일 이름 변경

문제에서 요구한 최종 파일 이름이 `final.txt`이므로 `practice.txt`의 이름을 변경한다.

```bash
mv practice.txt final.txt
ls
```

`mv`는 파일을 다른 위치로 이동할 때뿐만 아니라 같은 디렉터리 안에서 파일 이름을 변경할 때도 사용할 수 있다.

---

### 4. 파일 백업

이제 완성된 `final.txt`를 `backup` 디렉터리에 복사한다.

```bash
cd ..
cp work/final.txt backup
```

`cd ..`을 사용하여 `Linux-practice`로 이동한 뒤, `work/final.txt`를 `backup`으로 복사한다.

이렇게 하면 `work`의 원본과 `backup`의 복사본이 각각 존재하게 된다.

---

### 5. 원본 파일 수정

백업을 완료했으므로 다시 `work`로 이동하여 원본 파일의 내용을 변경한다.

```bash
cd work
echo "Linux Final Practice" > final.txt
cat final.txt
```

`>`를 사용했기 때문에 기존 `Linux Practice 2026` 내용은 지워지고 `Linux Final Practice`로 덮어쓰기된다.

---

### 6. 백업 파일 확인

마지막으로 `backup`으로 이동하여 복사해 둔 파일의 내용을 확인한다.

```bash
cd ..
cd backup
cat final.txt
```

백업 파일에는 복사 당시의 내용인 `Linux Practice 2026`이 그대로 남아 있는 것을 확인할 수 있다.

---

## 실행 결과

### `work/final.txt`

```text
Linux Final Practice
```

### `backup/final.txt`

```text
Linux Practice 2026
```

## 최종 구조

```text
Linux-practice/
├── work/
│   └── final.txt
└── backup/
    └── final.txt
```

## 핵심 로직

* `mkdir` : 디렉터리 생성
* `cd` : 현재 위치 이동
* `echo "내용" > 파일` : 파일에 내용 작성
* `mv` : 파일 이름 변경
* `cp` : 파일 복사
* `cd ..` : 부모 디렉터리로 이동
* `cat` : 파일 내용 확인

**핵심 흐름:**
`파일 생성 → 이름 변경 → 백업 → 원본 수정 → 백업 확인`

백업을 먼저 만든 후 원본을 수정했기 때문에 `work/final.txt`와 `backup/final.txt`의 내용이 서로 다르게 유지된다.
