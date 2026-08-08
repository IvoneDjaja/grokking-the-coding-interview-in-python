def longest_palindromic_substring(s: str) -> str:
    n = len(s)
    i = 0
    maxLength = 0
    startIndex = 0
    endIndex = startIndex + 1
    while i < n:
        start, end = i, i
        while start > -1 and end < n and s[start] == s[end]:
            if end - start + 1 > maxLength:
                maxLength = end - start + 1
                startIndex = start
                endIndex = end
            start -= 1
            end += 1
        start, end = i, i + 1
        while start > -1 and end < n and s[start] == s[end]:
            if end - start + 1 > maxLength:
                maxLength = end - start + 1
                startIndex = start
                endIndex = end
            start -= 1
            end += 1
        i += 1

    return s[startIndex:endIndex+1]

# CASE 1
input1 = 'asfdodfsaiuoefbwjebejwbf'
input2 = 'aghsaashg'
print(longest_palindromic_substring(input1))
print(longest_palindromic_substring(input2))