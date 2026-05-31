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

    var preorderIndex = 0;
    TreeNode? dfs(int start, int end) {
      if (start > end) {
        return null;
      }
      final data = preorder[preorderIndex];
      preorderIndex++;

      final pivot = inorderIndexMap[data]!;
      final node = TreeNode(
        data: data,
        left: dfs(start, pivot - 1),
        right: dfs(pivot + 1, end),
      );

      return node;
    }

    return dfs(0, n - 1);
  }

  /// CASE 1
  final preorder1 = [3, 9, 20, 15, 7];
  final inorder1 = [9, 3, 15, 20, 7];
  print(buildTree(preorder1, inorder1)!.data);

  /// CASE 2
  final preorder2 = [10, 20, 40, 50, 30, 60];
  final inorder2 = [40, 20, 50, 10, 60, 30];
  print(buildTree(preorder2, inorder2)!.data);
}
