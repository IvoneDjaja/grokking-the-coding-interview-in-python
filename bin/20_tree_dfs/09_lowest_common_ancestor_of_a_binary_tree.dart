class TreeNode {
  const TreeNode({required this.data, this.left, this.right});

  final int data;
  final TreeNode? left;
  final TreeNode? right;
}

void main() {
  TreeNode? lowestCommonAncestor(TreeNode? node, TreeNode p, TreeNode q) {
    if (node == null || node == p || node == q) {
      return node;
    }

    final left = lowestCommonAncestor(node.left, p, q);
    final right = lowestCommonAncestor(node.right, p, q);

    if (left != null && right != null) {
      return node;
    }

    return left ?? right;
  }

  /// CASE 1
  final node14 = TreeNode(data: 4);
  final node15 = TreeNode(data: 5);
  final node16 = TreeNode(data: 6);
  final node17 = TreeNode(data: 7);
  final node12 = TreeNode(data: 2, left: node14, right: node15);
  final node13 = TreeNode(data: 3, left: node16, right: node17);
  final node11 = TreeNode(data: 1, left: node12, right: node13);
  print(lowestCommonAncestor(node11, node14, node15)?.data);

  /// CASE 1
  print(lowestCommonAncestor(node11, node14, node17)?.data);
}
