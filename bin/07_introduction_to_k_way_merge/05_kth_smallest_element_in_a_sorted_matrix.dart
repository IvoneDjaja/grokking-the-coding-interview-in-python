import 'dart:math';

import 'package:collection/collection.dart';

void main() {
  int kthSmallestElement(List<List<int>> matrix, int k) {
    var output = 0;
    final minHeap = HeapPriorityQueue<List<int>>(
      (a, b) => a.first.compareTo(b.first),
    );
    var count = 0;

    for (var i = 0; i < min(k, matrix.length); i++) {
      minHeap.add([matrix[i][0], i, 0]);
    }

    while (minHeap.isNotEmpty && count < k) {
      final smallest = minHeap.removeFirst();
      output = smallest.first;
      count += 1;
      final i = smallest[1];
      final j = smallest.last;

      if (j + 1 < matrix.first.length) {
        minHeap.add([matrix[i][j + 1], i, j + 1]);
      }
    }

    return output;
  }

  /// CASE 1
  final matrix1 = [
    [2, 6, 8],
    [3, 6, 10],
    [5, 8, 11],
  ];
  final k1 = 5;
  print(kthSmallestElement(matrix1, k1));

  /// CASE 2
  final matrix2 = [
    [2, 4],
    [3, 6],
  ];
  final k2 = 3;
  print(kthSmallestElement(matrix2, k2));
}
