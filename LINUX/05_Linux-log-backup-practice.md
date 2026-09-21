# Linux 로그 및 백업 파일 실습

## 문제

현재 위치가 `~`일 때 다음 작업을 수행한다.

1. `project/logs/access.log`에 다음 4줄을 저장한다.

```text
INFO start
ERROR disk
INFO ready
ERROR timeout
```

2. `ERROR`가 포함된 줄만 별도 파일로 저장한다.

```text
backup/errors.txt
```

3. 설정 파일을 다른 이름으로 백업한다.

```text
project/config/app.conf
→ backup/app-final.conf
```

4. 원본 설정 파일과 로그 파일은 유지하고, `backup`에 결과 파일 2개를 생성한다.

---

## 풀이

### 1. 프로젝트 디렉터리와 설정 디렉터리 생성

먼저 `Linux-lab`을 만들고 프로젝트의 설정 파일을 저장할 `project/config` 디렉터리를 생성한다.

```bash
mkdir Linux-lab
cd Linux-lab

mkdir -p project/config
```

`mkdir -p`를 사용하면 필요한 상위 디렉터리까지 한 번에 생성할 수 있다.

---

### 2. 설정 파일 생성 및 내용 작성

`project/config`로 이동하여 `app.conf`를 생성한다.

```bash
cd project
cd config

echo "mode=dev" > app.conf
echo "port=8080" >> app.conf
echo "debug=true" >> app.conf

cat app.conf
```

첫 번째 줄은 `>`를 사용하여 파일을 생성하고, 이후 내용은 `>>`를 사용하여 기존 내용에 추가한다.

---

### 3. 로그 디렉터리 생성

`project` 아래에 로그를 저장할 `logs` 디렉터리를 만든다.

```bash
cd ..
mkdir logs
```

이후 `Linux-lab/project/logs`에서 로그 파일을 작업한다.

---

### 4. 로그 파일 생성

`access.log`에 문제에서 주어진 4줄을 저장한다.

```bash
cd project/logs

echo "INFO start" > access.log
echo "ERROR disk" >> access.log
echo "INFO ready" >> access.log
echo "ERROR timeout" >> access.log

cat access.log
```

처음에는 `>`로 파일을 생성하고, 나머지 줄은 `>>`로 이어서 추가한다.

---

### 5. 백업 디렉터리 생성 및 ERROR 로그 추출

`Linux-lab`으로 돌아와 `backup` 디렉터리를 만든다.

```bash
cd ~/Linux-lab
mkdir backup
```

그 후 `access.log`에서 `ERROR`가 포함된 줄만 `grep`으로 검색하여 `errors.txt`에 저장한다.

```bash
cd project/logs

grep "ERROR" access.log > ~/Linux-lab/backup/errors.txt
```

`grep`은 파일의 **내용을 검색**하고, `>`를 사용하여 검색 결과를 `errors.txt`에 저장한다.

---

### 6. ERROR 로그 확인

```bash
cd ~/Linux-lab/backup
cat errors.txt
```

결과:

```text
ERROR disk
ERROR timeout
```

원본 `access.log`는 그대로 유지된다.

---

### 7. 설정 파일 백업

원본 `app.conf`를 `backup` 디렉터리로 복사한다.

```bash
cd ~/Linux-lab

cp project/config/app.conf backup
```

복사한 파일은 `backup/app.conf`가 된다.

---

### 8. 백업 파일 이름 변경

백업한 설정 파일의 이름을 문제에서 요구한 `app-final.conf`로 변경한다.

```bash
mv backup/app.conf backup/app-final.conf
```

`mv`는 파일을 이동할 때뿐만 아니라 같은 디렉터리 안에서 **파일 이름을 변경할 때도** 사용할 수 있다.

---

## 최종 결과

```text
Linux-lab/
├── backup/
│   ├── app-final.conf
│   └── errors.txt
└── project/
    ├── config/
    │   └── app.conf
    └── logs/
        └── access.log
```

### `backup/errors.txt`

```text
ERROR disk
ERROR timeout
```

### `backup/app-final.conf`

```text
mode=dev
port=8080
debug=true
```

원본 파일도 유지된다.

```text
project/config/app.conf
project/logs/access.log
```

## 핵심 로직

* `mkdir -p` : 필요한 상위 디렉터리까지 한 번에 생성
* `>` : 파일을 새로 만들거나 기존 내용을 덮어쓰기
* `>>` : 기존 파일 내용에 추가
* `cat` : 파일 내용 확인
* `grep` : 파일 내용에서 조건에 맞는 줄 검색
* `cp` : 원본 파일을 유지하면서 복사
* `mv` : 파일 이동 및 이름 변경
* `cd ..` : 부모 디렉터리로 이동

**핵심 흐름:**

`로그 파일 생성 → grep으로 ERROR 검색 → errors.txt 저장 → 설정 파일 복사 → 백업 파일 이름 변경`

특히 이번 실습에서는 **`grep` + `>`를 이용해 로그에서 필요한 줄만 별도 파일로 저장하는 과정**과 **`cp` 후 `mv`를 이용한 백업 파일 생성**이 핵심이다.
