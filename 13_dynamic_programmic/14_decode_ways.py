def decodeWays(s: str) -> int:
    n = len(s)
    if n == 0 or s[0] == '0':
        return 0
    
    memo = (n + 1) * [0]
    memo[0] = 1
    memo[1] = 1
    for i in range(2, n + 1):
        singleDigit = int(s[i-1: i])
        if 1 <= singleDigit <= 9:
            memo[i] += memo[i - 1]
        doubleDigit = int(s[i-2: i])
        if 10 <= doubleDigit <= 26:
            memo[i] += memo[i - 2]
    return memo[n]
        