class TreeNode {
  const TreeNode({required this.data, this.left, this.right});

  final int data;
  final TreeNode? left;
  final TreeNode? right;
}

void main() {
  String levelOrderTraversal(TreeNode? root) {
    if (root == null) {
      return 'None';
    }

    final output = <String>[];

    final queue = [root];
    while (queue.isNotEmpty) {
      final level = queue.sublist(0);
      output.add(level.map((node) => node.data).join(', '));
      queue.clear();
      while (level.isNotEmpty) {
        final node = level.removeAt(0);
        if (node.left != null) {
          queue.add(node.left!);
        }
        if (node.right != null) {
          queue.add(node.right!);
        }
      }
    }

    return output.join(' : ');
  }

  /// CASE 1
  final node14 = TreeNode(data: 4);
  final node15 = TreeNode(data: 5);
  final node16 = TreeNode(data: 6);
  final node12 = TreeNode(data: 2, left: node14, right: node15);
  final node13 = TreeNode(data: 3, right: node16);
  final node11 = TreeNode(data: 1, left: node12, right: node13);
  print(levelOrderTraversal(node11));
}
