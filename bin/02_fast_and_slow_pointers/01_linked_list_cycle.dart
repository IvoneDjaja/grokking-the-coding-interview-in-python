class ListNode {
  ListNode({this.val = 0, this.next = null});

  final int val;
  ListNode? next;
}

void main() {
  bool detectCycle(ListNode node) {
    final dummy = ListNode(val: -1, next: node);
    ListNode? slow = dummy;
    ListNode? fast = dummy;

    while (fast?.next != null && fast?.next?.next != null) {
      slow = slow?.next;
      fast = fast?.next?.next;
      if (slow?.val == fast?.val) {
        return true;
      }
    }

    return false;
  }

  // CASE 1
  final node15 = ListNode(val: 10);
  final node14 = ListNode(val: 8, next: node15);
  final node13 = ListNode(val: 6, next: node14);
  final node12 = ListNode(val: 4, next: node13);
  final node11 = ListNode(val: 2, next: node12);
  node15.next = node12;
  print(detectCycle(node11));

  // CASE 2
  final node25 = ListNode(val: 9);
  final node24 = ListNode(val: 7, next: node25);
  final node23 = ListNode(val: 5, next: node24);
  final node22 = ListNode(val: 3, next: node23);
  final node21 = ListNode(val: 1, next: node22);
  print(detectCycle(node21));

  // CASE 3
  final node36 = ListNode(val: 6);
  final node35 = ListNode(val: 5, next: node36);
  final node34 = ListNode(val: 3, next: node35);
  final node33 = ListNode(val: 3, next: node34);
  final node32 = ListNode(val: 2, next: node33);
  final node31 = ListNode(val: 1, next: node32);
  print(detectCycle(node31));
}
