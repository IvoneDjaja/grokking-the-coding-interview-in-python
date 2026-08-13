def subsets2(nums: List[int]) -> List[List[int]]:
    output = []
    nums.sort()
    def backtrack(start, subset):
        output.append(subset.copy())
        for i in range(start, len(nums)):
            if i > start and nums[i] == nums[i-1]:
                continue
            num = nums[i]
            subset.append(num)
            backtrack(i + 1, subset)
            subset.pop() 
    
    backtrack(0, [])
    return output