# ==========================================================================================      
# ■ 문제 요약
# key=value 형태의 문자열 입력들을 딕셔너리로 파싱한 뒤, 
# name 키는 필수 매개변수로 전달하고 나머지 키-값 쌍은 가변 키워드 인자(**kwargs)로 전달하여 
# 키 기준 정렬된 형태(name: key1=val1,key2=val2)로 출력하는 문제
# ==========================================================================================      
# ■ 알고리즘
# 1. 문자열 파싱: split()을 활용해 key=value 형태의 입력을 딕셔너리로 변환
# 2. kwargs 언패킹: opts를 전달하여 name은 필수 인자로, 나머지는 options 딕셔너리로 자동 분리
# 3. 정렬 및 합성: sorted(options.items())로 키 기준 사전순 정렬 후 join()으로 문자열 결합
# ==========================================================================================    
opts = {}
for token in input().split():
    k, v = token.split("=")
    opts[k] = v # name, age, city .. key, = 뒤에 value값

def register(name, **options):
    '''
    Args:
        name (str) : 이름 
        ** options (int or str): 딕셔너리를 언패킹
    Returns:
        name: 나머지들
    '''
    info = []
    for key, value in opts.items():
        if key != 'name':
            info.append((f"{key}={value}"))
            info.sort()
            result = ",".join(info)
    
    if info:
        return f"{name}: {result}"
    else:
        return f"{name}:"

print(register(**opts))

# ==========================================================================================
# ■ 개선점
# 1. kwargs 언패킹: opts를 전달하여 name은 필수 인자로, 나머지는 options 딕셔너리로 자동 분리
# 2. 정렬 및 합성: sorted(options.items())로 키 기준 사전순 정렬 후 join()으로 문자열 결합
# * join()은 대상이 비어있으면 빈 문자열("")을 반환합니다.
#   비어있을 때도 f"{name}: {result}"에 ""가 들어가 동일한 형식으로 출력되므로 조건 구분이 생략 가능합니다.
# ==========================================================================================
# ■ AI 추천 코드

opts = {}
for token in input().split():
    k, v = token.split("=")
    opts[k] = v  # name, age, city .. key, = 뒤에 value값

def register(name, **options):
    '''
    Args:
        name (str) : 이름
        **options (str): 추가 옵션 키-값 쌍 딕셔너리
    Returns:
        name: 나머지들 (키 사전순 정렬)
    '''
    # 전역 opts 대신 매개변수 options 를 사용해야 함수가 독립적으로 동작함
    result = ",".join(f"{key}={value}" for key, value in sorted(options.items()))  # 루프 밖에서 한 번만 정렬
    return f"{name}: {result}"

print(register(**opts))