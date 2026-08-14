class TrieNode:
	def __init__(self):
		self.charMap = {}
		self.isEnd = False

class PrefixTree:

    def __init__(self):
        self.node = TrieNode()

    def insert(self, word: str) -> None:
        n = len(word)
        current = self.node
        for i in range(n):
            char = word[i]
            if char not in current.charMap:
                current.charMap[char] = TrieNode()
            current = current.charMap[char]
        current.isEnd = True

    def search(self, word: str) -> bool:
        n = len(word)
        current = self.node
        for i in range(n):
            char = word[i]
            if char not in current.charMap:
                return False
            current = current.charMap[char]
        return current.isEnd
        
    def startsWith(self, prefix: str) -> bool:
        n = len(prefix)
        current = self.node
        for i in range(n):
            char = prefix[i]
            if char not in current.charMap:
                return False
            current = current.charMap[char]
        return current is not None