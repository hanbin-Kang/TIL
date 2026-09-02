# ==========================================================================================
# ■ 문제 요약
# 같은 글자의 구성을 가진 단어들을 출력하는 문제
# ==========================================================================================
# ■ 알고리즘
# 입력한 단어들을 .split()으로 나눈 후, 반복문을 사용하여 하나하나 리스트에 넣기
# 리스트와 words를 zip하여 딕셔너리에 넣고 출력하기
# ==========================================================================================

words = input().split()
# 각 글자들의 구성요소 확인
word_list = []
for w in words:
    word_list.append("".join(sorted(w)))
# 딕셔너리에 key, value를 setdefault를 사용하여 넣기 
word_dict = {}
for key, value in zip(words,word_list):
    word_dict.setdefault(value, []).append(key)
# 출력 
for value in sorted(word_dict.values()):
    print(" ".join(sorted(value)))

# ==========================================================================================
# ■ 개선점
# word_list라는 리스트는 필요없는 것이었다.
# 필요없는 반복문을 줄여 코드의 가독성과 효율성을 높이도록 해야겠다
# ==========================================================================================
# ■ AI 추천 코드

words = input().split()

# 딕셔너리에 key, value를 setdefault를 사용하여 넣기
word_dict = {}
for word in words:
    sorted_key = "".join(sorted(word))  # 중간 리스트 없이 바로 key 계산
    word_dict.setdefault(sorted_key, []).append(word)

# 출력: key(정렬된 글자) 기준으로 그룹 순서 정렬
for key in sorted(word_dict):  # key 기준 정렬로 의도를 명확히
    print(" ".join(sorted(word_dict[key])))