tables = [
    [[10, 20, 30, 40],
     [5, 15, 25, 35],
     [0, 10, 20, 30]],
    [[7, 7, 7],
     [1, 2, 3]],
    [[100, 50]],
    [[2, 10, 3, 1],
     [4, 20, 1, 2]],
    [[1, 1, 1, 1, 1],
     [2, 2, 9, 2, 2],
     [1, 1, 1, 1, 1]],
    [[3],
     [4],
     [5]],
    [[9, 1, 2],
     [8, 0, 1]],
]
t = int(input())          # 시나리오 번호 (0~4)
table = tables[t]         # tables 에서 t 번째 2차원 표 선택

# ===================================================================================================================
# 방법 1)
row = len(table) # 3
col = len(table[0]) # 4

r = 0
c = 0

x = []
while True:
    if r == row  and c == col - 1:
        break
    else:
        # c값이 col - 1일 떄
        if r == row: # 0 == 3일 때
            c += 1 
            r = 0
        # 아닐 때
        else:
            x.append(table[r][c])
            r += 1

start = 0
end = row
sum_list = []
while True:
    # 정지조건 : end == len(x)
    if end > len(x):
        break
    else:
        sum_list.append(sum(x[start:end]))
        start += row
        end += row

print(" ".join(str(x) for x in sum_list))

for idx, value in enumerate(sum_list):
    if max(sum_list) == value:
        print(f"최고 분기: {idx}")

# 방법 1) 느낀점
# 열을 고정시키고 행을 움직인다는 생각만 가지고 while문으로 조건을 건 뒤 조건에 만족하면 각 + 1씩 하면서 움직였다
# 전반적으로 코드가 이쁘지 않고, 너무 끼워맞추기 느낌이다

# ===================================================================================================================

# 방법 2)
sum_list = []
# 열을 고정하고
for col in range(len(table[0])):
    col_sum = 0
    # 행만 움직인다. 마지막 행까지 가면 열 움직임
    for row in range(len(table)):
        col_sum += table[row][col]

    sum_list.append(col_sum)

print(" ".join(str(x) for x in sum_list))

for idx, value in enumerate(sum_list):
    if max(sum_list) == value:
        print(f"최고 분기: {idx}")

# 방법 2) 느낀점
# 열을 고정시키고 행을 움직인다는 생각을 for문으로 구현해낸 문제
# 행 -> 열 이 순서에 너무 틀어 박혀 있었던거 같다
# 선입견을 고쳐준 코드

# ===================================================================================================================
# AI 추천 코드

# zip(*table)로 행/열을 전치하여 열별 합계를 한 번에 계산
col_sums = [sum(col) for col in zip(*table)]  # 중첩 루프 대신 zip 활용

print(" ".join(str(x) for x in col_sums))

# max와 index를 조합해 최고 분기 번호를 한 줄로 탐색 (매 반복마다 max 호출 불필요)
print(f"최고 분기: {col_sums.index(max(col_sums))}")

# 느낀점
# ? 이게 뭐지? 언패킹을 이렇게 쓸 수도 있네?
# zip을 이용하면 같은 인덱스의 값끼리 묶이는구나