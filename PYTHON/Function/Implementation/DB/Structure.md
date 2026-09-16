테이블 설계

1. 메뉴 테이블
- [음료 ID] NUMBER PRIMARY KEY 
- 음료 이름  VARCHAR2(50)
- 가격      NUMBER

2. 회원 테이블
- [회원 ID] NUMBER GENERATED ALWAYS AS IDENTITY AS IDENTITY PRIMARY KEY
- 이름      VARCHAR2(10)
- 전화번호   VARCHAR2(20)

3. 주문 테이블(누가 언제 주문했는가)
- [주문 ID] NUMBER PRIMARY KEY
- 회원 ID   NUMBER
- 날짜      DATE

4. 주문 상세 테이블(무슨 음료를 몇개 주문)
- [주문 상세 ID] NUMBER PRIMARY KEY
- 주문 ID       
- 음료 ID
- 가격
- 수량