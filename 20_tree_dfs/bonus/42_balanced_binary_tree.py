class TreeNode:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

def balanced_binary_tree(root: TreeNode) -> bool:
	return dfs(root)[1]

def dfs(root: TreeNode) -> TreeNode:
    if not root:
        return [0, True]
    left_result = dfs(root.left)
    right_result = dfs(root.right)
    left_height = left_result[0]
    right_height = right_result[0]
    result = abs(left_height - right_height) <= 1
    return [1 + max(left_height, right_height), left_result[1] and right_result[1] and result]