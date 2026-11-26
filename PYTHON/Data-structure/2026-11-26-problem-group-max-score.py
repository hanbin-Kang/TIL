# 그룹→(이름, 점수) tuple dict 를 운용하면서 더 높은 점수 발견 시 교체. 출력은 sorted(keys) 순.
n = int(input())

# a, b, c 그룹별로 묶고 (사람, 점수) std = [A : (x, 90), (y, 86) , B: (...) ...]

std = {}

for _ in range(n):
    std_info = input().split(',')
    group = std_info[1]
    name_score = (std_info[2], std_info[0])
    std.setdefault(group, []).append(name_score)

for key, value in std.items():
    print(f"{key}: {sorted(value)[-1][1]} ({sorted(value)[-1][0]})")

