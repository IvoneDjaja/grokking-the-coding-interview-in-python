def maxSubArray(self, nums: List[int]) -> int:
    n = len(nums)
    maxSum = float('-inf')
    current = float('-inf')
    for i in range(n):
        current = max(current + nums[i], nums[i])
        maxSum = max(maxSum, current)
    return maxSum