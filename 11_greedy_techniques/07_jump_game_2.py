def jumpGame2(nums):
    n = len(nums)
    jumps = 0
    end = 0
    maxRange = 0
    for i in range(n-1):
        num = nums[i]
        jump = i + num
        maxRange = max(maxRange, jump)
        if i == end:
            jumps += 1
            end = maxRange
            if maxRange >= n -1:
                break
                
    return jumps