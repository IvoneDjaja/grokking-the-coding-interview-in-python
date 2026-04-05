import 'dart:math';

void main() {
  int longestRepeatingCharacterReplacement(List<String> s, int k) {
    final countSet = <String, int>{};

    var startIndex = 0;
    var maxCount = 0;
    var maxSubstringLength = 0;

    for (var endIndex = 0; endIndex < s.length; endIndex++) {
      final letter = s[endIndex];
      countSet[letter] = (countSet[letter] ?? 0) + 1;

      maxCount = max(maxCount, countSet[letter]!);

      while ((endIndex - startIndex + 1) - maxCount > k) {
        final letter = s[startIndex];
        countSet[letter] = countSet[letter]! - 1;
        startIndex += 1;
      }

      maxSubstringLength = max(maxSubstringLength, endIndex - startIndex + 1);
    }

    return maxSubstringLength;
  }

  // CASE 1
  final s1 = ['A', 'A', 'B', 'C', 'C', 'B', 'B'];
  final k1 = 2;
  print(longestRepeatingCharacterReplacement(s1, k1));

  // CASE 2
  final s2 = ['F', 'Z', 'F', 'Z', 'F', 'Z'];
  final k2 = 6;
  print(longestRepeatingCharacterReplacement(s2, k2));

  // CASE 3
  final s3 = ['X', 'X', 'X', 'X', 'X'];
  final k3 = 1;
  print(longestRepeatingCharacterReplacement(s3, k3));

  // CASE 4
  final s4 = ['L', 'M', 'N', 'O'];
  final k4 = 2;
  print(longestRepeatingCharacterReplacement(s4, k4));

  // CASE 5
  final s5 = ['A', 'A', 'A', 'C', 'B', 'B', 'B', 'A', 'A', 'B', 'A', 'B'];
  final k5 = 2;
  print(longestRepeatingCharacterReplacement(s5, k5));

  // CASE 6
  final s6 = ['A', 'B', 'B', 'C', 'A', 'B'];
  final k6 = 2;
  print(longestRepeatingCharacterReplacement(s6, k6));

  // CASE 7
  final s7 = ['D', 'I', 'P', 'P', 'I', 'T', 'Y', 'D', 'I', 'P'];
  final k7 = 4;
  print(longestRepeatingCharacterReplacement(s7, k7));

  // CASE 8
  final s8 = ['C', 'O', 'O', 'L', 'L', 'O', 'O', 'C'];
  final k8 = 2;
  print(longestRepeatingCharacterReplacement(s8, k8));
}
