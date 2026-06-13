void main() {
  List<int> findAnagrams(String a, String b) {
    var output = <int>[];
    if (b.length > a.length) {
      return output;
    }

    bool isMapEqual(List<int> l1, List<int> l2) {
      for (var i = 0; i < 26; i++) {
        if (l1[i] != l2[i]) {
          return false;
        }
      }
      return true;
    }

    final aCount = List<int>.filled(26, 0);
    final bCount = List<int>.filled(26, 0);
    for (var i = 0; i < b.length; i++) {
      bCount[b.codeUnitAt(i) - 97] += 1;
      aCount[a.codeUnitAt(i) - 97] += 1;
    }

    var start = 0;
    var end = b.length;
    while (end <= a.length) {
      if (isMapEqual(aCount, bCount)) {
        output.add(start);
      }
      if (end < a.length) {
        aCount[a.codeUnitAt(start) - 97] -= 1;
        aCount[a.codeUnitAt(end) - 97] += 1;
      }
      start += 1;
      end += 1;
    }

    return output;
  }

  /// CASE 1
  final a1 = 'hello';
  final b1 = 'hell';
  print(findAnagrams(a1, b1));

  /// CASE 2
  final a2 = 'hello';
  final b2 = 'ol';
  print(findAnagrams(a2, b2));

  /// CASE 3
  final a3 = 'hello';
  final b3 = 'll';
  print(findAnagrams(a3, b3));
}
