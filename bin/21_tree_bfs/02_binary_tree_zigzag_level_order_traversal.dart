import 'dart:collection';

class TreeNode {
  const TreeNode({required this.data, this.left, this.right});

  final int data;
  final TreeNode? left;
  final TreeNode? right;
}

void main() {
  List<List<int>> zigzagLevelOrder(TreeNode? root) {
    final output = <List<int>>[];
    if (root == null) {
      return output;
    }

    final queue = Queue<TreeNode>()..add(root);
    var leftToRight = true;
    while (queue.isNotEmpty) {
      final levelLength = queue.length;
      final levelOutput = <int>[];
      for (var i = 0; i < levelLength; i++) {
        final node = queue.removeFirst();
        levelOutput.add(node.data);
        if (node.left != null) {
          queue.add(node.left!);
        }
        if (node.right != null) {
          queue.add(node.right!);
        }
      }
      var levelOutputCopy = levelOutput.sublist(0);
      if (!leftToRight) {
        levelOutputCopy = levelOutputCopy.reversed.toList();
      }
      output.add(levelOutputCopy);
      leftToRight = !leftToRight;
    }
    return output;
  }

  /// CASE 1
  final node14 = TreeNode(data: 4);
  final node15 = TreeNode(data: 5);
  final node16 = TreeNode(data: 6);
  final node12 = TreeNode(data: 2, left: node14, right: node15);
  final node13 = TreeNode(data: 3, right: node16);
  final node11 = TreeNode(data: 1, left: node12, right: node13);
  print(zigzagLevelOrder(node11));
}
