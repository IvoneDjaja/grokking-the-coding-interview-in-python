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
        if start < end:
            start += 1
        else:
            end -= 1
    return maxWater

# CASE 5
input5 = [7, 7, 2]
print(container_with_most_water(input5))