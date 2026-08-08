import heapq

class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def merge_k_lists(lists):
    min_heap = []
    heapq.heapify(min_heap)

    for list in lists:
        current = list
        while current is not None:
            heapq.heappush(min_heap, current.val)
            current = current.next

    head = ListNode()
    current = head
    while min_heap:
        next = heapq.heappop(min_heap)
        current.next = ListNode(next)
        current = current.next
	
    return head.next