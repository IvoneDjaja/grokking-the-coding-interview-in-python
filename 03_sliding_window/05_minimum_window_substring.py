def min_window(s: str, t: str) -> str:
    if len(s) < len(t):
        return ''

    if len(s) < len(t):
            return ''

    t_map = {}
    s_map = {}
    min_length = float('inf')
    start_index = 0
    end_index = 0

    for char in t:
        count = t_map.get(char, 0) + 1
        t_map[char] = count

    n = len(s)
    start = 0
    have = 0
    need = len(t_map)
    for i in range(n):
        char = s[i]
        count = s_map.get(char, 0) + 1
        s_map[char] = count

        if char in t_map and s_map[char] == t_map[char]:
            have += 1
        
        while have == need:
            if min_length > i + 1 - start:
                min_length = i + 1 - start
                start_index = start
                end_index = i + 1
            start_char = s[start]
            s_map[start_char] -= 1
            if start_char in t_map and s_map[start_char] < t_map[start_char]:
                have -= 1
            start += 1

    return s[start_index:end_index]

s1 = 'cbac'
t1 = 'ac'
print(min_window(s1, t1))

s2 = 'aab'
t2 = 'ab'
print(min_window(s2, t2))

s3="aaaaaaaaaaaabbbbbcdd"
t3="abcdd"
print(min_window(s3, t3))