class TreeNode:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

def is_subtree(root, subroot):
    if not subroot:
        return True
    if not root:
        return False
    if is_same_tree(root, subroot):
        return True
    
    return is_subtree(root.left, subroot) or is_subtree(root.right, subroot)

def is_same_tree(root, subroot):
    if not root and not subroot:
        return True
    if not root or not subroot:
        return False
    if root.data != subroot.data:
        return False
    
    return is_same_tree(root.left, subroot.left) and is_same_tree(root.right, subroot.right)