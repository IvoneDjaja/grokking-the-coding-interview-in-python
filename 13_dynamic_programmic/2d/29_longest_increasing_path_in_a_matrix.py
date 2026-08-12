def longest_increasing_path(matrix: list[list[int]]) -> int:
    m = len(matrix)
    n = len(matrix[0])
    memo = {}
    length = 0
    maxCount = 0
    def dfs(i, j):
        if (i, j) in memo:
            return memo[(i, j)]

        maxLength = 1
        for dr, dc in [(0, 1), (1, 0),(0, -1), (-1, 0)]:
            nr = i + dr
            nc = j + dc
            if -1 < nr < m and -1 < nc < n and matrix[nr][nc] > matrix[i][j]:
                maxLength = max(maxLength, 1 + dfs(nr, nc))
        memo[(i, j)] = maxLength
        return maxLength
        
    for i in range(m):
        for j in range(n):
            maxCount = max(maxCount, dfs(i, j))
    return maxCount
