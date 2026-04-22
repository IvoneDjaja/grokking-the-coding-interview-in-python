import 'dart:math';

void main() {
  int findLongestSubstring(String inputString) {
    final count = {};
    var maxSubstringLength = 0;

    var startIndex = 0;
    var endIndex = 0;
    while (endIndex < inputString.length) {
      final endLetter = inputString[endIndex];
      count[endLetter] = (count[endLetter] ?? 0) + 1;

      while (count[endLetter] > 1) {
        final startLetter = inputString[startIndex];
        count[startLetter] = (count[startLetter] ?? 0) - 1;
        startIndex += 1;
      }
      maxSubstringLength = max(maxSubstringLength, endIndex - startIndex + 1);
      endIndex += 1;
    }

    return maxSubstringLength;
  }

  // CASE 1
  final inputString1 = 'hrmimppk';
  print(findLongestSubstring(inputString1));

  // CASE 2
  final inputString2 = 'oooooooooooo';
  print(findLongestSubstring(inputString2));

  // CASE 3
  final inputString3 = 'qrrstr';
  print(findLongestSubstring(inputString3));

  // CASE 4
  final inputString4 = 'hmlchmmem';
  print(findLongestSubstring(inputString4));

  // CASE 5
  final inputString5 = 'a b c a b';
  print(findLongestSubstring(inputString5));

  // CASE 6
  final inputString6 = '123@123';
  print(findLongestSubstring(inputString6));

  // CASE 7
  final inputString7 = 'educativ';
  print(findLongestSubstring(inputString7));
}
