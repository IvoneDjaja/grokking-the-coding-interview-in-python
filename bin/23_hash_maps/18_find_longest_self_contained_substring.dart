import 'dart:math';

void main() {
  int maxSubstringLength(String s) {
    final first = <String, int>{};
    final last = <String, int>{};

    // 1. Record first and last occurrence of each character
    for (var i = 0; i < s.length; i++) {
      first.putIfAbsent(s[i], () => i);
      last[s[i]] = i;
    }

    var maxLength = -1;

    // 2. Iterate through every possible starting character position 'i'
    for (var i = 0; i < s.length; i++) {
      // A self-contained substring MUST start at the first appearance of its first character.
      if (i != first[s[i]]) continue;

      var end = last[s[i]]!;
      var isValid = true;

      // 3. Expand the window dynamically for all nested characters
      for (var j = i; j <= end; j++) {
        // If an internal character appeared before our start index 'i',
        // then this 'i' can never be a valid starting boundary.
        if (first[s[j]]! < i) {
          isValid = false;
          break;
        }
        // Expand the right boundary to include all occurrences of the nested character
        end = max(end, last[s[j]]!);
      }

      // 4. Update max length ONLY if it's not the entire string
      if (isValid && !(i == 0 && end == s.length - 1)) {
        maxLength = max(maxLength, end - i + 1);
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
