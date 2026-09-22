# ==========================================================================================      
# ■ 문제 요약
# 상품명과 가격을 필수 인자로 받고, 추가 옵션은 가변 위치 인자(*options),
# 할인액은 키워드 전용 인자(discount), 기타 정보는 가변 키워드 인자(**info)로
# 받아 주문 정보를 정해진 형식의 문자열로 반환한다.
# 기타 정보는 키를 사전순으로 정렬한 뒤 "key=value" 형태로 출력한다.
# ==========================================================================================      
# ■ 알고리즘
# 1. 입력값을 공백 기준으로 분리한다.
# 2. "="가 없는 값들을 위치 정보로 분류한다.
#    → 첫 번째 값은 상품명, 두 번째 값은 가격, 나머지는 옵션으로 저장한다.
# 3. "="가 포함된 값은 key와 value로 분리한다.
# 4. key가 "discount"이면 할인액으로 저장하고, 그 외에는 info 딕셔너리에 저장한다.
# 5. order2()를 정의한다.
# 6. info의 항목을 key 기준 사전순으로 정렬한다.
# 7. "key=value" 형식으로 변환한 뒤 ","로 연결한다.
# 8. 상품명, 할인 적용 가격, 옵션 개수, 기타 정보를 하나의 문자열로 반환한다.
# ==========================================================================================  

# 위치: 첫째=상품, 둘째=가격, 나머지=옵션. "discount=값" 은 키워드 전용, 그 외 "key=value" 는 기타 정보(info).
# 예: "노트북 1000 마우스 키보드 discount=100 color=검정" → product=노트북, price=1000, options=[마우스,키보드], discount=100, info={color:검정}
raw = input().split() 
pos = [t for t in raw if "=" not in t] 
product = pos[0]
price = int(pos[1])
options = pos[2:]
discount = 0
info = {}
for t in raw:
    if "=" in t:
        k, v = t.split("=", 1)
        if k == "discount":
            discount = int(v)
        else:
            info[k] = v

def order2(product, price, *options, discount=discount, **info):
    '''
    Args:
        product (str) : 제품명
        price (int) : 가격
        *options (list) : 옵션들을 리스트에 넣음 
        discount=discount (int) : 기본값 0, 값이 있으면 그 값으로
        **info (dict) : key값, value값
    Returns:
        product price - discount 옵션len(options)개 [key=value]
    '''
    if len(info) > 0:
        tuple_list = []
        for key, value in info.items():
            tuple_list.append((key, value))
        tuple_list.sort()

        answer_list = []
        for idx in range(len(tuple_list)):
            answer_list.append(f"{tuple_list[idx][0]}={tuple_list[idx][1]}")
        answer = ",".join(answer_list)
        return f"{product} {price - discount}원 옵션{len(options)}개 [{answer}]"
    else:
        return f"{product} {price - discount}원 옵션{len(options)}개 []"

# 출력 
print(order2(product, price, *options, discount=discount, **info))

# ==========================================================================================
# ■ 개선점
# 1. info가 비어 있는 경우를 별도로 검사하지 않아도 된다.
#    → ",".join()은 빈 데이터에서 빈 문자열을 반환하므로 동일한 출력 형식을 유지할 수 있다.

# 2. 기존 코드의 tuple_list → answer_list → answer 과정을
#    sorted(info.items())와 컴프리헨션으로 줄일 수 있다.

# 3. 함수의 discount 기본값은 외부 변수인 discount를 참조하기보다
#    명세대로 discount=0으로 정의하는 것이 좋다.
#    → 함수 자체의 기본 동작이 명확해지고 외부 변수에 의존하지 않는다.

# 4. *options의 설명은 실제 자료형인 tuple에 맞게 작성하는 것이 정확하다.
#    → *options로 전달된 값은 함수 내부에서 tuple로 묶인다.

# 5. 최종 문자열 생성은 하나의 return문으로 통일할 수 있어 코드의 중복을 줄일 수 있다.
# ==========================================================================================
# ■ AI 추천 코드

raw = input().split()
pos = [t for t in raw if "=" not in t]
product = pos[0]
price = int(pos[1])
options = pos[2:]
discount = 0
info = {}
for t in raw:
    if "=" in t:
        k, v = t.split("=", 1)
        if k == "discount":
            discount = int(v)
        else:
            info[k] = v

def order2(product, price, *options, discount=0, **info):
    '''
    Args:
        product (str) : 제품명
        price (int) : 가격
        *options (list) : 옵션들을 리스트에 넣음
        discount (int) : 기본값 0, 값이 있으면 그 값으로
        **info (dict) : key값, value값
    Returns:
        product price - discount 옵션len(options)개 [key=value]
    '''
    # sorted(info.items())로 한 번에 정렬된 쌍을 얻고, 컴프리헨션으로 간결하게 처리
    info_str = ",".join(f"{k}={v}" for k, v in sorted(info.items()))
    # info가 비어 있으면 info_str이 빈 문자열이 되어 분기 없이 통일된 포맷 사용 가능
    return f"{product} {price - discount}원 옵션{len(options)}개 [{info_str}]"

# 출력
print(order2(product, price, *options, discount=discount, **info))