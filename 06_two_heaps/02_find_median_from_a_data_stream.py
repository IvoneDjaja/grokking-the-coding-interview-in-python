class MedianFinder:

    def __init__(self):
        self.maxHeap = []
        self.minHeap = []

    def addNum(self, num: int) -> None:
        val = -heapq.heappushpop(self.maxHeap, -num)
        heapq.heappush(self.minHeap, val)

        if len(self.minHeap) > len(self.maxHeap):
            heapq.heappush(self.maxHeap, -heapq.heappop(self.minHeap))

    def findMedian(self) -> float:
        if len(self.maxHeap) > len(self.minHeap):
                return -self.maxHeap[0]
        return (-self.maxHeap[0] + self.minHeap[0]) / 2