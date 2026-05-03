import 'package:collection/collection.dart';

void main() {
  List<List<int>> kSmallestPairs(List<int> list1, List<int> list2, int k) {
    final output = <List<int>>[];
    final minHeap = HeapPriorityQueue<List<int>>(
      (a, b) => a.first.compareTo(b.first),
    );

    for (var i = 0; i < list1.length; i++) {
      minHeap.add([list1[i] + list2[0], i, 0]);
    }

    while (minHeap.isNotEmpty && output.length < k) {
      final smallest = minHeap.removeFirst();
      final i = smallest[1];
      final j = smallest[2];
      output.add([i, j]);

      if (j + 1 < list2.length) {
        minHeap.add([list1[i] + list2[j + 1], i, j + 1]);
      }
    }

    return output;
  }

  /// CASE 1
  final list11 = [2, 8, 9];
  final list12 = [1, 3, 6];
  final k1 = 3;
  print(kSmallestPairs(list11, list12, k1));
}
