# ==========================================================================================
# ■ 문제 요약
# nums 리스트 안의 두 정수의 합이 target인지 구하고, 조건에 만족하면 그 값을 구하여라
# ==========================================================================================
# ■ 알고리즘
# 1. nums 리스트 안의 정수들을 반복문을 통해 하나씩 뺀다.
# 2. target - num을 했을 때 리스트 안에 값이 있으면 딕셔너리에 추가. 단) num * 2 == target인 경우 주의
# 3. .get을 사용하여 딕셔너리에 target - num을 했을 때의 값 추가
# 4. 리스트와 비교하여 인덱스 출력
# ==========================================================================================

nums = [int(x) for x in input().split()]
target = int(input())

# 딕셔너리 사용
nums_dict = {}

# 반복문
for num in nums:
    # 타겟 - 현재값이 리스트 안에 있는지 없는지 확인
    if target - num in nums:
        # num * 2 = target일 때
        if num * 2 == target:
            # 리스트에 num이 두개 있을때
            if nums.count(num) >= 2:
                nums_dict[num] = nums_dict.get(num, 0) + 1
        # 아닐 때
        else:
            nums_dict[num] = nums_dict.get(num, 0) + 1

# 값이 두개 이상일 때 먼저 온 두개만 출력하고, 값이 없을 때는 '없음' 출력
count = 0
idx_list = []
for idx, value in enumerate(nums):  
    # 인덱스값을 하나 추가할 때 마다 count값 +1
    # count값이 2가 될 경우 종료
    # count값이 0인 경우 '없음'
    if count < 2:
        if value in nums_dict.keys():
            idx_list.append(idx)
            count += 1
    # 쓸모없는 반복을 막기 위해
    else:
        break

# 값이 없느 경우
if count == 0:
    print('없음')
# 값이 있는 경우
else:
    print(" ".join(str(i) for i in idx_list))

# ==========================================================================================
# ■ 개선점
# 나의 코드는 딕셔너리에 값과, 등장 횟수를 적었는데 추천 코드는 value값을 등장횟수가 아닌 인덱스 번호로 하여
# 같은 작업이여도 더욱 효율적으로 해결하였다.
# 또한 flag를 활용하여 또 다른 변수를 만들지 않고 해결하였다. 
# ==========================================================================================
# ■ AI 추천 코드

nums = [int(x) for x in input().split()]
target = int(input())

# 딕셔너리 사용: {값: 인덱스} 형태로 이미 본 숫자를 기록
seen = {}  # key=값, value=인덱스 (필요한 짝을 O(1)로 조회하기 위해)

# 반복문 — 단일 순회로 쌍을 찾음
found = False
for idx, num in enumerate(nums):
    # 타겟 - 현재값이 이미 본 숫자 중에 있는지 확인 (O(1))
    complement = target - num
    if complement in seen:
        # seen에 저장된 인덱스가 항상 현재 idx보다 작으므로 순서 보장
        print(seen[complement], idx)
        found = True
        break
    # 현재값을 dict에 등록 (나중에 짝을 찾기 위해)
    seen[num] = idx

# 값이 없는 경우
if not found:
    print('없음')