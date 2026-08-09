class TreeNode:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

def serialize(root: TreeNode) -> list[int]:
    if not root:
        return ''
    stream = []
    def dfs(root: TreeNode) -> list[int]:
        if not root:
            stream.append('None')
            return
        stream.append(str(root.val))
        dfs(root.left)
        dfs(root.right)
    dfs(root)
    return ','.join(stream)

def deserialize(data: str) -> TreeNode:
    if data == '':
        return None
    stream = data.split(',')
    index = 0

    def dfs():
        nonlocal index
        if index >= len(stream) or stream[index] == 'None':
            index += 1
            return
        node = TreeNode(int(stream[index]))
        index += 1
        node.left = dfs()
        node.right = dfs()
        return node

    return dfs()
