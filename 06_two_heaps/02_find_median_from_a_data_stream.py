class MedianFinder:

    def __init__(self):
        self.maxHeap = []
        self.minHeap = []
        self.length = 0
        heapq.heapify(self.minHeap)
        heapq.heapify(self.maxHeap)

    def addNum(self, num: int) -> None:
        self.length += 1

        if self.minHeap and num > self.minHeap[0]:
            minRight = heapq.heappop(self.minHeap)
            heapq.heappush(self.minHeap, num)
            heapq.heappush(self.maxHeap, -minRight)
        else:
            heapq.heappush(self.maxHeap, -num)

        while len(self.maxHeap) - len(self.minHeap) > 1:
            maxLeft = abs(heapq.heappop(self.maxHeap))
            heapq.heappush(self.minHeap, maxLeft)

    def findMedian(self) -> float:
        maxLeft = -self.maxHeap[0]
        if self.length % 2 != 0:
            return maxLeft
        elif self.minHeap:
            maxRight = self.minHeap[0]
            return (maxLeft + maxRight) / 2