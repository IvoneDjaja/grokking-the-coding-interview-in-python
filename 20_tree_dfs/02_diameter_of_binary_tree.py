class TreeNode:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

def diameter_of_binary_tree(root):
  result = dfs(root)
  return result[1]
  
def dfs(root):
  if not root:
    return [0, 0]
  if not root.left and not root.right:
    return [1, 0]
  leftResult = dfs(root.left)
  rightResult = dfs(root.right)
  diameter = leftResult[0] + rightResult[0]
  max_diameter = max(diameter, leftResult[1], rightResult[1])
  return [1 + max(leftResult[0], rightResult[0]), max_diameter]
