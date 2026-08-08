def largest_rectangle(heights: list[int]) -> int:
    n = len(heights)
    stack = []
    maxArea = 0
    for i in range(n + 1):
        while len(stack) > 0 and (i == n or heights[stack[-1]] > heights[i]):
            prev = stack.pop()
            prevHeight = heights[prev]
            width = i if not stack else i - stack[-1] - 1
            maxArea = max(maxArea, prevHeight * width)
        stack.append(i)
    return maxArea

input1 = [1, 3, 4, 2, 2]
print(largest_rectangle(input1))
input2 = [2, 4, 5, 6, 3]
print(largest_rectangle(input2))
input3 = [6,2,5,4,5,1,6,4,2]
print(largest_rectangle(input3))
input4 = [2, 1, 3, 3]
print(largest_rectangle(input4))