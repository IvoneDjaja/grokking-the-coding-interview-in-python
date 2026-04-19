class ListNode {
  ListNode({this.val = 0, this.next = null});
  int val;
  ListNode? next;
}

void main() {
  ListNode? reverseKGroups(ListNode head, int k) {
    final dummy = ListNode(val: -1, next: head);

    ListNode? current = head;
    ListNode? currentGroup = dummy;
    ListNode? prev = null;
    while (current?.next != null) {
      var count = 0;
      var startGroup = current;

      var checkCount = 0;
      ListNode? checkCurrent = current;
      while (checkCurrent?.next != null && checkCount < k) {
        checkCount += 1;
        checkCurrent = checkCurrent?.next;
      }

      if (checkCount == k) {
        while (current?.next != null && count < k) {
          final next = current?.next;
          current?.next = prev;
          prev = current;
          current = next;
          count += 1;
        }
        currentGroup?.next = prev;
        currentGroup = startGroup;
      } else {
        currentGroup?.next = startGroup;

        while (current?.next != null) {
          current = current?.next;
        }
      }
    }

    return dummy.next;
  }

  // CASE 1
  final k1 = 3;
  final node15 = ListNode(val: 5, next: null);
  final node14 = ListNode(val: 4, next: node15);
  final node13 = ListNode(val: 3, next: node14);
  final node12 = ListNode(val: 2, next: node13);
  final node11 = ListNode(val: 1, next: node12);
  ListNode? output1 = reverseKGroups(node11, k1);

  while (output1 != null) {
    print(output1.val);
    output1 = output1.next;
  }
}
