def merge(intervals: List[List[int]]) -> List[List[int]]:
    intervals.sort()
    stack = [intervals[0]]
    for interval in intervals:
        if stack[-1][1] >= interval[0]:
            stack[-1][1] = max(stack[-1][-1], interval[-1])
        else:
            stack.append(interval)
    return stack