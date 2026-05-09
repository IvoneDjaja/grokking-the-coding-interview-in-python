void main() {
  List<String> permuteWord(String word) {
    if (word.isEmpty) {
      return [''];
    }

    final perms = permuteWord(word.substring(1));
    final result = <String>[];
    for (var perm in perms) {
      for (var i = 0; i < perm.length + 1; i++) {
        final perm_copy =
            '${perm.substring(0, i)}${word[0]}${perm.substring(i)}';
        result.add(perm_copy);
      }
    }

    return result;
  }

  /// CASE 1
  print(permuteWord('bad'));
}
