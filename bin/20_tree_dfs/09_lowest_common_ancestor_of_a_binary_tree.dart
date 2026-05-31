class TreeNode {
  const TreeNode({required this.data, this.left, this.right});

  final int data;
  final TreeNode? left;
  final TreeNode? right;
}

void main() {
  TreeNode? lowestCommonAncestor(TreeNode? root, TreeNode p, TreeNode q) {
    if (root == null) {
      return root;
    }

    final left = lowestCommonAncestor(root.left, p, q);
    final right = lowestCommonAncestor(root.right, p, q);

    if (left?.data == p.data && right?.data == q.data) {
      return root;
    } else if (right?.data == p.data && left?.data == q.data) {
      return root;
    } else if (root.data == p.data || root.data == q.data) {
      return root;
    } else {
      return root;
    }
  }

  /// CASE 1
  final node4 = TreeNode(data: 4);
  final node5 = TreeNode(data: 5);
  final node6 = TreeNode(data: 6);
  final node7 = TreeNode(data: 7);
  final node2 = TreeNode(data: 2, left: node4, right: node5);
  final node3 = TreeNode(data: 3, left: node6, right: node7);
  final node1 = TreeNode(data: 1, left: node2, right: node3);
  print(lowestCommonAncestor(node1, node4, node5)?.data);
}
