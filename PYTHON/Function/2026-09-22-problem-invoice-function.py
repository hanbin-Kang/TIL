# ==========================================================================================      
# ■ 문제 요약
# 사용자 입력에서 기본가(`base`), 임의 개수의 품목 금액(`items`), 세율(`tax`), 추가 비용(`fees`)을 분리하여
# `invoice` 함수에 전달하고, 기본가 + 품목 금액 합계 + 세금 + 추가 비용 합계를 계산하여 총액을 반환한다.
# 함수는 `base → *items → tax=0 → **fees` 순서로 정의하며,
# `tax`는 키워드 전용 인자, `fees`는 가변 키워드 인자로 처리한다.
# ==========================================================================================      
# ■ 알고리즘
# 1. 입력값을 공백 기준으로 분리하여 `raw`에 저장한다.
# 2. "="이 없는 값만 추려 기본가와 품목 금액으로 구분한다.
#    - 첫 번째 값 → `base`
#    - 나머지 값 → `items`
# 3. 입력값 중 "="이 포함된 값을 순회하면서 키와 값을 분리한다.
# 4. 키가 "tax"이면 세율로 처리하고, 그 외의 키는 추가 비용인 `fees`에 저장한다.
# 5. `invoice` 함수에서 다음 계산식으로 총액을 반환한다.
#    - 기본가
#    - + 품목 금액의 합
#    - + 기본가에 대한 세율
#    - + 추가 비용의 합
# 6. `*items`와 `**fees`를 언패킹하여 함수에 전달하고 반환된 총액을 출력한다.
# ========================================================================================== 

# 위치: 첫째=기본가, 나머지=품목 금액. "tax=값" 은 키워드 전용 세율(%), 그 외 "key=값" 은 추가 비용(fees, 정수).
# 예: "1000 100 200 tax=10 ship=500" → base=1000, items=[100,200], tax=10, fees={ship:500}
raw = input().split()
pos = [t for t in raw if "=" not in t]
base = int(pos[0])
items = [int(x) for x in pos[1:]]
tax = 0
fees = {}
for t in raw:
    if "=" in t:
        k, v = t.split("=", 1)
        if k == "tax":
            tax = int(v)
        else:
            fees[k] = int(v)

def invoice(base, *items, tax=tax, **fees):
    '''
    Args:
        base (int) : 기본금
        items (list) : pos에서 기본금을 제외한 값들
        tax (int) : raw에서 "="이 있고, k값이 "tax"인 값 
        fees (dict) : raw에서 "="이 있고, k값이 "tax"가 아닌 값
    Returns:
        base + sum(items) + base * tax//100 + sum(fees.values())
    '''
    return base + sum(items) + base * tax//100 + sum(fees.values())
# 출력
print(invoice(base, *items, tax=tax, **fees))

# ==========================================================================================
# ■ 개선점
# 1. `invoice` 함수의 `tax` 기본값은 외부 변수인 `tax`를 참조하지 않고 `0`으로 지정하는 것이 좋다.
#    - 기존: `tax=tax`
#    - 개선: `tax=0`
#    - 함수 자체의 명세에 정의된 기본값을 그대로 표현할 수 있다.
#
# 2. `*items`는 함수 내부에서 튜플로 전달되므로 주석의 자료형을 `list`에서 `tuple`로 수정한다.
#
# 3. 세금 계산식은 `(base * tax) // 100`처럼 괄호를 사용하면
#    계산 의도를 명확하게 표현할 수 있다.
#
# 4. 함수는 입력값을 직접 처리하지 않고 계산만 담당하도록 분리되어 있다.
#    입력 파싱과 실제 계산 로직을 분리하면 함수의 재사용성이 높아진다.
#
# 5. `fees`는 `**fees`로 전달되므로 함수 내부에서는 딕셔너리 형태이며,
#    `fees.values()`를 사용하여 모든 추가 비용의 합을 계산한다.

# ==========================================================================================
# ■ AI 추천 코드 

raw = input().split()
pos = [t for t in raw if "=" not in t]
base = int(pos[0])
items = [int(x) for x in pos[1:]]
tax = 0
fees = {}
for t in raw:
    if "=" in t:
        k, v = t.split("=", 1)
        if k == "tax":
            tax = int(v)
        else:
            fees[k] = int(v)


def invoice(base, *items, tax=0, **fees):  # 기본값은 외부 변수 참조 대신 명세대로 0으로 고정
    '''
    Args:
        base (int) : 기본금
        items (tuple) : pos에서 기본금을 제외한 값들  # *args는 tuple로 전달됨
        tax (int) : raw에서 "="이 있고, k값이 "tax"인 값
        fees (dict) : raw에서 "="이 있고, k값이 "tax"가 아닌 값
    Returns:
        base + sum(items) + base * tax//100 + sum(fees.values())
    '''
    return base + sum(items) + (base * tax) // 100 + sum(fees.values())  # 괄호로 우선순위 명시
# 출력
print(invoice(base, *items, tax=tax, **fees))