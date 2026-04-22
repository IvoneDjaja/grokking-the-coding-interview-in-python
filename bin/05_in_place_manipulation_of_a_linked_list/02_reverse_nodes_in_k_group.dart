class ListNode {
  ListNode({this.val = 0, this.next = null});
  int val;
  ListNode? next;
}

void main() {
  ListNode? reverseKGroups(ListNode head, int k) {
    final dummy = ListNode(val: -1, next: head);
    ListNode? groupBefore = dummy;

    while (true) {
      ListNode? kNode = groupBefore;
      for (var i = 0; i < k && kNode != null; i++) {
        kNode = kNode.next;
      }

      if (kNode == null) {
        break;
      }

      ListNode? groupAfter = kNode.next;
      ListNode? prev = groupAfter;
      ListNode? current = groupBefore?.next;

      for (var i = 0; i < k; i++) {
        ListNode? next = current?.next;
        current?.next = prev;
        prev = current;
        current = next;
      }

      ListNode? oldHead = groupBefore?.next;
      groupBefore?.next = kNode;
      groupBefore = oldHead;
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
