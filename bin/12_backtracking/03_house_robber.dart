import 'dart:math';

class ListNode {
  ListNode({this.data = 0, this.left, this.right});

  int data;
  ListNode? left;
  ListNode? right;
}

void main() {
  List<int> backtrack(ListNode? node) {
    if (node == null) {
      return [0, 0];
    }

    final left = backtrack(node.left);
    final right = backtrack(node.right);

    final include = node.data + left.last + right.last;
    final exclude = max(left.first, left.last) + max(right.first, right.last);

    return [include, exclude.toInt()];
  }

  int rob(ListNode root) {
    final money = backtrack(root);
    return max(money.first, money.last);
  }

  /// CASE 1
  final node4 = ListNode(data: 10);
  final node5 = ListNode(data: 12);
  final node6 = ListNode(data: 3);
  final node7 = ListNode(data: 1);
  final node2 = ListNode(data: 5, left: node4, right: node5);
  final node3 = ListNode(data: 25, left: node6, right: node7);
  final node1 = ListNode(data: 3, left: node2, right: node3);
  print(rob(node1));

  /// CASE 2
  final input2 = [
    452,
    null,
    2415,
    null,
    6660,
    null,
    6445,
    null,
    3962,
    null,
    4542,
    null,
    2255,
    null,
    8598,
    null,
    5919,
    null,
    4872,
    null,
    7172,
    null,
    2263,
    null,
    1071,
    null,
    5985,
    null,
    3618,
    null,
    4071,
    null,
    9831,
    null,
    1516,
    null,
    2506,
    null,
    7749,
    null,
    988,
    null,
    2415,
    null,
    9618,
    null,
    2755,
    null,
    7374,
    null,
    5547,
    null,
    5850,
    null,
    1296,
    null,
    4556,
    null,
    3610,
    null,
    5006,
    null,
    4294,
  ];
}
