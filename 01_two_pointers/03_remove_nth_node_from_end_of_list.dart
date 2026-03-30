class ListNode {
  ListNode({this.val = 0, this.next = null});

  final int val;
  ListNode? next;
}

void main() {
  ListNode? removeNthLastNode(ListNode? head, int n) {
    if (head == null) {
      return null;
    } else if (n == 1) {
      return head.next;
    }

    ListNode? slowPointer = head;
    ListNode? fastPointer = head.next;

    var index = 0;
    while (fastPointer != null && index < n - 2) {
      slowPointer = slowPointer?.next;
      fastPointer = fastPointer.next;
      index += 1;
    }
    if (slowPointer?.next != null) {
      slowPointer!.next = fastPointer?.next;
    }
    return head;
  }

  // CASE 1
  final node5 = ListNode(val: 19, next: null);
  final node4 = ListNode(val: 17, next: node5);
  final node3 = ListNode(val: 15, next: node4);
  final node2 = ListNode(val: 13, next: node3);
  final node1 = ListNode(val: 11, next: node2);
  final head = removeNthLastNode(node1, 3);
  print(head?.val);
  print(head?.next?.val);
  print(head?.next?.next?.val);
  print(head?.next?.next?.next?.val);
  print(head?.next?.next?.next?.next?.val);
}
