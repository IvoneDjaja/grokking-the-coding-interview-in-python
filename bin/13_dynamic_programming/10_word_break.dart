void main() {
  bool wordBreak(String s, Set<String> wordDict) {
    final sArray = List.generate(s.length + 1, (_) => false);
    sArray[s.length] = true;

    for (var i = s.length; i > -1; i--) {
      for (var word in wordDict) {
        if (i + word.length <= s.length &&
            s.substring(i, i + word.length) == word) {
          sArray[i] = sArray[i + word.length];
        }
        if (sArray[i]) {
          break;
        }
      }
    }

    return sArray.first;
  }

  /// CASE 1
  final s1 = 'catsanddog';
  final set1 = {'cat', 'and', 'cats', 'sand', 'dog'};
  print(wordBreak(s1, set1));

  /// CASE 1
  final s2 = 'catsandog';
  final set2 = {'cat', 'and', 'cats', 'sand', 'dog'};
  print(wordBreak(s2, set2));
}
