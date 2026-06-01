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
    bool dfs(WordDictionary current, int index) {
      if (index == word.length) {
        return current.isEndOfWord;
      }
      final char = word[index];
      final children = current.children;
      if (char == '.') {
        for (final key in children.keys) {
          if (dfs(children[key]!, index + 1)) {
            return true;
          }
        }
        return false;
      } else {
        if (!(children.containsKey(char))) {
          return false;
        }
        current = children[char]!;
        return dfs(current, index + 1);
      }
    }

    return dfs(this, 0);
  }

  List<String> getWords() {
    final output = <String>[];
    void dfs(WordDictionary current, String string) {
      if (current.isEndOfWord) {
        output.add(string);
      }
      final children = current.children;
      for (final key in children.keys) {
        final child = children[key];
        dfs(child!, '$string$key');
      }
    }

    dfs(this, '');
    return output;
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
  print(wd1.getWords());

  /// CASE 2 false negative
  final wd2 = WordDictionary();
  wd2.addWord('bad');
  wd2.addWord('did');
  print(wd2.searchWord('.id'));
  print(wd2.getWords());
}
