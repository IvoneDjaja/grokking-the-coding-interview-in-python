from typing import List


def houseRobber2(nums: List[int]) -> int:
	n = len(nums)
	first = 0
	second = 0
	for i in range(n - 1):
		temp = max(second, first + nums[i])
		first, second = second, temp
	maxFirst = second

	first = 0
	second = 0
	for i in range(1, n + 1):
		temp = max(second, first + nums[i])
		first, second = second, temp
	maxSecond = second

	return max(nums[0], maxFirst, maxSecond)