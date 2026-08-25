# ==========================================================================================
# ■ 문제 요약
# 패턴과 단어의 대응 관계와 순서가 일치하는지 확인하는 문제이다
# ==========================================================================================
# ■ 알고리즘
# 0. 패턴의 글자와 단어 리스트의 수를 비교
# 1. 패턴의 글자를 set()으로 중복 제거하고, 단어 리스트도 set()으로 중북 제거 후 글자 수 비교
# 2. 위에서 아닌것들을 우선 거르고, 딕셔너리에 패턴 : 단어 형식으로 넣기
# 3. 마지막에 확인 후 출력
# ==========================================================================================

pattern = input()
words = input().split()
words_dict = {}

# 패턴의 set()개수와, 단어의 set()개수가 다르면 no
if len(set(pattern)) != len(set(words)):
    print('no')
# 같을 때는 딕셔너리에 넣어 직접 비교
else:
    for key, value in zip(pattern, words):
        words_dict.setdefault(key, value)
    # 확인용 
    count = 0 
    for i, k in zip(pattern, words):
        if words_dict[i] == k:
            count += 1
    # 출력
    print('yes' if count == len(pattern) else 'no')

# ==========================================================================================
# ■ 개선점
# 1. set(pattern) != set(words)로 비교하는것은 패턴의 개수와 단어의 개수가 같지 안냐고만 묻는 것이다. 
# 1-1. pattern = aaa, words = for, for 일 때 yes로 대답하기 때문이다.
# 2. len(pattern) != len(words) 이것도 추가해서 비교하는 것이 좋다.
'''
if len(pattern) != len(words):
    print("no")
elif len(set(pattern)) != len(set(words)):
    print("no")
else:
    ~ 실제 비교
'''
# 3. 확인 하는 과정에서 count로 Flag역할 보다는 all함수를 사용하는 것이 더 파이썬스럽다
# all 함수란 : 함수 내의 조건이 모두 참이면 True, 하나라도 거짓이면 False
# matched = all(words_dict[i] == k for i, k in zip(pattern, words))
# ==========================================================================================
# ■ AI 추천 코드

pattern = input()
words = input().split()

# 길이가 다르면 즉시 no (명시적 처리)
if len(pattern) != len(words):
    print('no')
else:
    char_to_word = {}  # 패턴 글자 → 단어
    word_to_char = {}  # 단어 → 패턴 글자 (역방향 일관성 보장)

    matched = True
    for char, word in zip(pattern, words):
        # 순방향 충돌 검사
        if char in char_to_word and char_to_word[char] != word:
            matched = False
            break
        # 역방향 충돌 검사 (다른 글자가 같은 단어를 가리키는 경우)
        if word in word_to_char and word_to_char[word] != char:
            matched = False
            break
        char_to_word[char] = word
        word_to_char[word] = char

    # 출력
    print('yes' if matched else 'no')