def climb_stairs(nums):
    if nums == 1 or nums == 2:
         return nums
    memo = (nums + 1) * [0]

    prev1, prev2 = 1, 2
    for i in range(3, nums + 1):
        prev1, prev2 = prev1, prev1 + prev2
    return memo[-1]