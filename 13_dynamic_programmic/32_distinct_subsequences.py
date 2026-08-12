from collections import defaultdict


def distinct_subsequences(s: str, t: str) -> int:
    memo = defaultdict(int)
    def dfs(i, j):
        if j == len(t):
            return 1
        if i == len(s):
            return 0
        if (i, j) in memo:
            return memo[(i, j)]
        res = dfs(i + 1, j)
        if s[i] == t[j]:
            res += dfs(i + 1, j + 1)

        memo[(i, j)] = res 
        return res

    return dfs(0, 0)
