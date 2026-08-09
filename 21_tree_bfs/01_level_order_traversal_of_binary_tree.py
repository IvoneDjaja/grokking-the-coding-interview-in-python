from collections import deque


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


def level_order(root: TreeNode) -> list[list[int]]:
	if not root:
		return []
	queue = deque([root])
	levels = []
	while len(queue) > 0:
		n = len(queue)
		level = []
		for _ in range(n):
			current = queue.popleft()
			level.append(current.data)
			if current.left:
				queue.append(current.left)
			if current.right:
				queue.append(current.right)
		levels.append(level)

	return levels