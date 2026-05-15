def solution(my_string, overwrite_string, s):
    # 1. 처음부터 인덱스 s 전까지
    front = my_string[:s]
    
    # 2. 갈아끼울 문자열
    middle = overwrite_string
    
    # 3. overwrite_string이 끝난 지점 이후의 나머지 부분
    # 뒷부분의 시작 인덱스는 s + overwrite_string의 길이
    back = my_string[s + len(overwrite_string):]
    
    return front + middle + back