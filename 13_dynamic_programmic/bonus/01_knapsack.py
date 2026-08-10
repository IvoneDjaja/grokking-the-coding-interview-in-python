def findMaxKnapsackProfit(capacity, weights, values):
	dp = (capacity + 1) * [0]
	
	for i in range(len(weights)):
		weight = weights[i]
		val = values[i]
		for j in range(capacity, weight - 1, -1):
			dp[j] = max(dp[j], dp[j-weight] + val)
	return dp[capacity]