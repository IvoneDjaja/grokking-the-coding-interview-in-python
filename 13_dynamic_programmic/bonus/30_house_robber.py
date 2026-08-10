from typing import List


def houseRobber(nums: List[int]) -> int:
	n = len(nums)
	first = 0
	second = 0
	for i in range(n):
		temp = max(second, first + nums[i])
		first, second = second, temp

	return second