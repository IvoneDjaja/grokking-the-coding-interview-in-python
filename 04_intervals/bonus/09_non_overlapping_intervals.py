def eraseOverlapIntervals(intervals: List[List[int]]) -> int:
    intervals.sort(key=lambda x: x[1])
    count = 0
    prevEnd = intervals[0][1]
    for i in range(1, len(intervals)):
        if intervals[i][0] < prevEnd:
            count += 1
        else:
            prevEnd = intervals[i][1]
    return count