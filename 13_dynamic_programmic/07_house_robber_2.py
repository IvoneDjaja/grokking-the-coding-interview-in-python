from typing import List


def houseRobber2(nums: List[int]) -> int:
    n = len(nums)
    if len(nums) == 1:
        return nums[0]
    def rob_linear(start, end):
        first = 0
        second = 0
        for i in range(start, end):
            temp = max(second, first + nums[i])
            first, second = second, temp
        return second
    return max(rob_linear(0, n - 1), rob_linear(1, n))