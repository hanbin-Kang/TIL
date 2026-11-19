# 학생 리스트
names_sets = [
    ["윤서", "지우", "민준", "서윤", "도윤"],
    ["A", "B", "C"],
    ["혼자"],
]
# 점수 리스트
scores_sets = [
    [85, 92, 65, 78, 95],
    [100, 55, 72],
    [85],
]
t = int(input())
names = names_sets[t]
scores = scores_sets[t]

# 딕셔너리 컴프리헨션을 사용하여 학생 이름과 성적을 딕셔너리에 넣기
info_dict = {key : value for key, value in zip(names, scores)}
# 출력
for name, score in info_dict.items():
    rank = 'A' if score >= 90 else 'B' if score >= 80 else 'C' if score >= 70 else 'F'
    print(f"{name}: {rank}")