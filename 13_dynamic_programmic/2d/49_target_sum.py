from collections import defaultdict


def target_sum(nums: List[int], target: int):
    dp = {0: 1}
    for num in nums:
        dp_next = defaultdict(int)
        for total, count in dp.items():
            dp[total + num] += 1
            dp[total - num] += 1
        dp = dp_next
    return dp[target]
