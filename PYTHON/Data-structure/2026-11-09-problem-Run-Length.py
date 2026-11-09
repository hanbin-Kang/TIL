s = input()

# 리스트에 계속 넣으면서 하나 넣을 때 마다 set으로, set을 했을 떄 1이 나오면 다음, 아니면 초기화
check_list = [0]

for idx in range(1, len(s)):
    # 값이 달라지는 지점 찾기
    if s[idx] != s[idx-1]:
        check_list.append(idx)
# print(check_list) # [3, 5] < 값이 달라질때 idx

# print(s[:check_list[0]]) 0 ~ 3까지
# print(s[check_list[0]:check_list[1]]) 3 ~ 5까지
# print(s[check_list[1]:]) 5 ~ 끝까지

# result에 결과 추가
result = []
length = len(check_list) - 1
for i in range(length):
    result.append([set(s[check_list[i]:check_list[i+1]]), len(s[check_list[i]:check_list[i+1]])])
result.append([set(s[check_list[-1]:]), len(s[check_list[-1]:])])

# 출력
for k in result:
    value = "".join(k[0])
    print(f"{value}{k[1]}", end = "")