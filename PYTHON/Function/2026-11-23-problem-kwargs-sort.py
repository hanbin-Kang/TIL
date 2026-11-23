opts = {}
for token in input().split():
    k, v = token.split("=")
    opts[k] = v

# 함수 정의
def merge_to_string(**kwargs):
    '''
    Args:
        kwargs: 언패킹된 딕셔너리인 매개변수를 튜플로 패킹
    Returns:
        key값을 오름차순으로 한 후, 딕셔너리 형태로 출력
    '''
    result = [f"{k}={v}" for k, v in sorted(kwargs.items())]
    return ",".join(result)

# 함수 호출 + 출력
print(merge_to_string(**opts))
