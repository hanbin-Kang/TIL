# ==========================================================================================      
# ■ 문제 요약
# 입력 받은 값을 나눠서 매개변수에 넣고 출력하는 문제
# ==========================================================================================      
# ■ 알고리즘
# *언패킹을 알고 입력받은것을 for반복문으로 나눠서 fees에 넣는 과정을 공부
# ==========================================================================================      
raw = input().split()
pos = [t for t in raw if "=" not in t]
price = int(pos[0]) # 1000
fees = [int(x) for x in pos[1:]] 
discount = 0
for t in raw:
    if "=" in t: # t에 =이 있으면 
        k, v = t.split("=", 1)
        if k == "discount": # k가 discount이면
            discount = int(v) # v는 값

def pay(price, *fees, discount=0):
    '''
    Args:
        price (int) : 정수값
        *fees (int) : 리스트를 언패킹하여 정수로
        discount (int) : keyword, 없으면0 있으면 그 값
    Returns:
        discount가 있을 때 : price + *fees 
        discount가 없을 때 : price + *fees - discount
    '''
    if discount:
        return price + sum(fees) - discount
    else:
        return price + sum(fees)

print(pay(price, *fees, discount=discount))

# ==========================================================================================
# ■ 개선점
# discount의 값이 없어도 0이니 분기하지 않고 하나로 계산하여도 동일한 값이 나오기 때문에 분기할 필요가 없음
# ==========================================================================================
# ■ AI 추천 코드

raw = input().split()
pos = [t for t in raw if "=" not in t]
price = int(pos[0])
fees = [int(x) for x in pos[1:]]
discount = 0
for t in raw:
    if "=" in t:
        k, v = t.split("=", 1)
        if k == "discount":
            discount = int(v)

def pay(price, *fees, discount=0):
    '''
    Args:
        price (int) : 기본 가격(필수)
        *fees (int) : 추가 요금(0개 이상)
        discount (int) : 할인액(키워드 전용, 기본값 0)
    Returns:
        price + fees의 합 - discount (discount=0이면 그대로 합산)
    '''
    return price + sum(fees) - discount  # discount=0일 때도 동일하므로 분기 불필요

print(pay(price, *fees, discount=discount))