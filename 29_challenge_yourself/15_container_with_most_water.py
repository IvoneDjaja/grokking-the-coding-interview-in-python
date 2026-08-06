def container_with_most_water(height):
    n = len(height)
    start = 0
    end = n - 1
    
    maxWater = 0
    while start < end:
        heightStart = height[start]
        heightEnd = height[end]
        water = min(heightStart, heightEnd) * (end - start)
        maxWater = max(maxWater, water)
        if heightStart < heightEnd:
            start += 1
            newHeightStart = height[start]
            maxWater = max(maxWater, min(heightStart, newHeightStart))
        else:
            end -= 1
            newHeightEnd= height[end]
            maxWater = max(maxWater, min(heightEnd, newHeightEnd))
    return maxWater

# CASE 5
input5 = [7, 7, 2]
print(container_with_most_water(input5))