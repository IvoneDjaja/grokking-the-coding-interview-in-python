import 'dart:math';

import 'package:collection/collection.dart';

/// Retry: 1
void main() {
  num rangeSum(List<int> nums, int n, int left, int right) {
    final mod = pow(10, 9) + 7;
    final minHeap = HeapPriorityQueue<List<int>>(
      (a, b) => a.first.compareTo(b.first),
    );

    for (var i = 0; i < nums.length; i++) {
      final num = nums[i];
      minHeap.add([num, i]);
    }

    num subarraySum = 0;
    for (var i = 0; i < right; i++) {
      final num = minHeap.removeFirst();
      final sum = num.first;
      final index = num.last;
      if (i >= left - 1) {
        subarraySum = (subarraySum + sum) % mod;
      }
      if (index + 1 < n) {
        minHeap.add([sum + nums[index + 1], index + 1]);
      }
    }

    return subarraySum;
  }

  /// CASE 1
  final input1 = [1, 2, 4, 5, 3];
  final n1 = 5;
  final left1 = 2;
  final right1 = 6;
  print(rangeSum(input1, n1, left1, right1));

  /// CASE 2
  final input2 = [2, 3, 10, 4, 6];
  final n2 = 5;
  final left2 = 4;
  final right2 = 11;
  print(rangeSum(input2, n2, left2, right2));

  /// CASE 3
  final input3 = [1, 1, 1, 1, 1, 1];
  final n3 = 6;
  final left3 = 1;
  final right3 = 21;
  print(rangeSum(input3, n3, left3, right3));
}
