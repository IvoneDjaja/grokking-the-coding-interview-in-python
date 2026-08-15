def insert(intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:    
    n = len(intervals)
    index = 0
    result = []

    while index < n and intervals[index][1] < newInterval[0]:
        result.append(intervals[index])
        index += 1

    while index < n and intervals[index][0] <= newInterval[1]:
        newInterval[0] = min(intervals[index][0], newInterval[0])
        newInterval[1] = max(intervals[index][1], newInterval[1])
        index += 1

    result.append(newInterval)

    while index < n:
        result.append(intervals[index])
        index += 1

    return result