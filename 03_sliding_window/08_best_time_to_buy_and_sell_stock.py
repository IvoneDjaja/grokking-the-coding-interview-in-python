def max_profit(prices):
    n = len(prices)
    maxProfit = 0
    start = 0
    end = 0
    while end < n:
        if prices[start] >= prices[end]:
            start = end
        profit = prices[end]-prices[start]
        maxProfit = max(maxProfit, profit)
        end += 1
    return maxProfit
