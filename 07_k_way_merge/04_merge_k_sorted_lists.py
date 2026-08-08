import heapq

class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

import heapq

def merge_k_lists(lists):
    if len(lists) == 0:
        return None

    merged = [lists[0]]
    for i in range(1, len(lists)):
        list1 = merged.pop()
        list2 = lists[i]
        merged.append(merge_two_lists(list1, list2))

    return merged.pop()
    
def merge_two_lists(list1, list2):
    current1 = list1
    current2 = list2
    dummy = ListNode()
    current = dummy
    
    while current1 and current2:
        if current1.val < current2.val:
            current.next = current1
            current1 = current1.next
        else:
            current.next = current2
            current2 = current2.next
        current = current.next
    if current1:
        current.next = current1
    if current2:
        current.next = current2
    
    return dummy.next

# TC: O(n log k)
# SC: O(k)
# where k is the total number of lists and n is the total number of nodes across k lists