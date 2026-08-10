def countSubstrings(s: str) -> int:
    n = len(s)
    count = 0
    def expand(start, end):
        count = 0
        while start >= 0 and end < n and s[start] == s[end]:
            count += 1
            start -= 1
            end += 1
        return count

    for i in range(n):
        count += expand(i, i)
        count += expand(i, i + 1)
    return count