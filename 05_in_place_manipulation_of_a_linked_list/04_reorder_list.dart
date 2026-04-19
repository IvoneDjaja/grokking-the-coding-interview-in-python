class ListNode {
  ListNode({this.val = 0, this.next = null});
  int val;
  ListNode? next;
}

void main() {
  ListNode? reverse(ListNode? head) {
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

  ListNode? reorderList(ListNode head) {
    final dummy = ListNode(val: -1, next: head);
    dummy.next = head;

    ListNode? slow = head;
    ListNode? fast = head;
    while (fast?.next != null && fast?.next?.next != null) {
      slow = slow?.next;
      fast = fast?.next?.next;
    }

    ListNode? secondHalf = reverse(slow?.next);
    secondHalf = reverse(slow?.next);

    ListNode? current = head;
    while (current != null) {
      final next1 = current.next;
      current.next = secondHalf;
      final next2 = secondHalf?.next;
      secondHalf?.next = next1;
      current = next1;
      secondHalf = next2;
    }
    return dummy.next;
  }

  // Case 1
  final node17 = ListNode(val: 7);
  final node18 = ListNode(val: 8, next: node17);
  final node16 = ListNode(val: 6, next: node18);

  ListNode? output1 = reorderList(node16);
  while (output1 != null) {
    print(output1.val);
    output1 = output1.next;
  }

  // Case 2
  final node22 = ListNode(val: 2);
  final node28 = ListNode(val: 8, next: node22);
  final node20 = ListNode(val: 0, next: node28);
  final node29 = ListNode(val: 9, next: node20);

  ListNode? output2 = reorderList(node29);
  while (output2 != null) {
    print(output2.val);
    output2 = output2.next;
  }
}
