class TreeNode:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

def is_subtree(root, subroot):
    if is_same_tree(root, subroot):
        return True
    is_left_subtree = is_subtree(root.left, subroot) if root.left else False
    is_right_subtree = is_subtree(root.right, subroot) if root.right else False
    
    return is_left_subtree or is_right_subtree

def is_same_tree(root, subroot):
    if not root and not subroot:
        return True
    if not root or not subroot:
        return False
    if root.data != subroot.data:
        return False
        
    is_left_subtree = is_same_tree(root.left, subroot.left)
    is_right_subtree = is_same_tree(root.right, subroot.right)
    
    return is_left_subtree and is_right_subtree