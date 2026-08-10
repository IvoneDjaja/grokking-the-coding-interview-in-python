def coinChange(coins: List[int], amount: int) -> int:
	n = amount
	memo = (n + 1) * [float('inf')]
	coins.srot()

	memo[0] = 0
	for i in range(1, n + 1):
		for coin in coins:
			if i - coin < 0:
				break
			memo[i] = min(memo[i], memo[i-coin] + 1)

	return -1 if memo[n] == float('inf') else memo[n]
