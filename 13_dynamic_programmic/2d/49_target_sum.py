def target_sum(nums: List[int], target: int):
	
    def dfs(index, total):
        num = nums[index]
        if total == target:
            return 1 if index >= len(nums) else 0
        return dfs(index + 1, total + num) + dfs(index + 1, total - num)

    return dfs(0, 0)
