def target_sum(nums: List[int], target: int):
    memo = {}
	
    def dfs(index, total):
        if index == len(nums):
            return 1 if total == target else 0
        state = (index, total)
        if state in memo:
            return memo[state]
        num = nums[index]
        memo[state] = dfs(index + 1, total + num) + dfs(index + 1, total - num)
        return memo[state]

    return dfs(0, 0)
