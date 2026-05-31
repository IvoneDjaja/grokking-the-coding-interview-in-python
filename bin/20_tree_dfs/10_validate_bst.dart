class TreeNode {
  const TreeNode({required this.data, this.left, this.right});

  final int data;
  final TreeNode? left;
  final TreeNode? right;
}

void main() {
  bool validateBst(TreeNode? node) {
    bool dfs(TreeNode? node, int min, int max) {
      if (node == null) {
        return true;
      }
      if (node.data < min || node.data > max) {
        return false;
      }
      final left = dfs(node.left, min, node.data);
      final right = dfs(node.right, node.data, max);

      return left && right;
    }

    return dfs(node, 1, 500);
  }

  /// CASE 1
  final node12 = TreeNode(data: 2);
  final node14 = TreeNode(data: 4);
  final node13 = TreeNode(data: 3, left: node12, right: node14);
  final node16 = TreeNode(data: 6);
  final node15 = TreeNode(data: 5, left: node13, right: node16);
  print(validateBst(node15));

  /// CASE 2
  final node25 = TreeNode(data: 5);
  final node28 = TreeNode(data: 8);
  final node27 = TreeNode(data: 7, left: node25, right: node28);
  final node22 = TreeNode(data: 2);
  final node26 = TreeNode(data: 6, left: node22, right: node27);
  print(validateBst(node26));

  /// CASE 3
  final node5215 = TreeNode(data: 5215);
  print(validateBst(node5215));

  /// CASE 4
  /// [6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,null,6776,6776,null,6776,6776,6776,6776,6776,6776,6776,6776,null,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,null,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,null,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,null,6776,6776,6776,6776,6776,6776,null,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,null,6776,6776,null,null,null,null,null,null,null,6776,null,null,null,null,6776,6776,6776,6776,null,null,6776,6776,6776,6776,null,null,null,null,6776,6776,6776,null,6776,null,null,null,null,6776,null,6776,6776,6776,null,6776,6776,null,6776,null,6776,6776,6776,6776,null,null,6776,6776,6776,null,6776,6776,null,null,6776,6776,6776,6776,6776,null,null,6776,6776,null,6776,null,6776,null,6776,6776,null,null,6776,6776,6776,null,6776,6776,null,null,null,null,6776,6776,6776,6776,6776,null,null,null,null,6776,null,null,null,6776,6776,null,null,6776,6776,6776,null,null,6776,6776,null,6776,6776,6776,null,null,null,6776,6776,6776,6776,6776,null,6776,6776,6776,6776,6776,6776,6776,6776,6776,null,6776,6776,null,6776,6776,6776,6776,6776,null,null,6776,6776,null,6776,6776,6776,6776,6776,6776,6776,null,6776,6776,6776,null,null,6776,6776,6776,null,6776,6776,6776,6776,6776,6776,6776,null,6776,6776,6776,null,null,6776,6776,null,null,6776,6776,null,null,null,null,null,6776,6776,6776,6776,6776,6776,6776,6776,6776,6776,null,6776,6776,6776,6776,6776,6776,6776,6776,null,null,6776,6776,null,6776,6776,6776,6776,6776,6776,null,null,null,null,6776,6776,6776,6776,6776,6776,null,6776,6776,6776,6776,null,6776,6776,null,null,6776,null,null,null,null,6776,6776,6776,null,null,null,null,null,null,null,null,6776,6776,null,null,null,null,null,null,6776,6776,null,6776,6776,6776,null,null,6776,6776,6776,null,6776,6776,6776,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,6776,null,null,null,null,null,null,null,null,null,null,null,null,null,6776,6776,null,6776,null,null,null,null,6776,6776,null,null,null,null,null,null,6776,null,6776,null,6776,null,null,null,null,null,null,6776,null,null,6776,null,null,null,null,null,null,null,6776,null,null,null,null,null,null,null,null,null,null,null,null,null,6776,6776,null,null,null,6776,6776,null,null,null,null,null,null,null,null,null,null,null,null,null,6776,6776,null,6776,null,6776,null,null,6776,6776,6776,null,6776,6776,6776,null,null,6776,6776,null,null,null,null,null,null,null,null,null,null,null,6776,null,null,null,6776,null,null,null,6776,null,null,null,6776,null,6776,null,null,null,null,null,null,6776,6776,null,6776,null,null,6776,6776,null,6776,null,6776,null,null,null,null,6776,6776,null,null,6776,null,6776,6776,6776,null,6776,6776,null,null,null,null,null,null,null,6776,null,6776,null,null,null,null,null,null,null,null,null,null,6776,null,null,null,6776,null,6776,null,null,6776,null,6776,6776,null,null,null,6776,null,null,null,null,null,6776,6776,6776,null,6776,6776,null,null,null,6776,null,6776,null,null,6776,null,null,null,null,null,null,6776,null,null,null,null,null,6776,null,null,null,null,null,null,null,null,6776,null,6776,null,null,null,null,null,null,null,null,null,null,null,null,null,6776,null,null,null,null,null,6776,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,6776,null,null,null,null,null,null,null,null,null,6776,6776,null,null,null,null,null,null,null,6776,null,null,6776,null,null,null,null,null,null,null,null,null,null,null,null,null,6776,null,null,null,null,null,6776,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,6776,null,null,6776,null,null,null,null,null,null,null,null,null,null,null,null,null,6776,null,null,null,null,null,null,null,null,null,6776,null,null,null,null,null,null,null,null,null,null,null,null,null,null,6776,null,6776]
}
