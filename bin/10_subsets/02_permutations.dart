void main() {
  /// Retry: 1
  List<String> permuteWord1(String word) {
    if (word.isEmpty) {
      return [''];
    }

    final perms = permuteWord1(word.substring(1));
    final result = <String>[];
    for (var perm in perms) {
      for (var i = 0; i < perm.length + 1; i++) {
        final permCopy =
            '${perm.substring(0, i)}${word[0]}${perm.substring(i)}';
        result.add(permCopy);
      }
    }

    return result;
  }

  List<String> permuteWord2(String word) {
    var perms = [''];
    for (var j = 0; j < word.length; j++) {
      final newPerms = <String>[];
      for (var perm in perms) {
        for (var i = 0; i < perm.length + 1; i++) {
          final permCopy =
              '${perm.substring(0, i)}${word[j]}${perm.substring(i)}';
          newPerms.add(permCopy);
        }
      }
      perms = newPerms;
    }

    return perms;
  }

  /// CASE 1
  print(permuteWord1('bad'));
  print(permuteWord2('bad'));
}
