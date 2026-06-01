class TrieNode {
  TrieNode({this.isEndOfWord = false}) : children = <String, TrieNode>{};

  Map<String, TrieNode> children;
  bool isEndOfWord;

  void insert(String string) {
    TrieNode current = this;
    for (var i = 0; i < string.length; i++) {
      final char = string[i];
      final children = current.children;
      if (!(children.containsKey(char))) {
        final node = TrieNode();
        children[char] = node;
        current = node;
      } else {
        current = children[char]!;
      }
    }
    current.isEndOfWord = true;
  }

  bool search(String string) {
    TrieNode current = this;
    for (var i = 0; i < string.length; i++) {
      final char = string[i];
      final children = current.children;
      if (!(children.containsKey(char))) {
        return false;
      }
      current = children[char]!;
    }
    return current.isEndOfWord;
  }

  bool searchPrefix(String prefix) {
    TrieNode current = this;
    for (var i = 0; i < prefix.length; i++) {
      final char = prefix[i];
      final children = current.children;
      if (!children.containsKey(char)) {
        return false;
      }
      current = children[char]!;
    }
    return true;
  }
}

void main() {
  /// CASE 1
  final trie1 = TrieNode();
  trie1.insert('bat');
  trie1.insert('bye');
  trie1.insert('ok');
  trie1.insert('cry');
  print(trie1.search('bye'));
  print(trie1.search('con'));
  print(trie1.searchPrefix('ba'));
}
