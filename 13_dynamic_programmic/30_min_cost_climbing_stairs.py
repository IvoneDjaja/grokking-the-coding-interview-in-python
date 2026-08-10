from typing import List


def minCostClimbingStairs(cost: List[int]) -> int:
    n = len(cost)
    first, second = 0, 0
    for i in range(2, n + 1):
        first, second  = second, min(first + cost[i-1], second + cost[i-2])
    return second