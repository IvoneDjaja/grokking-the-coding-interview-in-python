class TrieNode:
	def __init__(self):
		self.charMap = {}
		self.isEnd = False

def findWords(board: List[List[str]], words: List[str]) -> List[str]:
    m = len(board)
    n = len(board[0])
    root = TrieNode()

    for word in words:
        current = root
        for char in word:
            if char not in current.charMap:
                current.charMap[char] = TrieNode()
            current = current.charMap[char]
        current.word = word

    output = []
    visited = set()
    def dfs(i, j, node):
        if i < 0 or j < 0 or i >= m or j >= n or (i,j) in visited:
            return
        char = board[i][j]
        if char not in node.charMap:
            return
        child = node.charMap[char]
        if child.word:
            output.append(child.word)
            child.word = None

        visited.add((i,j))
        for ni, nj in [(0,-1),(1,0),(0,1),(-1,0)]:
            dfs(i + ni, j + nj, child)
        visited.remove((i,j)) 

        if not child.charMap:
            node.charMap.remove(char)
            

    for i in range(m):
        for j in range(n):
            if board[i][j] in root.charMap:
                dfs(i, j, root)
    return output