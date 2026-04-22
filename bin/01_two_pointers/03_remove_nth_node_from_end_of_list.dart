class ListNode {
  ListNode({this.val = 0, this.next = null});

  final int val;
  ListNode? next;
}

void main() {
  ListNode? removeNthLastNode(ListNode? head, int n) {
    final dummy = ListNode(val: 0, next: head);
    ListNode? slowPointer = dummy;
    ListNode? fastPointer = head;

    for (var index = 0; index < n; index++) {
      fastPointer = fastPointer?.next;
    }
    if (fastPointer?.next != null) {
      slowPointer = slowPointer.next;
      fastPointer = fastPointer?.next;
    }
    slowPointer?.next = slowPointer.next?.next;
    return dummy.next;
  }

  // CASE 1
  final node5 = ListNode(val: 19, next: null);
  final node4 = ListNode(val: 17, next: node5);
  final node3 = ListNode(val: 15, next: node4);
  final node2 = ListNode(val: 13, next: node3);
  final node1 = ListNode(val: 11, next: node2);
  final head = removeNthLastNode(node1, 3);
  var current = head;
  while (current != null) {
    print(current.val);
    current = current.next;
  }
}
