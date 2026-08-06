def longest_palindromic_substring(s: str) -> str:
    n = len(s)
    i = 0
    maxLength = 1
    startIndex = 0
    endIndex = n
    while i < n:
        start = i - 1
        end = i + 1
        length = 1
        while start > 0 and end < n:
            if s[start] == s[end]:
                length += 1
            else:
                break
            start -= 1
            end += 1
        if length > maxLength:
            startIndex = start + 1
            endIndex = end - 1
        i = end

    return s[startIndex:endIndex]

# CASE 1
input1 = 'asfdodfsaiuoefbwjebejwbf'
print(longest_palindromic_substring(input1))