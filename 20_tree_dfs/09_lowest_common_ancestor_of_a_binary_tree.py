class TreeNode:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

def lowest_common_ancestor(self, current_node, p, q):
    if not current_node or current_node == p or current_node == q:
        return current_node
    
    left = self.lowest_common_ancestor(current_node.left, p, q)
    right = self.lowest_common_ancestor(current_node.right, p, q)
    
    if left and right:
        return current_node

    return left if left else right