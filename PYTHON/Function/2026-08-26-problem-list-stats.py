# ==========================================================================================      
# ■ 문제 요약
# 정수 리스트를 주고 리스트의 최솟값, 최댓값, 합, 평균을 구하는 문제
# ==========================================================================================      

nums = [int(x) for x in input().split()]

def stats4(nums):
    '''
    Args:
        nums(list) : 정수 리스트
    Returns:
        Tuple[int, int, int, int] : (최솟값, 최댓값, 합, 평균)이 튜플로 반환
    '''
    sum_nums = sum(nums)
    avg_nums = sum_nums // len(nums)
    return min(nums), max(nums), sum_nums, avg_nums

# 튜플형식으로 반환되기 때문에 언패킹(*)을 해야함
print(*stats4(nums))

# ==========================================================================================
# ■ 개선점
# 1. 함수를 가장 위에 두는 습관
# ==========================================================================================
# ■ AI 추천 코드
def stats4(nums):
    '''
    Args:
        nums(list) : 정수 리스트
    Returns:
        Tuple[int, int, int, int] : (최솟값, 최댓값, 합, 평균)이 튜플로 반환
    '''
    sum_nums = sum(nums)
    avg_nums = sum_nums // len(nums)
    return min(nums), max(nums), sum_nums, avg_nums


# input().split() 의 각 칸을 정수로 바꿔 리스트로 만듭니다. 예: "1 2 3 4" → nums=[1, 2, 3, 4]
nums = [int(x) for x in input().split()]

# 튜플형식으로 반환되기 때문에 언패킹(*)을 해야함
print(*stats4(nums))