class WordDictionary {
  WordDictionary({this.isEndOfWord = false})
    : children = <String, WordDictionary>{};
  Map<String, WordDictionary> children;
  bool isEndOfWord;

  void addWord(String word) {
    var current = this;
    for (var i = 0; i < word.length; i++) {
      final char = word[i];
      final children = current.children;
      if (!children.containsKey(char)) {
        final node = WordDictionary();
        children[char] = node;
      }
      current = children[char]!;
    }
    current.isEndOfWord = true;
  }

  bool searchWord(String word) {
    WordDictionary current = this;
    bool searchIndex(int index) {
      final char = word[index];
      final children = current.children;
      if (char == '.') {
        for (final key in children.keys) {
          current = children[key]!;
          if (index == word.length - 1) {
            return current.isEndOfWord;
          }
          if (searchIndex(index + 1)) {
            return true;
          } else {
            return false;
          }
        }
      } else {
        if (!(children.containsKey(char))) {
          return false;
        }
        current = children[char]!;
        if (index == word.length - 1) {
          return current.isEndOfWord;
        }
        return searchIndex(index + 1);
      }

      return false;
    }

    return searchIndex(0);
  }
}

void main() {
  /// CASE 1
  final wd1 = WordDictionary();
  wd1.addWord('bin');
  wd1.addWord('data');
  print(wd1.searchWord('bin'));
  print(wd1.searchWord('bi'));
  print(wd1.searchWord('.in'));
  print(wd1.searchWord('.n'));
  print(wd1.searchWord('d.t.'));

  /// CASE 2 false negative
  final wd2 = WordDictionary();
  wd2.addWord('bad');
  wd2.addWord('did');
  print(wd2.searchWord('.id'));
}
