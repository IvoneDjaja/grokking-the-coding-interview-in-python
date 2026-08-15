def eraseOverlapIntervals(intervals: List[List[int]]) -> int:
    intervals.sort()
    stack = []
    count = 0
    for interval in intervals:
        if stack and stack[-1][1] > interval[0]:
            count += 1
            stack[-1][-1] = min(stack[-1][-1], interval[1])
        else:
            stack.append(interval)
    return count