import 'dart:math';

void main() {
  int maxSubstringLength(String s) {
    final first = <String, int>{};
    final last = <String, int>{};
    final n = s.length;

    // 1. Record the absolute boundaries for each character
    for (var i = 0; i < n; i++) {
      first.putIfAbsent(s[i], () => i);
      last[s[i]] = i;
    }

    var maxLength = -1;

    // 2. Iterate through every character's absolute first appearance
    for (final char in first.keys) {
      final i = first[char]!;
      var mx = last[char]!;

      // Scan all the way to the end of the string, dynamically expanding 'mx'
      for (var j = i; j < n; j++) {
        final a = first[s[j]]!;
        final b = last[s[j]]!;

        // If an inner character appears BEFORE our start index, this window is broken
        if (a < i) {
          break;
        }

        // Expand the window boundary to capture all instances of the new character
        mx = max(mx, b);

        // CRITICAL CHECK: If our scan index 'j' matches the current expanded max boundary,
        // and it's a proper substring (less than full length 'n'), update the max length.
        if (mx == j && (j - i + 1) < n) {
          maxLength = max(maxLength, j - i + 1);
        }
      }
    }

    return maxLength;
  }

  /// CASE 1
  final string1 = 'xyyx';
  print(maxSubstringLength(string1));

  /// CASE 2
  final string2 = 'xyxy';
  print(maxSubstringLength(string2));

  /// CASE 3
  final string3 = 'abacd';
  print(maxSubstringLength(string3)); // 3 should be 4

  /// CASE 4
  final string4 = 'aabbcc';
  print(maxSubstringLength(string4)); // 2 should be 4

  /// CASE 5
  final string5 = 'xyzxy';
  print(maxSubstringLength(string5));

  /// CASE 6
  final string6 = 'abcde';
  print(maxSubstringLength(string6)); // 4 should be 4

  /// CASE 7
  final string7 = 'aaaa';
  print(maxSubstringLength(string7));

  /// CASE 8
  final string8 = 'aabccbdd';
  print(maxSubstringLength(string8)); // 4 should be 6
}
