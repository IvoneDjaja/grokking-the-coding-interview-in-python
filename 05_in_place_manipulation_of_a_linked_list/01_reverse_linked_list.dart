class ListNode {
  ListNode({this.val = 0, this.next = null});

  int val;
  ListNode? next;
}

void main() {
  ListNode? reverse(ListNode head) {
    var prev = null;
    ListNode? current = head;

    while (current != null) {
      final next = current.next;
      current.next = prev;
      prev = current;
      current = next;
    }
    return prev;
  }

  // CASE 1
  final node7 = ListNode(val: 7);
  final node8 = ListNode(val: 8, next: node7);
  final node6 = ListNode(val: 6, next: node8);
  final reverseLinkedList = reverse(node6);
  print(reverseLinkedList?.val);
  print(reverseLinkedList?.next?.val);
  print(reverseLinkedList?.next?.next?.val);
}
