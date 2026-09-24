# Linux 파일 및 로그 관리 종합 실습

## 1. 문제

현재 위치가 `~`일 때 `Linux-advancd` 디렉터리를 생성하고 다음 구조를 만든다.

```text
Linux-advancd/
├── project/
│   ├── config/
│   │   └── app.conf
│   └── logs/
│       └── access.log
└── backup/
    ├── app-final.conf
    └── errors.txt
```

### 조건

- `project/config`, `project/logs`, `backup` 디렉터리를 생성한다.
- `app.conf`에 다음 내용을 작성한다.

```text
mode=dev
port=8080
debug=true
```

- `access.log`에 다음 내용을 작성한다.

```text
INFO start
ERROR disk
INFO connection
ERROR timeout
INFO ready
ERROR memory
```

- `grep`을 사용하여 `ERROR`가 포함된 줄만 `backup/errors.txt`에 저장한다.
- `app.conf`를 `backup`에 복사한다.
- 복사한 파일의 이름을 `app-final.conf`로 변경한다.
- 원본 `app.conf`에서 `debug=true`를 제거한다.
- 백업 파일 `app-final.conf`에는 `debug=true`가 그대로 남아 있어야 한다.
- `mkdir -p`, `>`, `>>`, `grep`, `cp`, `mv`, `cd ..`, `cat`, `tree`를 사용한다.

---

## 2. 풀이

### 디렉터리 생성

프로젝트의 기본 디렉터리를 생성하고 `config`, `logs` 디렉터리를 만든다.

```bash
mkdir -p Linux-advancd/project
cd Linux-advancd
cd project
cd ..
cd project
mkdir config logs
ls
```

### 설정 파일 생성

`config` 디렉터리에서 `app.conf`를 생성한다.

처음 파일명을 `app.comf`로 잘못 입력했기 때문에 `mv`를 사용하여 `app.conf`로 수정했다.

```bash
echo "mode=dev" > config/app.comf
cd config
ls

echo "port=8080" >> app.comf
echo "debug=true" >> app.comf

mv app.comf app.conf
ls
```

파일 내용을 확인한다.

```bash
cat app.conf
```

```text
mode=dev
port=8080
debug=true
```

### 로그 파일 생성

`project/logs`에 `access.log`를 생성하고 로그 내용을 작성한다.

```bash
cd ..
echo "INFO start" > logs/access.log
echo "ERROR disk" >> logs/access.log
echo "INFO connection" >> logs/access.log
echo "ERROR timeout" >> logs/access.log
echo "INFO ready" >> logs/access.log
echo "ERROR memory" >> logs/access.log
```

### 백업 디렉터리 생성

`project`에서 상위 디렉터리로 이동한 뒤 `backup` 디렉터리를 생성한다.

```bash
cd ..
mkdir backup
tree
```

### ERROR 로그 추출

`access.log`에서 `ERROR`가 포함된 줄을 검색한다.

```bash
cd project/logs
grep "ERROR" access.log
```

결과:

```text
ERROR disk
ERROR timeout
ERROR memory
```

처음에는 현재 위치가 `project/logs`인 상태에서 다음과 같이 입력하여 오류가 발생했다.

```bash
grep "ERROR" access.log > backup/errors.txt
```

현재 위치에서 `backup` 디렉터리를 찾기 때문에 `backup/errors.txt`를 찾을 수 없었다.

상위 디렉터리로 두 번 이동한 후 올바른 경로를 사용하여 저장했다.

```bash
cd ..
cd ..
grep "ERROR" project/logs/access.log > backup/errors.txt
```

확인:

```bash
cat backup/errors.txt
```

```text
ERROR disk
ERROR timeout
ERROR memory
```

### 설정 파일 백업

원본 `app.conf`를 `backup` 디렉터리에 복사한다.

```bash
cp project/config/app.conf backup
```

확인:

```bash
tree
```

### 백업 파일 이름 변경

처음에는 다음과 같이 입력하여 `app-final.conf`를 현재 디렉터리로 이동시켰다.

```bash
mv backup/app.conf app-final.conf
```

이후 다시 `backup` 디렉터리로 이동시켰다.

```bash
mv app-final.conf backup
```

처음부터 정확하게 작성하면 다음과 같이 한 번에 처리할 수 있다.

```bash
mv backup/app.conf backup/app-final.conf
```

### 원본 app.conf 수정

원본 `app.conf`에서 `debug=true`를 제거한다.

```bash
cat project/config/app.conf
```

기존 내용:

```text
mode=dev
port=8080
debug=true
```

`>`로 기존 내용을 덮어쓴 뒤 `>>`로 두 번째 줄을 추가한다.

```bash
cd project/config
echo "mode=dev" > app.conf
echo "port=8080" >> app.conf
cat app.conf
```

결과:

```text
mode=dev
port=8080
```

### 백업 파일 확인

원본 파일을 수정한 뒤 백업 파일의 내용이 그대로 유지되는지 확인한다.

```bash
cd ~
cd Linux-advancd
cat backup/app-final.conf
```

결과:

```text
mode=dev
port=8080
debug=true
```

---

## 3. 최종 결과

```bash
tree
```

```text
.
├── backup
│   ├── app-final.conf
│   └── errors.txt
└── project
    ├── config
    │   └── app.conf
    └── logs
        └── access.log
```

### `project/config/app.conf`

```text
mode=dev
port=8080
```

### `backup/app-final.conf`

```text
mode=dev
port=8080
debug=true
```

### `backup/errors.txt`

```text
ERROR disk
ERROR timeout
ERROR memory
```

### `project/logs/access.log`

```text
INFO start
ERROR disk
INFO connection
ERROR timeout
INFO ready
ERROR memory
```

---

## 4. 핵심 로직

### 디렉터리 생성

```bash
mkdir -p Linux-advancd/project
mkdir config logs
mkdir backup
```

`mkdir -p`로 프로젝트 디렉터리를 생성하고 필요한 하위 디렉터리를 구성했다.

### 파일 생성 및 내용 추가

```bash
echo "mode=dev" > app.conf
echo "port=8080" >> app.conf
echo "debug=true" >> app.conf
```

`>`는 파일을 새로 작성하거나 기존 내용을 덮어쓰고, `>>`는 기존 내용 뒤에 내용을 추가한다.

### ERROR 로그 추출

```bash
grep "ERROR" project/logs/access.log > backup/errors.txt
```

`grep`으로 `ERROR`가 포함된 줄만 검색하고 `>`를 사용하여 `errors.txt`에 저장했다.

### 파일 복사 및 이름 변경

```bash
cp project/config/app.conf backup
mv backup/app.conf backup/app-final.conf
```

`cp`로 원본 파일을 백업한 후 `mv`로 백업 파일의 이름을 변경했다.

### 원본 파일 수정

```bash
echo "mode=dev" > app.conf
echo "port=8080" >> app.conf
```

원본 `app.conf`를 다시 작성하여 `debug=true`를 제거했다.

백업 파일은 별도로 수정하지 않았기 때문에 `debug=true`가 그대로 유지되었다.

### 전체 작업 흐름

```text
디렉터리 생성
    ↓
app.conf 생성
    ↓
access.log 생성
    ↓
grep으로 ERROR 로그 추출
    ↓
app.conf 백업
    ↓
백업 파일 이름 변경
    ↓
원본 app.conf 수정
    ↓
tree와 cat으로 최종 확인
```