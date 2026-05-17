import 'dart:math';

void main() {
  bool wordBreak(String s, Set<String> wordDict) {
    final sArray = List.generate(s.length + 1, (_) => false);
    sArray[s.length] = true;

    var maxWordLength = 0;
    for (var word in wordDict) {
      maxWordLength = max(maxWordLength, word.length);
    }

    for (var i = s.length - 1; i > -1; i--) {
      final maxJump = min(s.length, i + maxWordLength);
      for (var j = i + 1; j <= maxJump; j++) {
        if (sArray[j]) {
          final word = s.substring(i, j);
          if (wordDict.contains(word)) {
            sArray[i] = true;
            break;
          }
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
