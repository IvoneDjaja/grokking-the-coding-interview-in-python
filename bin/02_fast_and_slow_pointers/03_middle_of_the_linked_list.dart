class ListNode {
  ListNode({this.val = 0, this.next});

  final int val;
  ListNode? next;
}

void main() {
  ListNode? getMiddleNode(ListNode head) {
    final dummy = ListNode(val: -1, next: head);
    ListNode? slow = dummy;
    ListNode? fast = dummy;

    while (fast?.next != null && fast?.next?.next != null) {
      slow = slow?.next;
      fast = fast?.next?.next;
    }

    return slow?.next;
  }

  // CASE 1
  final node15 = ListNode(val: 5);
  final node14 = ListNode(val: 4, next: node15);
  final node13 = ListNode(val: 3, next: node14);
  final node12 = ListNode(val: 2, next: node13);
  final node11 = ListNode(val: 1, next: node12);
  print(getMiddleNode(node11)?.val);

  // CASE 2
  final node26 = ListNode(val: 6);
  final node25 = ListNode(val: 4, next: node26);
  final node24 = ListNode(val: 4, next: node25);
  final node23 = ListNode(val: 3, next: node24);
  final node22 = ListNode(val: 2, next: node23);
  final node21 = ListNode(val: 1, next: node22);
  print(getMiddleNode(node21)?.val);

  // CASE 3
  final node32 = ListNode(val: 2);
  final node31 = ListNode(val: 1, next: node32);
  print(getMiddleNode(node31)?.val);
}
