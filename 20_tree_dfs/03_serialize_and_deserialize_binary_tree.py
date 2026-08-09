class TreeNode:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

def serialize(root: TreeNode) -> list[int]:
    if not root:
        return []
    stream = []
    def dfs(root: TreeNode) -> list[int]:
        if not root:
            stream.append(None)
            return
        stream.append(root.val)
        dfs(root.left)
        dfs(root.right)
    dfs(root)		
    return stream

def deserialize(stream: list[int]) -> TreeNode:
    if not stream:
        return None
    index = 0

    def dfs():
        nonlocal index
        if index >= len(stream) or stream[index] is None:
            index += 1
            return
        node = TreeNode(stream[index])
        index += 1
        node.left = dfs()
        node.right = dfs()
        return node

    return dfs()
