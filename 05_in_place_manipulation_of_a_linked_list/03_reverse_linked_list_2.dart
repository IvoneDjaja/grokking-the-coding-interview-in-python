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

  ListNode? reverseBetween(ListNode head, int left, int right) {
    final dummy = ListNode(val: 0, next: head);

    ListNode? start = dummy;
    ListNode? groupPrev = dummy;
    for (var i = 0; i < left; i++) {
      groupPrev = start;
      start = start?.next;
    }

    ListNode? end = dummy;
    for (var i = 0; i < right; i++) {
      end = end?.next;
    }

    groupPrev?.next = null;
    final groupNext = end?.next;
    end?.next = null;

    final newStart = reverse(start);
    groupPrev?.next = newStart;
    start?.next = groupNext;

    return groupPrev?.next;
  }

  // CASE 1
  final node17 = ListNode(val: 7);
  final node18 = ListNode(val: 8, next: node17);
  final node16 = ListNode(val: 6, next: node18);
  var output1 = reverseBetween(node16, 1, 2);
  while (output1 != null) {
    print(output1.val);
    output1 = output1.next;
  }

  // CASE 2
  final node25 = ListNode(val: 5);
  final node24 = ListNode(val: 4, next: node25);
  final node23 = ListNode(val: 3, next: node24);
  final node22 = ListNode(val: 2, next: node23);
  final node21 = ListNode(val: 1, next: node22);
  var output2 = reverseBetween(node21, 2, 4);
  while (output2 != null) {
    print(output2.val);
    output2 = output2.next;
  }
}
