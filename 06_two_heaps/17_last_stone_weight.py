def lastStoneWeight(stones):
    minHeap = []
    for stone in stones:
        minHeap.append(-stone)
    heapq.heapify(minHeap)

    while len(minHeap) > 1:
        maxStone1 = heapq.heappop(minHeap)
        maxStone2 = heapq.heappop(minHeap)
        weight = abs(maxStone1 - maxStone2)
        heapq.heappush(minHeap, -weight)

    return abs(minHeap[0])