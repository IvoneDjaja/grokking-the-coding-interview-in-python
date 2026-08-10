from typing import List


def houseRobber(nums: List[int]) -> int:
	n = len(nums)
	if len(nums) < 2:
		return nums[0]
	if len(nums) == 2:
		return max(nums[0], nums[1])

	first = nums[0]
	second = nums[1]
	for i in range(2, n):
		first, second = second, max(second, nums[i] + first)

	return second