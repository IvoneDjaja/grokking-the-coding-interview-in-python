class TreeNode:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

def balanced_binary_tree(root: TreeNode) -> bool:
	return dfs(root) != -1

def dfs(root: TreeNode) -> TreeNode:
    if not root:
        return 0
    left_height = dfs(root.left)
    right_height = dfs(root.right)
    if left_height == -1 or right_height == -1:
         return -1
    isBalanced = abs(left_height - right_height) <= 1
    return 1 + max(left_height, right_height) if isBalanced else -1