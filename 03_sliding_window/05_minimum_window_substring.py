def min_window(s: str, t: str) -> str:
    if len(s) < len(t):
        return ''

    t_map = {}
    s_map = {}
    min_length = float('inf')
    start_index = 0
    end_index = 0
    t_count = 0

    for char in t:
        count = t_map.get(t, 0) + 1
        t_map[char] = count

    n = len(s)
    start = 0
    for i in range(n):
        char = s[i]
        count = s_map.get(char, 0) + 1
        s_map[char] = count
        if char in t_map and s_map[char] >= t_map[char]:
            t_count += 1
        while t_count >= len(t):
            if s[start] in t_map and t_count == len(t):
                break
            s_map[s[start]] -= 1
            if char in t_map:
                t_count -= 1
            start += 1
        if t_count == len(t) and min_length > i + 1 - start:
            min_length = i + 1 - start
            start_index = start
            end_index = i + 1
    return s[start_index:end_index]

s1 = 'cbac'
t1 = 'ac'
print(min_window(s1, t1))