def decodeWays(s: str) -> int:
    n = len(s)
    if n == 0 or s[0] == '0':
        return 0
    
    prev2, prev1 = 1, 1
    for i in range(1, n):
        current = 0
        singleDigit = int(s[i: i+1])
        if 1 <= singleDigit <= 9:
            current += prev1
        doubleDigit = int(s[i-1: i+1])
        if 10 <= doubleDigit <= 26:
            current += prev2
        if current == 0:
            return 0
        prev2, prev1 = prev1, current
    return prev1
        