class ListNode {
  ListNode({required this.val, this.next});
  final int val;
  ListNode? next;
}

void main() {
  ListNode? addTwoNumbers(ListNode l1, ListNode l2) {
    ListNode? current1 = l1;
    ListNode? current2 = l2;
    var carry = 0;
    ListNode? head = ListNode(val: -1);
    ListNode? current = head;
    while (current1 != null && current2 != null) {
      final val1 = current1.val;
      final val2 = current2.val;
      final total = val1 + val2;
      final result = (total + carry) % 10;
      current?.next = ListNode(val: result);
      carry = total ~/ 10;
      current = head.next;
      current1 = current1.next;
      current2 = current2.next;
    }

    if (current1 != null) {
      head.next = current1;
    } else if (current2 != null) {
      head.next = current2;
    }

    return head.next;
  }

  /// CASE 1
  final input11 = ListNode(val: 3, next: ListNode(val: 5));
  final input12 = ListNode(val: 1, next: ListNode(val: 4));
  final output1 = addTwoNumbers(input11, input12);
  print(output1?.val);
  print(output1?.next?.val);
  print(output1?.next?.next?.val);
}
