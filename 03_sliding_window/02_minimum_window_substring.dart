void main() {
  String minWindow(String s, String t) {
    final countT = <String, int>{};
    for (var i = 0; i < t.length; i++) {
      final letter = t[i];
      countT[letter] = (countT[letter] ?? 0) + 1;
    }

    var resIndex = [-1, -1];
    var resLength = double.maxFinite.toInt();
    for (var i = 0; i < s.length; i++) {
      final countS = <String, int>{};
      for (var j = i; j < s.length; j++) {
        final letter = s[j];
        countS[letter] = 1 + (countS[letter] ?? 0);

        var flag = true;
        for (final tLetter in countT.keys) {
          if (countT[tLetter]! > (countS[tLetter] ?? 0)) {
            flag = false;
            break;
          }
        }

        if (flag && (j - i + 1) < resLength) {
          resLength = j - i + 1;
          resIndex = [i, j + 1];
        }
      }
    }

    return resLength != double.maxFinite.toInt()
        ? s.substring(resIndex.first, resIndex.last)
        : '';
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
