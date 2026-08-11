def coin_change_2(coins: List[int], amount: int) -> int:
    n = len(coins)
    dp = [[0] * (amount + 1) for _ in range(n + 1)]

    for i in range(n):
        dp[i + 1][0] = 1

    for i in range(1, n + 1):
        coin = coins[i - 1]
        for j in range(1, amount + 1):
            dp[i][j] = dp[i - 1][j]
            if j - coin >= 0:
                dp[i][j] += dp[i][j - coin]

    return dp[n][amount]