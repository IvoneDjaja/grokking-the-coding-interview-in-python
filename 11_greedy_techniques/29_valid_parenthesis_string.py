def checkValidString(s: str) -> bool:
    minParentheses = 0
    maxParentheses = 0
    for i in range(len(s)):
        if s[i] == '(':
            minParentheses += 1
            maxParentheses += 1
        elif s[i] == '*':
            maxParentheses += 1
            minParentheses -= 1
        else:
            minParentheses -= 1
            maxParentheses -= 1
        if maxParentheses < 0:
            return False
        minParentheses = max(minParentheses, 0)
    return minParentheses == 0