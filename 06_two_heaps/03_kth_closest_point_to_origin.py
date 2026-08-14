def kthClosestPointsToOrigin(points, k):
	minHeap = []
	for i, j in points:
		distance = math.sqrt(i ** 2 + j ** 2)
		minHeap.append([distance, (i, j)])
	heapq.heapify(minHeap)

	n = len(minHeap)
	output = []
	while k > 0 and len(minHeap) > 0:
		output.append(heapq.heappop(minHeap)[1])
		k -= 1
		
	return output