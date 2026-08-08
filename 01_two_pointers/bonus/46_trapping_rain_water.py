def rain_water(heights: list[int]):
    n = len(heights)
    start = 0
    end = n -1

    area = 0
    maxLeftHeight = 0
    maxRightHeight = 0
    while start < end:
        leftHeight = heights[start]
        rightHeight = heights[end]
        height = min(leftHeight, rightHeight)
        if leftHeight < rightHeight:
            if height > 0:
                maxLeftHeight = max(maxLeftHeight, height)
            area += maxLeftHeight - height
            start += 1
        else:
            if height > 0:
                maxRightHeight = max(maxRightHeight, height)
            area += maxRightHeight - height
            end -= 1
    return area

input1 = [3, 1, 0, 2, 1]
input2 = [2, 0, 1, 0, 2, 3]
input3 = [4,2,0,3,1,5]
input4 = [0,3,0,2,1,0,1,4,2,1,2,0]
print(rain_water(input1))
print(rain_water(input2))
print(rain_water(input3))
print(rain_water(input4))