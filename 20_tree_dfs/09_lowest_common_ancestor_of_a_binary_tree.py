class TreeNode:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

def lowest_common_ancestor(current_node, p, q):
    current = current_node

    while current:
        if p.data < current.data and q.data < current.data:
            current = current.left
        elif p.data > current.data and q.data > current.data:
            current = current.right
        else:
            return current