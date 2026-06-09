void main() {
  int findAnagrams(String a, String b) {
    var output = -1;
    if (b.length > a.length) {
      return output;
    }

    List<int> createKey(String string) {
      final stringMap = List.generate(26, (_) => 0);
      for (var i = 0; i < string.length; i++) {
        final char = string[i];
        stringMap[char.codeUnitAt(0) - 97] += 1;
      }
      return stringMap;
    }

    var start = 0;
    var end = b.length - 1;
    final aKey = createKey(a.substring(start, b.length));
    final bKey = createKey(b);
    while (end < a.length) {
      if (aKey.toString() == bKey.toString()) {
        output = start;
        return output;
      }
      aKey[(a[start].codeUnitAt(0)) - 97] -= 1;
      start += 1;
      end += 1;
      if (end < a.length) {
        aKey[(a[end].codeUnitAt(0)) - 97] += 1;
      }
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
