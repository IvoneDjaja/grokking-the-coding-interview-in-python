import 'dart:math';

void main() {
  int longestConsecutiveSequence(List<int> nums) {
    final parentMap = <int, int>{};

    int findParent(int num) {
      var start = num;
      while (parentMap[start] != start) {
        start = parentMap[start]!;
      }
      return start;
    }

    for (var num in nums) {
      parentMap.putIfAbsent(num, () => 0);
      parentMap[num] = num;
    }

    final queue = parentMap.keys.toList();
    while (queue.isNotEmpty) {
      final num = queue.removeAt(0);
      if (num == parentMap[num]) {
        if (parentMap.containsValue(num - 1)) {
          parentMap[num - 1] = findParent(num);
        }
        if (parentMap.containsValue(num + 1)) {
          parentMap[num + 1] = findParent(num);
        }
      }
    }

    var maxLength = 0;
    final countMap = <int, int>{};
    for (var key in parentMap.keys) {
      final value = parentMap[key]!;
      countMap.putIfAbsent(value, () => 0);
      final count = countMap[value]! + 1;
      maxLength = max(maxLength, count);
      countMap[value] = count;
    }

    return maxLength;
  }

  /// CASE 1
  final input1 = [99, 2, 1, 3, 5];
  print(longestConsecutiveSequence(input1));

  /// CASE 2
  final input2 = [99, 1, 5, 67, 13];
  print(longestConsecutiveSequence(input2));

  /// CASE 3
  final input3 = [19, 34, 76];
  print(longestConsecutiveSequence(input3));

  /// CASE 4
  final input4 = [1, 2, 4, 3];
  print(longestConsecutiveSequence(input4));
}
