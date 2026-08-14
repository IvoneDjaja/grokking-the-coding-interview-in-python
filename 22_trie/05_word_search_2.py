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
        if node.charMap[char].word:
            output.append(node.charMap[char].word)
            node.charMap[char].word = None

        visited.add((i,j))
        for ni, nj in [(0,-1),(1,0),(0,1),(-1,0)]:
            dfs(i + ni, j + nj, node.charMap[char])
        visited.remove((i,j))       

    for i in range(m):
        for j in range(n):
            if board[i][j] in root.charMap:
                dfs(i, j, root)
    return output