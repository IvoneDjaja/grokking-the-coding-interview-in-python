def isMatch(s: str, p: str) -> bool:
    m, n = len(p), len(s)
    dp = [[False] * (n + 1) for _ in range(m + 1)]
    dp[0][0] = True

    # Base case: Patterns like "b*", "a*b*", "ab*ac*a" matching empty s
    for i in range(1, m + 1):
        if p[i - 1] == '*':
            dp[i][0] = dp[i - 2][0]

    # Fill DP table
    for i in range(1, m + 1):
        for j in range(1, n + 1):
            if p[i - 1] == s[j - 1] or p[i - 1] == '.':
                dp[i][j] = dp[i - 1][j - 1]
            elif p[i - 1] == '*':
                # Case 1: Match 0 instances of preceding char
                dp[i][j] = dp[i - 2][j]
                
                # Case 2: Match 1 or more instances of preceding char
                prev_char = p[i - 2]
                if prev_char == s[j - 1] or prev_char == '.':
                    dp[i][j] = dp[i][j] or dp[i][j - 1]

    return dp[m][n]