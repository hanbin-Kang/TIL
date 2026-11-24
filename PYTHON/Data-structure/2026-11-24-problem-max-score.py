data_sets = [
    [("윤서", 85), ("지우", 92), ("민준", 65), ("서윤", 78), ("도윤", 95)],
    [("A", 70), ("B", 90), ("C", 80)],
    [("solo", 70)],
]
t = int(input())
students = data_sets[t]

# 점수가 가장 높은 학생을 이름: 점수 순으로 출력
max_std = ("", 0)
for std in students:
    if std[1] > max_std[1]:
        max_std = std

print(f"{max_std[0]}: {max_std[1]}")