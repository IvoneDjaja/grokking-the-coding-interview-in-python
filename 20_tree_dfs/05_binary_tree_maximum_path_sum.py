class TreeNode:
    def __init__(self, data=0, left=None, right=None):
        self.data = data
        self.left = left
        self.right = right

def maxPathSum(root: TreeNode) -> int:
	maxPathSum = float('-inf')
	def dfs(root):
		nonlocal maxPathSum
		if not root:
			return 0
		leftSum = max(dfs(root.left), 0)
		rightSum = max(dfs(root.right), 0)
		maxPathSum = max(maxPathSum, root.data + leftSum + rightSum)
		return root.data + max(leftSum, rightSum)
	
	dfs(root)
	return maxPathSum
