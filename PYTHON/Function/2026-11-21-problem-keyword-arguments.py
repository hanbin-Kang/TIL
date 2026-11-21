opts = {}
for token in input().split():
    k, v = token.split("=")
    opts[k] = int(v)

def invoice(base, **fees):
    '''
    Args: 
        base(int) : 기본값
        fees(dict) : 딕셔너리 형태의 추가 값
    Returns: 
        (int) : 기본값 + 추가비용
    '''
    for fee in fees.values():
        base += fee
    # 반환
    return base

print(invoice(**opts))
