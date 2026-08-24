# ==========================================================================================
# # ■ 문제 요약
# 사용자, 책 형식의 CSV가 입력되면 상위 3명을 '이름: N회' 형식으로 출력
# ==========================================================================================
# # ■ 알고리즘
# 어떤 학생이 책을 몇권 빌렸는지를 dict를 통해 정리
# 튜플형식으로 (이름, 빌린 권수)로 묶고
# 내림차순으로 정렬
# TOP3 출력
# ==========================================================================================

n = int(input())

user_dict= {}
for _ in range(n):
    user = input().split(',')
    user_dict[user[0]] = user_dict.get(user[0], 0) - 1

user_list = []
for name, count in user_dict.items():
        user_list.append((count, name))

user_list.sort()

top = 1
for count, name in user_list:
    if top <= 3:
        count *= -1
        print(f"{name}: {count}회")
        top += 1
    else:
        break

# ■ 입력값
# 5
# A,b1
# B,b2
# A,b3
# C,b4
# A,b5

# ==========================================================================================
# ■ 개선점
# 1. 미리 주석을 달고 시작한다. (코드를 짜면서 헷갈림 방지)
# 2. get을 쓰는것도 좋지만 lambda 또한 연습한다
# 3. top이라는 변수를 Flag역할로 사용하였지만 sort를 한 후 인덱스 슬라이싱을 하면 더욱 간단하게 해결 가능하다
# ==========================================================================================
# ■ AI 추천 코드

n = int(input())

# --- 입력 및 집계 ---
loan_count = {}  # 변수명을 역할이 드러나도록 개선
for _ in range(n):
    user = input().split(',')
    loan_count[user[0]] = loan_count.get(user[0], 0) + 1  # 양수로 저장해 직관성 향상

# --- 정렬: 빈도 내림차순, 동률은 이름 사전순 ---
sorted_users = sorted(loan_count.items(), key=lambda x: (-x[1], x[0]))

# --- 상위 3명 출력 ---
for name, count in sorted_users[:3]:  # 슬라이싱으로 간결하게 처리
    print(f"{name}: {count}회")