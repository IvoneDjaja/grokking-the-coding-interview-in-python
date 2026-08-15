def canAttendMeetings(intervals):
    intervals.sort(key=lambda x: x[0])
    for i in range(len(intervals)):
        if i > 0 and intervals[i-1][1] > intervals[i][0]:
            return False
    return True