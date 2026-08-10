def maximumProductSubarray(nums: List[int]) -> int:
    if not nums:
        return nums

    n = len(nums)
    maxCurrent = 1
    minCurrent = 1
    result = nums[0]

    for num in nums:
        if num < 0:
            minCurrent, maxCurrent = maxCurrent, minCurrent
        maxCurrent = max(num, maxCurrent * num)
        minCurrent = min(num, minCurrent * num)
        result = max(result, maxCurrent)

    return result