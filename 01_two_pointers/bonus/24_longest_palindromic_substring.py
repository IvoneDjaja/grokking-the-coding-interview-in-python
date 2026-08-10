def longestPalindrome(s: str) -> int:
    n = len(s)
    maxLength = 0
    startIndex = 0

    def expand(start, end):
        while start >= 0 and end < n and s[start] == s[end]:
            start -= 1
            end += 1
        return [start + 1, end - 1]
    for i in range(n):
        for start, end in (expand(i, i), expand(i, i + 1)):
            if (end + 1 - start) > maxLength:
                maxLength = end - start + 1
                startIndex = start
    return s[startIndex:startIndex+maxLength]


# CASE 1
input1 = 'asfdodfsaiuoefbwjebejwbf'
input2 = 'aghsaashg'
print(longestPalindrome(input1))
print(longestPalindrome(input2))