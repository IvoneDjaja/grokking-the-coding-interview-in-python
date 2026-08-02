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
    while (current1 != null || current2 != null || carry > 0) {
      final val1 = current1?.val ?? 0;
      final val2 = current2?.val ?? 0;
      final total = val1 + val2 + carry;
      final result = total % 10;
      carry = total ~/ 10;
      current?.next = ListNode(val: result);
      current = current?.next;
      current1 = current1?.next;
      current2 = current2?.next;
    }
    return head.next;
  }

  /// CASE 1
  final input11 = ListNode(val: 3, next: ListNode(val: 5));
  final input12 = ListNode(val: 1, next: ListNode(val: 4));
  var output1 = addTwoNumbers(input11, input12);
  while (output1 != null) {
    print(output1.val);
    output1 = output1.next;
  }

  /// CASE 2
  final input21 = ListNode(val: 8);
  final input22 = ListNode(val: 9, next: ListNode(val: 9));
  var output2 = addTwoNumbers(input21, input22);
  while (output2 != null) {
    print(output2.val);
    output2 = output2.next;
  }

  /// CASE 3
  final input31 = ListNode(val: 1, next: ListNode(val: 2));
  final input32 = ListNode(val: 0);
  var output3 = addTwoNumbers(input31, input32);
  while (output3 != null) {
    print(output3.val);
    output3 = output3.next;
  }

  /// CASE 4
  final input41 = ListNode(val: 0);
  final input42 = ListNode(val: 0);
  var output4 = addTwoNumbers(input41, input42);
  while (output4 != null) {
    print(output4.val);
    output4 = output4.next;
  }

  /// CASE 5
  final input51 = ListNode(val: 9, next: ListNode(val: 9));
  final input52 = ListNode(val: 7, next: ListNode(val: 7));
  var output5 = addTwoNumbers(input51, input52);
  while (output5 != null) {
    print(output5.val);
    output5 = output5.next;
  }
}
