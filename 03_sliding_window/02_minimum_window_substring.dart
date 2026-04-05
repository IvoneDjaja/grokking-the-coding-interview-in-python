void main() {
  String minWindow(String s, String t) {
    final countT = <String, int>{};
    final window = <String, int>{};
    for (var i = 0; i < t.length; i++) {
      final letter = t[i];
      countT[letter] = (countT[letter] ?? 0) + 1;
    }

    var startIndex = 0;
    var resIndex = [-1, -1];
    var resLength = double.maxFinite.toInt();
    var count = 0;

    for (var endIndex = 0; endIndex < s.length; endIndex++) {
      final letter = s[endIndex];
      window[letter] = 1 + (window[letter] ?? 0);

      if (countT.keys.contains(letter) && window[letter]! == countT[letter]!) {
        count += 1;
      }

      while (count == countT.length) {
        if (endIndex - startIndex + 1 < resLength) {
          resIndex = [startIndex, endIndex + 1];
          resLength = endIndex - startIndex + 1;
        }

        window[s[startIndex]] = window[s[startIndex]]! - 1;
        if (countT.keys.contains(s[startIndex]) &&
            window[s[startIndex]]! < countT[s[startIndex]]!) {
          count -= 1;
        }
        startIndex += 1;
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
