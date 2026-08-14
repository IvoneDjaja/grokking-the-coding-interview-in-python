from collections import defaultdict, deque

def taskScheduler(tasks):
    maxHeap = []
    countMap = defaultdict(int)
    for task in tasks:
        countMap[task] -= 1

    maxHeap = list(countMap.values())
    heapq.heapify(maxHeap)
    queue = deque()
    time = 0
    while maxHeap or queue:
        time += 1
        if maxHeap:
            count = heapq.heappop(maxHeap) + 1
            if count < 0:
                queue.append([count, time + n])
        else:
            time = queue[0][1]
        if queue and queue[0][1] == time:
            heapq.heappush(maxHeap, queue.popleft()[0])
    return time
