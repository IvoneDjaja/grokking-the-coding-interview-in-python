import 'dart:math';

void main() {
  int maxSubstringLength(String s) {
    final substringMap = <String, List<int>>{};
    var maxLength = -1;

    // Create substring
    for (var i = 0; i < s.length; i++) {
      final char = s[i];
      substringMap.update(char, (value) {
        value[1] = i;
        return value;
      }, ifAbsent: () => [i, i]);
    }

    // Validate substring
    for (var char in substringMap.keys) {
      final interval = substringMap[char]!;
      final start = interval.first;
      final end = interval.last;
      var index = start;
      print('interval: $interval');
      while (index < end + 1) {
        final current = substringMap[s[index]];
        final currentEnd = current!.last;
        print('currentEnd: $currentEnd');
        if (currentEnd > end || currentEnd == s.length - 1) {
          print('break');
          break;
        }
        index += 1;
      }
      if (index >= end) {
        maxLength = max(maxLength, end - start + 1);
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
  print(maxSubstringLength(string3));

  /// CASE 4
  final string4 = 'aabbcc';
  print(maxSubstringLength(string4));
}
