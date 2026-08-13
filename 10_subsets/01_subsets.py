def subsets(nums: List[int]):
	output = []
	
	def backtrack(path, start):
		output.append(path.copy)
		for i in range(start, len(nums)):
			path.append(nums[i])
			backtrack(path, i + 1)
			path.pop()
	
	backtrack([], 0)
	return output
