def largest_rectangle(heights: list[int]) -> int:
    end = len(heights) - 1
    start = 0
    maxArea = 0
    while start <= end:
        startHeight = heights[start]
        endHeight = heights[end]
        minHeight = min(startHeight, endHeight)
        area = minHeight * (end + 1 - start)
        maxArea = max(maxArea, area)
        if startHeight < endHeight:
            start += 1
        else:
            end -= 1

    return maxArea

input1 = [1, 3, 4, 2, 2]
print(largest_rectangle(input1))
input2 = [2, 4, 5, 6, 3]
print(largest_rectangle(input2))
input3 = [6,2,5,4,5,1,6,4,2]
print(largest_rectangle(input3))