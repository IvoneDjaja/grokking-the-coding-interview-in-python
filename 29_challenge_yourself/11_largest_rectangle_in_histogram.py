def largest_rectangle(arr: list[int]) -> int:
    n = len(arr)
    stack = []
    maxArea = 0
    i = 0
    while i < n:
        height = arr[i]
        while len(stack) > 0 and arr[stack[-1][1]] > height:
            prevInterval = stack.pop()
            start = prevInterval[0]
            end = prevInterval[1]
            prevHeight = arr[end]
            maxArea = max(maxArea, prevHeight * (i - end))
            if arr[i] > 0:
                stack.append([i , i])