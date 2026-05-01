import 'package:collection/collection.dart';

void main() {
  int kthSmallestElement(List<List<int>> matrix, int k) {
    final maxHeap = HeapPriorityQueue<int>((a, b) => b.compareTo(a));

    for (var i = 0; i < matrix.length; i++) {
      for (var j = 0; j < matrix[0].length; j++) {
        maxHeap.add(matrix[i][j]);
        if (maxHeap.length == k) {
          maxHeap.removeFirst();
        }
      }
    }

    return maxHeap.removeFirst();
  }

  /// CASE 1
  final matrix1 = [
    [2, 6, 8],
    [3, 6, 10],
    [5, 8, 11],
  ];
  final k1 = 5;
  print(kthSmallestElement(matrix1, k1));
}
