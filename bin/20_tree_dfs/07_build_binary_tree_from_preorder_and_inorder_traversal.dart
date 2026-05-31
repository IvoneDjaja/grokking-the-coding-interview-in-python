class TreeNode {
  const TreeNode({required this.data, this.left, this.right});

  final int data;
  final TreeNode? left;
  final TreeNode? right;
}

void main() {
  TreeNode? buildTree(List<int> preorder, List<int> inorder) {
    final n = preorder.length;
    final inorderIndexMap = <int, int>{};

    for (var i = 0; i < n; i++) {
      inorderIndexMap[inorder[i]] = i;
    }

    TreeNode? dfs(List<int> preorder, List<int> inorder) {
      if (preorder.isEmpty || inorder.isEmpty) {
        return null;
      }
      final data = preorder.removeAt(0);
      final node = TreeNode(
        data: data,
        left: dfs(preorder, inorder.sublist(0, inorderIndexMap[data]!)),
        right: dfs(preorder, inorder.sublist(inorderIndexMap[data]!)),
      );

      return node;
    }

    return dfs(preorder, inorder);
  }

  /// CASE 1
  final preorder1 = [3, 9, 20, 15, 7];
  final inorder1 = [9, 3, 15, 20, 7];
  print(buildTree(preorder1, inorder1));
}
