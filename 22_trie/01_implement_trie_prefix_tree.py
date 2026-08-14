class TrieNode:
	def __init__(self):
		self.charMap = {}
		self.isEnd = False

class PrefixTree:

    def __init__(self):
        self.node = TrieNode()

    def insert(self, word: str) -> None:
        current = self.node
        for char in word:
            if char not in current.charMap:
                current.charMap[char] = TrieNode()
            current = current.charMap[char]
        current.isEnd = True

    def search(self, word: str) -> bool:
        current = self.node
        for char in word:
            if char not in current.charMap:
                return False
            current = current.charMap[char]
        return current.isEnd
        
    def startsWith(self, prefix: str) -> bool:
        current = self.node
        for char in prefix:
            if char not in current.charMap:
                return False
            current = current.charMap[char]
        return current is not None