def isInterleave(s1, s2, s3):
    m = len(s1)
    n = len(s2)
    if m + n != len(s3):
        return False

    memo = {}
    def dfs(i, j):
        if i == m and j == n:
            return True
        state = (i, j)
        if state in memo:
            return memo[state]
        k = i + j
        if i < m and s1[i] == s3[k] and dfs(i + 1, j):
            memo[state] = True
            return True
        if j < n and s2[j] == s3[k] and dfs(i, j + 1):
            memo[state] = True
            return True
        memo[state] = False
        return False

    return dfs(0, 0)