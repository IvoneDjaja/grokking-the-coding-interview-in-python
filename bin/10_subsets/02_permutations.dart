void main() {
  List<String> permuteWord(String word) {
    final output = <String>[];

    void backtrack(String permutation) {
      if (permutation.length == word.length) {
        output.add(permutation);
        return;
      }
      for (var i = 0; i < word.length; i++) {
        if (!'$permutation'.contains(word[i])) {
          backtrack('$permutation${word[i]}');
        }
      }
    }

    backtrack('');

    return output;
  }

  /// CASE 1
  print(permuteWord('bad'));
}
