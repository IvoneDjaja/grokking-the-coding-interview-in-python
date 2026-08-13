def combinationSum(nums: List[int], target: int) -> List[List[int]]:
    output = []

    def backtrack(total, start, combination):
        if total > target:
            return
        if total == target:
            output.append(combination.copy())
            return
        for i in range(start, len(nums)):
            num = nums[i]
            combination.append(num)
            backtrack(total + num, i, combination)
            combination.pop()
    
    backtrack(0, 0, [])
    return output