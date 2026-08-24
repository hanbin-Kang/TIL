# 카페의 주문 시스템 : Cafe order system

# TODO 
# 0단계 - 메뉴 딕셔너리와 함수의 구조 설정
# 1단계 — 입력 검증 : 잘못된 메뉴나 옵션을 입력했을 때 프로그램이 터지지 않도록 만들기.
# 2단계 — 주문 목록 만들기 : 한 번 주문하고 끝나는 게 아니라 여러 주문을 저장
# 3단계 — 총 주문 금액 계산 : 주문 목록을 받아서 총액을 계산하는 함수를 추가.
# 4단계 — 주문 삭제 / 수정 : (주문한 뒤) 주문 수량 변경, 주문 삭제
# 5단계 — 장바구니 : 주문을 바로 결제하지 않고 장바구니에 담도록 변경.
# 6단계 — 결제 기능: 결제 함수를 추가.

# 최종 목표: 
# 6단계까지 다 만든 후 한달을 기준으로 얼마나, 몇개가 팔렸는지, 매출등을 저장하는 DB를 연결 + web에 키호스크처럼 만들기 + AI와 연결

menu = {
    "Americano": {
        "Ice": 3000,
        "Hot": 2500
    },

    "Cafe Latte": 4000,

    "Smoothie": {
        "Strawberry": 5000,
        "Blueberry": 4500,
        "Mango": 5000
    },

    "Tea": {
        "Ice Tea": 3000,
        "Earl Grey": {
            "Ice": 4000,
            "Hot": 3500
        },
        "Green Tea": {
            "Ice": 3500,
            "Hot": 3200
        },
        "Chamomile": {
            "Ice": 3200,
            "Hot": 3500
        }
    },

    "Ade": {
        "Lemonade": 4000,
        "Grapefruit Ade": 5500
    }
}

# 주문시킬 메뉴
choice = input('메뉴를 선택: ')
# 주문시킬 수량
quantity = int(input('수량을 선택하세요: '))
# 메뉴 주문 함수
def order_menu(menu_name : str, quantity : int): 
    '''
    Args:
        menu_name (str) : positional, 원하는 메뉴 명
        quantity (int) : positional, 원하는 양
    Returns:
        price * quantity (int): 주문한 총 가격  
    Example:
        menu_name = 'Ade', quantity = 2
        option = 'Lemonade'
        => Lemonade - 4,000 * 2 = 8,000
    '''

    # 딕셔너리가 아닐 때 : Cafe Latte
    if type(menu[menu_name]) != dict:
        return f"주문한 메뉴: {menu_name}, 가격: {menu[menu_name] * quantity}원"

    # 딕셔너리일 때 : Cafe Latte X
    if type(menu[menu_name]) == dict:
        # option이 필요함 menu[menu_name][option] << 뭐가 들어가냐가 필요한데 Ice/Hot or 다른 메뉴 
        option = input()
        # option이 Ice or Hot일 때
        temperature = ['Ice', 'Hot']

        if option in temperature:
            return f"주문한 메뉴 - {menu_name} ({option}), 가격: {menu[menu_name][option] * quantity}원"
        
        # option이 Ice or Hot이 아니고,
        if option not in temperature:

            # 딕셔너리가 아닐 때 : Earl Grey, Green Tea, Chamomile X
            if type(menu[menu_name][option]) != dict:
                return f"주문한 메뉴 - {menu_name}: {option}, 가격: {menu[menu_name][option] * quantity}원"

            # 딕셔너리일 때 : Earl Grey, Green Tea, Chamomile
            if type(menu[menu_name][option]) == dict:
                # Ice or hot을 선택해야함
                option_temp = input()
                return f"주문한 메뉴 - {menu_name}: {option} ({option_temp}), 가격: {menu[menu_name][option][option_temp] * quantity}원"
        
print(order_menu(choice, quantity))



# TODO 수정할 부분 : 딕셔너리 내의 값들을 구분할 때 너무 딱딱하여 유지보수, 수정이 힘듦
# if isinstance(menu[menu_name], int) -> menu[menu_name]을 했을 때 int가 나오냐, 나오지 않냐 
# 나오지 않으면 다른것이 더 필요하다는 뜻.. while문 사용