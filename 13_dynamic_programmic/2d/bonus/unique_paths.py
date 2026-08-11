def uniquePaths(m: int, n: int) -> int:
	dp = [n * [1] for _ in range(m)]
	for i in range(1, m):
		for j in range(1, n):
			dp[i][j] = dp[i-1][j] + dp[j][j-1]
	return dp[m-1][n-1]