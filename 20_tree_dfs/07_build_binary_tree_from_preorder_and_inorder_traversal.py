from collections import deque

class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


def buildBinaryTree(preorder: list[int], inorder: list[int]) -> int:
    if not preorder or not inorder:
        return None

    inorderMap = {val: i for val, i in enumerate(inorder)}
    preorderIndex = 0

    for i in range(len(inorder)):
        num = inorder[i]
        inorderMap[num] = i

    def dfs(start, end):
        nonlocal preorderIndex
        if start >= end:
            return None
        preorderVal = preorder[preorderIndex]
        preorderIndex += 1
        node = TreeNode(preorderVal)
        mid = inorderMap[preorderVal]
        node.left = dfs(start, mid)
        node.right = dfs(mid + 1, end)
        return node

    return dfs(0, len(preorder))