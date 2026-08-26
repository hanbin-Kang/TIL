# ==========================================================================================      
# ■ 문제 요약
# 매개변수의 threshold를 nums의 구성요소의 합으로 초과할 때의 인덱스를 반환하는 함수
# ==========================================================================================      
# ■ 알고리즘
# 1. 전체의 합이 한계값을 넘지 못하면 -1을 반환하는것을 먼저 처리
# 2. 그 후 반복문을 사용하여 합이 한계값을 넘을때의 인덱스 번호 반환
# ==========================================================================================      

def first_exceed(nums, threshold):
    # 한계값 : threshold
    # 누적 합이 처음으로 한계값을 초과하는 인덱스를 찾고 즉시 반환, 없으면 -1 반환
    '''
    Args:
        nums (list) : 정수들의 리스트
        threshold (int) : 한계값
    Returns:
        idx (int) : 한계값을 처음으로 초과하는 누적합의 인덱스, 없으면 -1 반환
    '''
    total = 0
    # 총합이 한계점 이하일 때
    if sum(nums) <= threshold:
        return -1
    
    for idx, num in enumerate(nums):
        total += num
        if total > threshold:
            return idx  

threshold = int(input())
nums = [int(x) for x in input().split()]

print(first_exceed(nums, threshold))

# ==========================================================================================
# ■ 개선점
# 굳이 먼저 한계값 이하일때를 if문으로 두지 않고 for문 밑에 가장 마지막에 return -1을 했던것이 더 깔끔했던것 같다
# ==========================================================================================
# ■ AI 추천 코드
def first_exceed(nums, threshold):
    # 한계값 : threshold
    # 누적 합이 처음으로 한계값을 초과하는 인덱스를 찾고 즉시 반환, 없으면 -1 반환
    '''
    Args:
        nums (list) : 정수들의 리스트
        threshold (int) : 한계값
    Returns:
        idx (int) : 한계값을 처음으로 초과하는 누적합의 인덱스, 없으면 -1
    '''
    total = 0
    # sum(nums) 사전 검사를 제거 — 전체 순회 없이 루프 하나로 처리 (진정한 조기 종료)
    for idx, num in enumerate(nums):
        total += num
        if total > threshold:
            return idx

    # 끝까지 순회해도 초과하지 않으면 -1 반환
    return -1

threshold = int(input())
nums = [int(x) for x in input().split()]

print(first_exceed(nums, threshold))