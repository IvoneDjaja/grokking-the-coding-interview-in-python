def largest_square(arr: list[list[int]]) -> int:
    n = len(arr)
    m = len(arr[0])
    dp = [[0] * m for _ in range(n)]
    max_num = -1
    for i in range(n):
        for j in range(m):
            if arr[i][j] == 0:
                continue
            left = right = diag = 0
            if i > 0:
                left = dp[i - 1][j]
            if j > 0:
                right = dp[i][j - 1]
            if i > 0 and j > 0:
                diag = dp[i - 1][j - 1]
            dp[i][j] = min([left, right, diag]) + 1
            max_num = max(max_num, dp[i][j])
        # for k in range(len(dp)):
        #     print(dp[k])
        # print()
    return max_num

print(largest_square([
    [0, 1, 1, 0, 1],
    [1, 1, 0, 1, 0],
    [0, 1, 1, 1, 0],
    [1, 1, 1, 1, 0],
    [1, 1, 1, 1, 1],
    [0, 0, 0, 0, 0],
]))