void main() {
  String minWindow(String s, String t) {
    final sCount = <String, int>{};
    final tCount = <String, int>{};

    for (var i = 0; i < t.length; i++) {
      final letter = t[i];
      tCount[letter] = (tCount[letter] ?? 0) + 1;
    }

    var startIndex = 0;
    for (var endIndex = 0; endIndex < s.length; endIndex++) {
      final letter = s[endIndex];
      sCount[letter] = (sCount[letter] ?? 0) + 1;
      while (sCount[letter]! > (tCount[letter] ?? 0)) {
        startIndex += 1;
        final startLetter = s[startIndex];
        sCount[startLetter] = (sCount[startLetter] ?? 0) - 1;
      }
      if (endIndex - startIndex + 1 == t.length) {
        return s.substring(startIndex, endIndex + 1);
      }
    }

    return '';
  }

  // CASE 1
  final s1 = 'ABAACBBA';
  final t1 = 'ABC';
  print(minWindow(s1, t1));

  // CASE 2
  final s2 = 'ACBBACA';
  final t2 = 'ABA';
  print(minWindow(s2, t2));

  // CASE 3
  final s3 = 'ABAACBAB';
  final t3 = 'ABCC';
  print(minWindow(s3, t3));
}
