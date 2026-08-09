class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


def level_order(root: TreeNode) -> list[list[int]]:
	if not root:
		return []
	queue = deque()
	levels = []
	if root:
		queue.append(root)
	while len(queue) > 0:
		n = len(queue)
		level = []
		for i in range(n):
			current = queue.pop(0)
			level.append(current.data)
			if current.left:
				queue.append(current.left)
			if current.right:
				queue.append(current.right)
		levels.append(level.copy())

	return levels
