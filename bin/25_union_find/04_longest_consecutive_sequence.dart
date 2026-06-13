import 'dart:math';

void main() {
  int longestConsecutiveSequence(List<int> nums) {
    if (nums.isEmpty) return 0;

    final parentMap = <int, int>{};

    int findParent(int num) {
      if (parentMap[num] == num) return num;
      return parentMap[num] = findParent(parentMap[num]!);
    }

    void union(int u, int v) {
      int rootU = findParent(u);
      int rootV = findParent(v);
      if (rootU != rootV) {
        parentMap[rootU] = rootV;
      }
    }

    for (var num in nums) {
      parentMap[num] = num;
    }

    for (var num in parentMap.keys) {
      if (parentMap.containsKey(num + 1)) {
        union(num, num + 1);
      }
    }

    var maxLength = 0;
    final countMap = <int, int>{};
    for (var key in parentMap.keys) {
      final root = findParent(key);
      final count = (countMap[root] ?? 0) + 1;
      countMap[root] = count;
      maxLength = max(maxLength, count);
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
