class TreeNode:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

def get_max_depth(root: TreeNode) -> int:
	if not root:
		return 0

	if not root.left and not root.right:
		return 1
	
	return 1 + max(get_max_depth(root.left), get_max_depth(root.right))
