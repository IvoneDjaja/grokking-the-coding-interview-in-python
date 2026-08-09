class TreeNode:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

def diameter_of_binary_tree(root):
    max_diameter = 0
  
    def dfs(root):
        nonlocal max_diameter
        if not root:
            return  0
        left_height = dfs(root.left)
        right_height = dfs(root.right)
        diameter = left_height + right_height
        max_diameter = max(max_diameter, diameter)
        return 1 + max(left_height, right_height)

    dfs(root)
    return max_diameter
