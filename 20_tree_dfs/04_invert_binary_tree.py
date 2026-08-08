class TreeNode:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

def invert_binary_tree(root: TreeNode) -> TreeNode:
    if not root:
        return

    root.right, root.left = root.left, root.right
    invert_binary_tree(root.left)
    invert_binary_tree(root.right)

    return root