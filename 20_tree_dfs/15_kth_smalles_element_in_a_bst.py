from typing import Optional


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

def kthSmallest(self, root: Optional[TreeNode], k: int) -> int:
        count = 0
        val = None

        def dfs(root: TreeNode):
            nonlocal count
            nonlocal val
            if root is None or val:
                return

            dfs(root.left)
            count += 1
            if count == k:
                val = root.val
                return
            if val:
                dfs(root.right)

        dfs(root)
        return val