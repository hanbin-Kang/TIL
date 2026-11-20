# 한 슬라이스에 시작 1과 끝 -1을 함께 지정합니다.
data_sets = [
    [10, 20, 30, 40, 50, 60, 70, 80],
    [1, 2, 3, 4, 5],
    [10, 20],
]
t = int(input())
data = data_sets[t]
data_setting = data[1:-1]
# 처음과 끝을 빼고
result = " ".join(str(num) for num in data_setting)
print(result)