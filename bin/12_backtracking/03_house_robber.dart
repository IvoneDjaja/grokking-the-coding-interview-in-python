import 'dart:math';

class ListNode {
  ListNode({this.val = 0, this.left, this.right});

  int val;
  ListNode? left;
  ListNode? right;
}

void main() {
  int backtrack(ListNode? node, bool isNeighbor) {
    if (node == null) {
      return 0;
    }

    var include = 0;
    var exclude = 0;
    if (isNeighbor) {
      include =
          node.val + backtrack(node.left, false) + backtrack(node.right, false);
    } else {
      exclude =
          max(backtrack(node.left, true), backtrack(node.left, false)) +
          max(backtrack(node.right, true), backtrack(node.right, false));
    }
    return max(include, exclude);
  }

  int rob(ListNode root) {
    final include = backtrack(root, true);
    final exclude = backtrack(root, false);
    return max(include, exclude);
  }

  /// CASE 1
  final node4 = ListNode(val: 10);
  final node5 = ListNode(val: 12);
  final node6 = ListNode(val: 3);
  final node7 = ListNode(val: 1);
  final node2 = ListNode(val: 5, left: node4, right: node5);
  final node3 = ListNode(val: 25, left: node6, right: node7);
  final node1 = ListNode(val: 3, left: node2, right: node3);
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
