def jumpGame(nums):
    n = len(nums)
    maxRange = 0
    for i in range(n):
        num = nums[i]
        if maxRange < i:
            return False
        jump = i + num
        maxRange = max(maxRange, jump)
        if maxRange >= n -1:
            return True
    return True