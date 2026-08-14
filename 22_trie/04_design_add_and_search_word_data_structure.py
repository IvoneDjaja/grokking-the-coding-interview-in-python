class TrieNode:
	def __init__(self):
		self.charMap = {}
		self.isEnd = False

class WordDictionary:
    def __init__(self):
        self.root = TrieNode()

    def addWord(self, word):
        current = self.root
        for char in word:
            if char not in current.charMap:
                current.charMap[char] = TrieNode()
            current = current.charMap[char]
        current.isEnd = True

    def search(self, word):
        n = len(word)
        def dfs(index, node):
            if index == n:
                return node.isEnd
            if word[index] in node.charMap:
                return dfs(index + 1, node.charMap[word[index]])
            if word[index] == '.':
                for key in node.charMap:
                    if dfs(index + 1, node.charMap[key]):
                        return True 		
            return False
        return dfs(0, self.root)
