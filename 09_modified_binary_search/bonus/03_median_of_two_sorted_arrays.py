def median_of_two_sorted_arrays(nums1: list[int], nums2: list[int]) -> int:
	if len(nums1) > len(nums2):
		nums1, nums2 = nums2, nums1
	m = len(nums1)
	n = len(nums2)
	low = 0
	high = m

	while low <= high:
		partition1 = (low + high) // 2
		partition2 = (m + n + 1) // 2 - partition1

		maxLeft1 = float('-inf') if partition1 == 0 else nums1[partition1-1]
		minRight1 = float('inf') if partition1 == m else nums1[partition1]
		maxLeft2 = float('-inf') if partition2 == 0 else nums2[partition2-1]
		minRight2 = float('inf') if partition2 == n else nums2[partition2]

		if maxLeft1 <= minRight2 and maxLeft2 <= minRight1:
			if (m + n) % 2 == 1:
				return max(maxLeft1, maxLeft2)
			else:
				return (max(maxLeft1, maxLeft2) + min(minRight1, minRight2)) / 2
		elif maxLeft1 > minRight2:
			high = partition1 - 1
		else:
			low = partition1 + 1

input11 = [1, 3, 5]
input12 = [2, 4, 6]
input21 = [1, 3, 5]
input22 = [2, 4, 6, 7]
print(median_of_two_sorted_arrays(input11, input12))
print(median_of_two_sorted_arrays(input21, input22))